#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# This script will colorize adwaita.svg and produce colored cursors.
# As an example, to make red-colored cursors, first colorize the source
# SVG:
#
#   ./colorize.py "#ff0000" >adwaita-red.svg
#
# Then replace the source SVG with the colorized one and run make after
# a distclean.
#
#   mv -f adwaita-red.svg adwaita.svg
#   make distclean
#   make
#
# Finally, edit the .theme files in the "Adwaita" directory to reflect
# the color change and change the directory name as well.
#

import re, sys
import xml.etree.ElementTree as ET


NAMESPACE = {
    "": "http://www.w3.org/2000/svg",
    "cc": "http://creativecommons.org/ns#",
    "dc": "http://purl.org/dc/elements/1.1/",
    "inkscape": "http://www.inkscape.org/namespaces/inkscape",
    "rdf": "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
    "sodipodi": "http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd",
    "xlink": "http://www.w3.org/1999/xlink",
}

for prefix, uri in NAMESPACE.items():
    ET.register_namespace(prefix, uri)


class Colorizer:
    def hex2rgb(self, color):
        """Convert hex string to RGB tuple."""
        return [int(color[i : i + 2], 16) for i in (1, 3, 5)]

    def rgb2hex(self, rgb):
        """Convert RGB tuple to hex string."""
        return "#{:02x}{:02x}{:02x}".format(*rgb)

    def repl(self, match):
        """Colorize each matched color."""
        # Gimp's "lighten only" algorithm.
        # https://docs.gimp.org/en/gimp-concepts-layer-modes.html
        color = self.hex2rgb(match.group(1))
        for i in range(3):
            if color[i] < self.desired[i]:
                color[i] = self.desired[i]

        return self.rgb2hex(color)

    def colorize(self, name):
        """Colorize each hex color match in the file."""
        tree = ET.parse(name)
        root = tree.getroot()

        for layer in root:
            # Only change the colors in the definitions and the "cursor" layer.
            if layer.attrib["id"] in ("defs4", "layer1"):
                for child in layer.findall(".//*[@style]", NAMESPACE):
                    # Technically, we should be replacing all hex colors, but
                    # for reasons I don't have time to investigate, using
                    # [0-9a-f] in the regex produces a yellow haze.
                    child.attrib["style"] = re.sub(
                        r"#(\d{6})", self.repl, child.attrib["style"]
                    )

        return ET.tostring(root, encoding="unicode")

    def __init__(self, desired):
        self.desired = self.hex2rgb(desired)


if __name__ == "__main__":
    if len(sys.argv) > 1:
        col = Colorizer(sys.argv[1])
    else:
        col = Colorizer("#000000")

    print(col.colorize("adwaita.svg"), file=sys.stdout)
