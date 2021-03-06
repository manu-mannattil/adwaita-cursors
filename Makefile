SIZES ?= 24 30 36 42 48 54 60 66 72 78 84 90 96

all: png
	./genin.py $(SIZES)
	mkdir -p Adwaita/cursors
	xcursorgen   all-scroll.in            Adwaita/cursors/all-scroll
	xcursorgen   bd_double_arrow.in       Adwaita/cursors/bd_double_arrow
	xcursorgen   bottom_left_corner.in    Adwaita/cursors/bottom_left_corner
	xcursorgen   bottom_right_corner.in   Adwaita/cursors/bottom_right_corner
	xcursorgen   bottom_side.in           Adwaita/cursors/bottom_side
	xcursorgen   bottom_tee.in            Adwaita/cursors/bottom_tee
	xcursorgen   circle.in                Adwaita/cursors/circle
	xcursorgen   context-menu.in          Adwaita/cursors/context-menu
	xcursorgen   copy.in                  Adwaita/cursors/copy
	xcursorgen   crossed_circle.in        Adwaita/cursors/crossed_circle
	xcursorgen   crosshair.in             Adwaita/cursors/crosshair
	xcursorgen   cross.in                 Adwaita/cursors/cross
	xcursorgen   dnd-ask.in               Adwaita/cursors/dnd-ask
	xcursorgen   dnd-copy.in              Adwaita/cursors/dnd-copy
	xcursorgen   dnd-link.in              Adwaita/cursors/dnd-link
	xcursorgen   dnd-move.in              Adwaita/cursors/dnd-move
	xcursorgen   dnd-no-drop.in           Adwaita/cursors/dnd-no-drop
	xcursorgen   dnd-none.in              Adwaita/cursors/dnd-none
	xcursorgen   dotbox.in                Adwaita/cursors/dotbox
	xcursorgen   fd_double_arrow.in       Adwaita/cursors/fd_double_arrow
	xcursorgen   grabbing.in              Adwaita/cursors/grabbing
	xcursorgen   hand1.in                 Adwaita/cursors/hand1
	xcursorgen   hand2.in                 Adwaita/cursors/hand2
	xcursorgen   left_ptr.in              Adwaita/cursors/left_ptr
	xcursorgen   left_ptr_watch.in        Adwaita/cursors/left_ptr_watch
	xcursorgen   left_side.in             Adwaita/cursors/left_side
	xcursorgen   left_tee.in              Adwaita/cursors/left_tee
	xcursorgen   link.in                  Adwaita/cursors/link
	xcursorgen   ll_angle.in              Adwaita/cursors/ll_angle
	xcursorgen   lr_angle.in              Adwaita/cursors/lr_angle
	xcursorgen   move.in                  Adwaita/cursors/move
	xcursorgen   pencil.in                Adwaita/cursors/pencil
	xcursorgen   plus.in                  Adwaita/cursors/plus
	xcursorgen   pointer-move.in          Adwaita/cursors/pointer-move
	xcursorgen   question_arrow.in        Adwaita/cursors/question_arrow
	xcursorgen   right_ptr.in             Adwaita/cursors/right_ptr
	xcursorgen   right_side.in            Adwaita/cursors/right_side
	xcursorgen   right_tee.in             Adwaita/cursors/right_tee
	xcursorgen   sb_down_arrow.in         Adwaita/cursors/sb_down_arrow
	xcursorgen   sb_h_double_arrow.in     Adwaita/cursors/sb_h_double_arrow
	xcursorgen   sb_left_arrow.in         Adwaita/cursors/sb_left_arrow
	xcursorgen   sb_right_arrow.in        Adwaita/cursors/sb_right_arrow
	xcursorgen   sb_up_arrow.in           Adwaita/cursors/sb_up_arrow
	xcursorgen   sb_v_double_arrow.in     Adwaita/cursors/sb_v_double_arrow
	xcursorgen   tcross.in                Adwaita/cursors/tcross
	xcursorgen   top_left_corner.in       Adwaita/cursors/top_left_corner
	xcursorgen   top_right_corner.in      Adwaita/cursors/top_right_corner
	xcursorgen   top_side.in              Adwaita/cursors/top_side
	xcursorgen   top_tee.in               Adwaita/cursors/top_tee
	xcursorgen   ul_angle.in              Adwaita/cursors/ul_angle
	xcursorgen   ur_angle.in              Adwaita/cursors/ur_angle
	xcursorgen   vertical-text.in         Adwaita/cursors/vertical-text
	xcursorgen   watch.in                 Adwaita/cursors/watch
	xcursorgen   X_cursor.in              Adwaita/cursors/X_cursor
	xcursorgen   xterm.in                 Adwaita/cursors/xterm
	xcursorgen   zoom-in.in               Adwaita/cursors/zoom-in
	xcursorgen   zoom-out.in              Adwaita/cursors/zoom-out

	# Now make cursor aliases.
	cd Adwaita/cursors;                                                \
	ln   -sf   bd_double_arrow       c7088f0f3e6c8088236ef8e1e3e70000; \
	ln   -sf   bd_double_arrow       nwse-resize;                      \
	ln   -sf   bd_double_arrow       size_fdiag;                       \
	ln   -sf   bottom_left_corner    sw-resize;                        \
	ln   -sf   bottom_right_corner   se-resize;                        \
	ln   -sf   bottom_side           s-resize;                         \
	ln   -sf   copy                  1081e37283d90000800003c07f3ef6bf; \
	ln   -sf   copy                  6407b0e94181790501fd1e167b474872; \
	ln   -sf   cross                 cross_reverse;                    \
	ln   -sf   cross                 diamond_cross;                    \
	ln   -sf   crossed_circle        03b6e0fcb3499374a867c041f52298f0; \
	ln   -sf   crossed_circle        forbidden;                        \
	ln   -sf   crossed_circle        not-allowed;                      \
	ln   -sf   dnd-link              alias;                            \
	ln   -sf   dnd-no-drop           no-drop;                          \
	ln   -sf   dotbox                dot_box_mask;                     \
	ln   -sf   dotbox                draped_box;                       \
	ln   -sf   dotbox                icon;                             \
	ln   -sf   dotbox                target;                           \
	ln   -sf   fd_double_arrow       fcf1c3c7cd4491d801f1e1c78f100000; \
	ln   -sf   fd_double_arrow       nesw-resize;                      \
	ln   -sf   fd_double_arrow       size_bdiag;                       \
	ln   -sf   grabbing              closedhand;                       \
	ln   -sf   all-scroll            fleur;                            \
	ln   -sf   all-scroll            size_all;                         \
	ln   -sf   hand1                 grab;                             \
	ln   -sf   hand2                 9d800788f1b08800ae810202380a0822; \
	ln   -sf   hand2                 e29285e634086352946a0e7090d73106; \
	ln   -sf   hand2                 hand;                             \
	ln   -sf   hand2                 pointer;                          \
	ln   -sf   hand2                 pointing_hand;                    \
	ln   -sf   left_ptr              arrow;                            \
	ln   -sf   left_ptr              default;                          \
	ln   -sf   left_ptr              openhand;                         \
	ln   -sf   left_ptr              top_left_arrow;                   \
	ln   -sf   left_ptr_watch        08e8e1c95fe2fc01f976f1e063a24ccd; \
	ln   -sf   left_ptr_watch        3ecb610c1bf2410f44200f48c40d3599; \
	ln   -sf   left_ptr_watch        progress;                         \
	ln   -sf   left_side             w-resize;                         \
	ln   -sf   link                  3085a0e285430894940527032f8b26df; \
	ln   -sf   link                  640fb0e74195791501fd1ed57b41487f; \
	ln   -sf   move                  4498f0e0c1937ffe01fd06f973665830; \
	ln   -sf   move                  9081237383d90e509aa00f00170e968f; \
	ln   -sf   question_arrow        5c6cd98b3f3ebcb1f9c7f1c204630408; \
	ln   -sf   question_arrow        d9ce0ab605698f320427677b458ad60b; \
	ln   -sf   question_arrow        help;                             \
	ln   -sf   question_arrow        left_ptr_help;                    \
	ln   -sf   question_arrow        whats_this;                       \
	ln   -sf   right_ptr             draft_large;                      \
	ln   -sf   right_ptr             draft_small;                      \
	ln   -sf   right_side            e-resize;                         \
	ln   -sf   sb_h_double_arrow     028006030e0e7ebffc7f7070c0600140; \
	ln   -sf   sb_h_double_arrow     14fef782d02440884392942c11205230; \
	ln   -sf   sb_h_double_arrow     col-resize;                       \
	ln   -sf   sb_h_double_arrow     ew-resize;                        \
	ln   -sf   sb_h_double_arrow     h_double_arrow;                   \
	ln   -sf   sb_h_double_arrow     size_hor;                         \
	ln   -sf   sb_h_double_arrow     split_h;                          \
	ln   -sf   sb_up_arrow           up_arrow;                         \
	ln   -sf   sb_v_double_arrow     00008160000006810000408080010102; \
	ln   -sf   sb_v_double_arrow     2870a09082c103050810ffdffffe0204; \
	ln   -sf   sb_v_double_arrow     double_arrow;                     \
	ln   -sf   sb_v_double_arrow     ns-resize;                        \
	ln   -sf   sb_v_double_arrow     row-resize;                       \
	ln   -sf   sb_v_double_arrow     size_ver;                         \
	ln   -sf   sb_v_double_arrow     split_v;                          \
	ln   -sf   sb_v_double_arrow     v_double_arrow;                   \
	ln   -sf   top_left_corner       nw-resize;                        \
	ln   -sf   top_right_corner      ne-resize;                        \
	ln   -sf   top_side              n-resize;                         \
	ln   -sf   watch                 wait;                             \
	ln   -sf   X_cursor              pirate;                           \
	ln   -sf   xterm                 ibeam;                            \
	ln   -sf   xterm                 text

png: adwaita.svg
	./renderpng.py $^ $(SIZES)

tarball:
	rm -f ../adwaita-cursors.tar.gz
	tar --exclude='.git*' -cvzf ../adwaita-cursors.tar.gz ../$(notdir $(CURDIR))
clean:
	rm -f *.in
	rm -rf Adwaita/cursors

distclean:
	rm -f *.in
	rm -rf Adwaita/cursors
	rm -rf png

.PHONY: clean distclean tarball
