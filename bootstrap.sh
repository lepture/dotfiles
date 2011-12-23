#!/bin/bash

cd $(dirname "$0")

if [ ! -f ./vimrc ]; then
    git clone https://github.com/lepture/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
fi

link() {
    ln -s "`pwd`/$1" "$HOME/.$1"
}

echo "make hide directory"
mkdir "$HOME/.hide"

echo "init vim"
link vim
link vimrc

echo "init emacs"
link emacs.d

echo "init git"
link gitconfig

echo "init zsh"
link zshrc

if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

echo "chsh -s which zsh"
