#!/usr/bin/env bash
#
# setup_tmux.sh 
# Copyright (c) 2017 owl
#

# ----- tmux -----
# Latest release: https://github.com/vim/vim.git
git clone https://github.com/vim/vim.git vim-8
cd vim-8
./configure --prefix=/usr/local/ --with-features=huge --enable-pythoninterp
make -j 4
cd ..

