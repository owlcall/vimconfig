#!/usr/bin/env bash
#
# setup_tmux.sh 
# Copyright (c) 2017 owl
#

ROOT=$( cd "$( dirname "$0" )" && pwd )
cd $ROOT

# ----- ncurses -----
# Latest release: https://ftp.gnu.org/gnu/ncurses/
curl -L https://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz > ncurses.tar.gz
tar vxf ncurses*
rm ncurses.tar.gz
cd ncurses*
export CPPFLAGS="-P"
export CFLAGS="-I/$ROOT/../include/"
export LDFLAGS="-L/$ROOT/../lib/"
./configure --disable-debug --prefix=$(realpath $ROOT/../) \
            --mandir=$(realpath $ROOT/../)/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --enable-pc-files       \
            --enable-widec
make -j 4
make install
cd ..

