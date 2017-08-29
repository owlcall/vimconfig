#!/usr/bin/env bash
#
# setup_tmux.sh 
# Copyright (c) 2017 owl
#

ROOT=$( cd "$( dirname "$0" )" && pwd )

while [[ $# -gt 0 ]]
do
	key="$1"

	case $key in
		-64)
		ARCH="--enable-64bit"
		;;

		*)
		echo error: unknown argument "$1"
		exit -3
		;;
	esac
	shift
done

rm -rf temp_tmux
mkdir temp_tmux
cd temp_tmux

# ----- libevent -----
# Latest release: https://github.com/libevent/libevent/releases/latest
curl -L https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz > libevent.tar.gz
tar vxf libevent*
rm libevent*.tar.gz
cd libevent*
./configure $ARCH --prefix=/usr/local
make -j 4
cd ..
