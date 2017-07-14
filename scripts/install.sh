#!/bin/bash

DOTFILE_DIR=~/dotfiles
if [ ! -d $DOTFILE_DIR ]
then
    echo $DOTFILE_DIR not found!; exit 1;
fi

(cd $DOTFILE_DIR && cp -rf .aliases .astylerc .func .gitconfig .screenrc .vim .vimrc .zshrc ~)
