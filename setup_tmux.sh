#!/usr/bin/env bash
#
# setup_tmux.sh 
# Copyright (c) 2017 owl
#

rm -rf temp_tmux
mkdir temp_tmux
cd temp_tmux

# ----- libevent -----
# Latest release: https://github.com/libevent/libevent/releases/latest
curl -L https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz > libevent.tar.gz
tar vxf libevent*
cd libevent*
./configure --prefix=/usr/local
make -j 4
make install
cd ..

# ----- ncurses -----
# Latest release: https://ftp.gnu.org/gnu/ncurses/
curl -L https://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz > ncurses.tar.gz
tar vxf ncurses*
cd ncurses*
./configure --prefix=/usr/local
make -j 4
make install
cd ..

# ----- tmux -----
# Latest release: https://github.com/tmux/tmux/releases
curl -L https://github.com/tmux/tmux/releases/download/2.5/tmux-2.5.tar.gz > tmux.tar.gz
tar vxf tmux*
cd tmux*
./configure --prefix=/usr/local
make -j 4
make install
cd ..

