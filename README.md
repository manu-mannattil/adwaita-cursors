# Adwaita cursors for HiDPI displays

GNOME officially provides the [Adwaita cursor theme][1] only in sizes
24, 32, 48, 64, and 96.  This is inconvenient if you use displays that
require fractional scaling, e.g., on a WQHD display, a size 48 cursor
would look too big and one would ideally require a size 42 (= 24 * 1.75)
cursor.  Thus, this repository provides cursors in intermediate sizes
24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84, 90, and 96.

In addition to this, new symlinks have been created to provide for
missing [Qt 5 cursors][3], e.g., `openhand` and `closedhand`, that are
required by some Qt 5 applications like qpdfview.  Some symlinks have
been adapted from Fedora Project's [patches][4] to the DMZ cursor
package, which also adds [CSS cursor values][5].

## Installation

To install without generating the cursors yourself, download the tarball
of the latest [release][2] and copy the theme to the appropriate
directory, e.g.,

    tar xvzf adwaita-cursors.tar.gz
    mkdir -p ~/.icons/default
    mv adwaita-cursors/Adwaita/cursors ~/.icons/default

and set the desired cursor size in `~/.Xresources`, e.g.,

    Xcursor.theme: default
    Xcursor.size: 42

However, typically one doesn't need cursors in all the intermediate
sizes.  Cursor files with several possible cursor sizes would also be
very large.  To generate cursors only for specific sizes, run `make`
with `SIZES` as an environment variable from the source directory, e.g.,

    SIZES='24 42' make

This requires xcursorgen and Python.  To generate the cursors completely
from scratch, including the PNG files, clone the repository and run
`make`.  Note that you will also need Inkscape for this.

## See also

[DMZ cursors in various sizes][6]

## License

See the file LICENSE for more details.

[1]: https://github.com/GNOME/adwaita-icon-theme
[2]: https://github.com/manu-mannattil/adwaita-cursors/releases
[3]: https://doc.qt.io/qt-5/qcursor.html
[4]: https://src.fedoraproject.org/rpms/dmz-cursor-themes/blob/master/f/dmz-cursor-themes-symbolic-links.patch
[5]: https://developer.mozilla.org/en-US/docs/Web/CSS/cursor
[6]: https://github.com/ganwell/dmz-cursors
