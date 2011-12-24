#!/bin/bash

cd $(dirname "$0")

if [ ! -f ./vimrc ]; then
    git clone https://github.com/lepture/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
fi

link() {
    if [ ! -h $HOME/.$1 ]; then
       ln -s "`pwd`/$1" "$HOME/.$1"
    fi
}

if [ ! -d $HOME/.hide ]; then
    echo "make hide directory"
    mkdir "$HOME/.hide"
fi

echo "init vim ...."
link vim
link vimrc

echo "init emacs ...."
#link emacs.d

echo "init git ...."
link gitconfig
link gitignore

echo "init zsh ...."
link zshrc

if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if which zsh > /dev/null; then
    echo "chsh -s `which zsh`"
else
    echo "install zsh"
fi
