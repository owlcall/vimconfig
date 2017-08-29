#!/usr/bin/env bash
#
# setup_tmux.sh 
# Copyright (c) 2017 owl
#

# ----- tmux -----
# Latest release: https://github.com/tmux/tmux/releases
curl -L https://github.com/tmux/tmux/releases/download/2.5/tmux-2.5.tar.gz > tmux.tar.gz
tar vxf tmux*
rm tmux.tar.gz
cd tmux-2.5
export DIR="/usr/local"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DIR/lib
./configure --prefix=$DIR CFLAGS="-I$DIR/include" LDFLAGS="-L$DIR/lib"
make -j 4
cd ..

