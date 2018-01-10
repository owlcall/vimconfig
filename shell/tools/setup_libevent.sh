#!/usr/bin/env bash
#
# setup_tmux.sh 
# Copyright (c) 2017 owl
#

ROOT=$( cd "$( dirname "$0" )" && pwd )

# ----- libevent -----
# Latest release: https://github.com/libevent/libevent/releases/latest
curl -L https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz > $ROOT/libevent.tar.gz
tar vxf libevent*
rm $ROOT/libevent.tar.gz
cd $ROOT/libevent*
export CPPFLAGS="-I/opt/local/include"
./configure --prefix=$(realpath $ROOT/../)
make -j 4
make install
cd ..

