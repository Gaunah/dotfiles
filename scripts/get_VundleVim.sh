
#check for git
if ! command -v git >/dev/null; then
    echo "git needs to be installed!"; exit 1
fi

if ! [ -d ~/.vim/bundle/Vundle.vim ] ; then
    git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "~/.vim/bundle/Vundle.vim already exists!"; exit 1
#!/bin/bash
fi

