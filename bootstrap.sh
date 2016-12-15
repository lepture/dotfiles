#!/bin/bash

cd $(dirname "$0")

if [ ! -f ./vimrc ]; then
    git clone https://github.com/lepture/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
fi

link() {
    rm -f "$HOME/.$1"
    ln -s "`pwd`/$1" "$HOME/.$1"
}

link_config() {
    rm -fr "$HOME/.config/$1"
    ln -s "`pwd`/$1" "$HOME/.config/$1"
}

if [ ! -d $HOME/.hide ]; then
    echo "make hide directory"
    mkdir "$HOME/.hide"
fi

if [ ! -d $HOME/.config ]; then
    echo "make config directory"
    mkdir "$HOME/.config"
fi

echo "init vim ...."
if [ ! -d vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git vim/bundle/Vundle.vim
fi
link vim
link vimrc
vim +BundleInstall +qall

echo "init git ...."
link gitconfig
link_config gitignore

echo "init hg"
link hgrc
link_config hg-prompt.py

# fish
echo "install fish shell yourself"
link_config fish

echo "init python env ..."
link_config pystartup.py
echo "install pyenv and pyenv-virtualenv yourself"

if [ ! -d $HOME/workspace ]; then
    echo "create workspace"
    mkdir "$HOME/workspace"
fi

echo "init nodejs"
if [ ! -d $HOME/.config/bin/n ]; then
    mkdir -p $HOME/.config/bin
    curl https://raw.githubusercontent.com/tj/n/master/bin/n -o $HOME/.config/bin/n
    chmod +x $HOME/.config/bin/n
fi
