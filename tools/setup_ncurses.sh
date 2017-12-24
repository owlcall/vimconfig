#!/usr/bin/env bash
#
# setup_tmux.sh 
# Copyright (c) 2017 owl
#

# ----- ncurses -----
# Latest release: https://ftp.gnu.org/gnu/ncurses/
curl -L https://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz > ncurses.tar.gz
tar vxf ncurses*
rm ncurses.tar.gz
cd ncurses*
export CPPFLAGS="-P"
./configure
make -j 4
cd ..

