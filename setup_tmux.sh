#!/usr/bin/env bash
#
# setup_tmux.sh 
# Copyright (c) 2017 owl
#

# ----- tmux -----
# Latest release: https://github.com/tmux/tmux/releases
curl -L https://github.com/tmux/tmux/releases/download/2.5/tmux-2.5.tar.gz > tmux.tar.gz
tar vxf tmux.tar.gz
rm tmux.tar.gz
cd tmux-2.5
./configure LDFLAGS='-Wl,-rpath,/usr/local/lib'
make -j 4
cd ..

