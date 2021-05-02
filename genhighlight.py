#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Written by Ulrich Drepper <drepper@redhat.com>, 2021.
import sys
import os
import pathlib
# Unfortunately the PNG module is just named 'png' which conflicts with the local directory.
#sys.path = [d for d in sys.path if d != '']
import png

# Start configurations

# Which RGBA color to use for highlighting.
highlight = [255,255,0,128]
# Radius of the highlight circle as a fraction of the cursor size.
radius_fraction = 1 / 2
# Name of the output directory for the rewritten PNG files.
pngdir = 'png_hl'

# End configurations

# These values describe the image format and are not really configurable.
pixeldepth = 8
maxpixel = 2**pixeldepth-1
pixelsize = 4
assert len(highlight) == pixelsize

# Check whether the highlight color is valid, adjust from float format if necessary.
if not all([isinstance(c, int) and c >= 0 and c <= maxpixel for c in highlight]):
    if all([(isinstance(c, int) or isinstance(c, float)) and c >= 0 and c <= 1.0 for c in highlight]):
        highlight = [ int(maxpixel * c) for c in highlight ]
    else:
        raise Exception('invalid highlight color {}'.format(highlight))

if not pathlib.Path(pngdir).exists():
    os.mkdir(pngdir)

for _fname in sys.argv[1:]:
    fname = pathlib.Path(_fname)
    with open(fname, 'r') as f:
        outconf = fname.parent / (fname.stem + '_hl' + fname.suffix)
        with open(outconf, 'w') as conffd:
            lines = [ l.strip() for l in f.readlines() ]
            for line in lines:
                fields = line.split()
                size = int(fields[0])
                xhot = int(fields[1])
                yhot = int(fields[2])
                fname = fields[3]
                tmo = None if len(fields) == 4 else fields[4]

                radius = int(size * radius_fraction)
                radius_sq = int(size**2 * radius_fraction**2)

                path = pathlib.Path(fname)
                outfname = pathlib.Path(pngdir, *path.parts[1:])

                with open(fname, 'rb') as fpng:
                    inpng = png.Reader(fpng)
                    indata = inpng.read()

                    # The size of the original image.
                    origw = indata[3]['size'][0]
                    origh = indata[3]['size'][1]

                    # Determine how much space to add on each side for the highlight circle.
                    addl = max(0, radius-xhot)
                    addr = max(0, xhot+radius+1-size)
                    addt = max(0, radius-yhot)
                    addb = max(0, yhot+radius+1-size)

                    # The size of the new image.
                    neww = origw + addr + addl
                    newh = origh + addb + addt

                    if neww == origw and newh == origh:
                        # The new image has the same size.  Change format to list of lists.
                        bytes = [ list(row) for row in indata[2] ]
                    else:
                        # Construct a new list of list with the pixel values of old image, padded appropriately.
                        bytes = []
                        for _ in range(addt):
                            bytes.append([0]*(neww*pixelsize))
                        for r in indata[2]:
                            row = [0]*(addl*pixelsize) + list(r) + [0]*(addr*pixelsize)
                            bytes.append(row)
                        for _ in range(addb):
                            bytes.append([0]*(neww*pixelsize))
                        assert len(bytes) == newh, '{}: {} instead of {}'.format(fname, len(bytes), newh)
                        for r in bytes:
                            assert len(r) == neww*pixelsize, '{}: {} instead of {}'.format(fname, len(r), neww*pixelsize)

                    # Move the hotspot, if necessary.
                    xhot += addl
                    yhot += addt

                    # Add in the highlight circle using color blending.
                    for y in range(yhot-radius, yhot+radius+1):
                        for x in range(xhot-radius, xhot+radius+1):
                            ox = xhot - x
                            oy = yhot - y
                            # Determine whether this point is at the inside of the circle.
                            if oy**2+ox**2<=radius_sq:
                                # Original image color.
                                curcol = bytes[y][x*pixelsize:(x+1)*pixelsize]
                                # Porter-Duff blending.
                                alpha_a = curcol[3] / maxpixel
                                alpha_b = highlight[3] / maxpixel
                                fact1 = alpha_a
                                fact2 = (1 - alpha_a) * alpha_b
                                alpha_c = fact1 + fact2
                                # Compute the new color.  Use min in case some rounding error causes problems.
                                newcol = [ min(maxpixel, int((fact1 * curcol[i] + fact2 * highlight[i]) / alpha_c)) for i in range(3) ] + [ int(alpha_c * maxpixel) ]
                                bytes[y][x*pixelsize:(x+1)*pixelsize] = newcol

                    if not outfname.parent.exists():
                        os.mkdir(outfname.parent)

                    with open(outfname, 'wb') as outfd:
                        outpng = png.Writer(neww, newh, greyscale=False, alpha=True, bitdepth=pixeldepth)
                        outpng.write(outfd, bytes)

                    if tmo:
                        conffd.write('{} {} {} {} {}\n'.format(size, xhot, yhot, outfname, tmo))
                    else:
                        conffd.write('{} {} {} {}\n'.format(size, xhot, yhot, outfname))
