#!/bin/bash
set -xe
cp vimrc ~/.vimrc
cp bashrc ~/.bashrc
cp inputrc ~/.inputrc
cp tmux.conf ~/.tmux.conf
cp pylintrc ~/.pylintrc
mkdir -p ~/.config/yapf
cp yapf_style ~/.config/yapf/style

# Install vim plugins
#mkdir -p ~/.vim/autoload ~/.vim/bundle && \
#    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle/
# git clone https://github.com/klen/python-mode.git
# git clone https://github.com/vim-airline/vim-airline.git
# git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
# git clone git://github.com/nathanaelkane/vim-indent-guides.git
# git clone https://github.com/scrooloose/nerdtree.git
# git clone git://github.com/tpope/vim-commentary.git
git clone https://github.com/Raimondi/delimitMate.git
# You Complete Me
# git clone https://github.com/Valloric/YouCompleteMe.git
pushd YouCompleteMe
git submodule update --init --recursive
./install.py
popd
# Fonts for airline
