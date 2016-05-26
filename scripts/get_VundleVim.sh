#!/bin/bash

if ! [ -d ~/.vim/bundle/Vundle.vim ] ; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
	echo "~/.vim/bundle/Vundle.vim already exists!"
	exit 1
fi

exit 0
