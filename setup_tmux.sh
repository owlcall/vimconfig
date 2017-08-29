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
		#-d|--directory)
		#DIRECTORY="$2"
		#shift
		#;;

		-64)
		FORCE=true
		;;

		*)
		if [ ! $NAME ]; then
			NAME="$1"
		else
			echo error: unknown argument "$1"
			exit -3
		fi
		;;
	esac
	shift
done

# ----- tmux -----
# Latest release: https://github.com/tmux/tmux/releases
curl -L https://github.com/tmux/tmux/releases/download/2.5/tmux-2.5.tar.gz > tmux.tar.gz
tar vxf tmux*
rm tmux.tar.gz
cd tmux*
./configure --prefix=/usr/local
make -j 4
cd ..

