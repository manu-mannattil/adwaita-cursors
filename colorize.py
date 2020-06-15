#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# This script will colorize adwaita.svg and produce colored cursors.
# E.g., to make red-colored cursors:
#
#   ./colorize.py "#ff0000" >adwaita_red.svg
#

import re, sys


def hex2rgb(color):
    """Convert hex string to RGB tuple."""
    return [int(color[i : i + 2], 16) for i in (1, 3, 5)]


def rgb2hex(rgb):
    """Convert RGB tuple to hex string."""
    return "#{:02x}{:02x}{:02x}".format(*rgb)


def colorize(match):
    """Colorize each matched color."""
    color = hex2rgb(match.group(1))
    # Gimp's "lighten only" algorithm.
    # https://docs.gimp.org/en/gimp-concepts-layer-modes.html
    for i in range(3):
        if color[i] < desired[i]:
            color[i] = desired[i]

    return rgb2hex(color)


if __name__ == "__main__":
    with open("adwaita.svg") as f:
        xml = f.read()

    if len(sys.argv) > 1:
        desired = hex2rgb(sys.argv[1])
    else:
        desired = hex2rgb("#000000")

    xml = re.sub(r"#(\d{6})", colorize, xml)
    print(xml, file=sys.stdout)
