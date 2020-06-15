#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# This script will colorize adwaita.svg and produce colored cursors.
# E.g., to make red-colored cursors:
#
#   ./colorize.py "#ff0000" >adwaita-red.svg
#

import re, sys


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
        with open(name) as fd:
            content = fd.read()

        return re.sub(r"#(\d{6})", self.repl, content)

    def __init__(self, desired):
        self.desired = self.hex2rgb(desired)


if __name__ == "__main__":
    if len(sys.argv) > 1:
        col = Colorizer(sys.argv[1])
    else:
        col = Colorizer("#000000")

    print(col.colorize("adwaita.svg"), file=sys.stdout)
