#!/usr/bin/env bash
#
# setup_tmux.sh 
# Copyright (c) 2017 owl
#

ROOT=$(cd "$(dirname "$0")" && pwd)

# ----- tmux -----
# Latest release: https://github.com/tmux/tmux/releases
VER_TMUX_MIN=2.5
VER_TMUX_NOW=`tmux -V | sed 's/^.* \(.*\)/\1/'`
#VER_IS_GOOD=$(echo "$VER_TMUX_NOW >= $VER_TMUX_MIN" | bc -l 2>/dev/null)

# Only update tmux if it is neccessary
if [[ "$VER_IS_GOOD" != "1" ]]; then
	curl -L https://github.com/tmux/tmux/releases/download/2.5/tmux-2.5.tar.gz > tmux.tar.gz
	tar vxf tmux.tar.gz
	rm tmux.tar.gz
	cd tmux-2.5
	./configure --prefix="$ROOT/../" CFLAGS="-I$ROOT/../include -I$ROOT/../include/ncurses" LDFLAGS="-L$ROOT/../lib/ -Wl,-rpath,$ROOT/../lib"
	make -j 4
	make install
	cd ..
	echo "Done; Please continue accordingly"
else
	echo "Detected tmux: $VER_TMUX_NOW"
fi

if ! [ -d tmux-MacOSX* ] ; then
	cd $ROOT
	git clone https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard.git
	cd tmux-MacOSX-pasteboard
	https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard.git
	make -j 2
	cp reattach-to-user-namespace ../../bin/
	cd ..
else
	echo "Detected tmux MacOSX pasteboard implementation"
fi

