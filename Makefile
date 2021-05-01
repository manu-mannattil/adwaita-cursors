SIZES ?= 24 30 36 42 48 54 60 66 72 78 84 90 96

CURSORS = all-scroll bd_double_arrow bottom_left_corner bottom_right_corner \
bottom_side bottom_tee circle context-menu copy crossed_circle crosshair \
cross dnd-ask dnd-copy dnd-link dnd-move dnd-no-drop dnd-none dotbox \
fd_double_arrow grabbing hand1 hand2 left_ptr left_ptr_watch left_side \
left_tee link ll_angle lr_angle move pencil plus pointer-move question_arrow \
right_ptr right_side right_tee sb_down_arrow sb_h_double_arrow sb_left_arrow \
sb_right_arrow sb_up_arrow sb_v_double_arrow tcross top_left_corner \
top_right_corner top_side top_tee ul_angle ur_angle vertical-text watch \
X_cursor xterm zoom-in zoom-out

all: png
	./genin.py $(SIZES)
	mkdir -p Adwaita/cursors
	for c in $(CURSORS); do \
	  xcursorgen $${c}.in Adwaita/cursors/$${c}; \
	done

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

distclean: clean
	rm -rf png

.PHONY: clean distclean tarball
.ONESHELL:
