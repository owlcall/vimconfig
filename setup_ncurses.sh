#!/usr/bin/env bash
#
# setup_tmux.sh 
# Copyright (c) 2017 owl
#

rm -rf temp_tmux
mkdir temp_tmux
cd temp_tmux

# ----- ncurses -----
# Latest release: https://ftp.gnu.org/gnu/ncurses/
curl -L https://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz > ncurses.tar.gz
tar vxf ncurses*
cd ncurses*
export CPPFLAGS="-P"
./configure --prefix=/usr/local
make -j 4
cd ..

