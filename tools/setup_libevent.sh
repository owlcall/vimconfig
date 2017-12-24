#!/usr/bin/env bash
#
# setup_tmux.sh 
# Copyright (c) 2017 owl
#

# ----- libevent -----
# Latest release: https://github.com/libevent/libevent/releases/latest
curl -L https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz > libevent.tar.gz
tar vxf libevent*
rm libevent.tar.gz
cd libevent*
export CPPFLAGS="-I/opt/local/include"
./configure
make -j 4
cd ..

