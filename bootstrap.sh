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

echo "init hg"
link hgrc
link hg-prompt.py

echo "init zsh ...."
link zshrc
link pystartup.py

echo "init python env ..."
if which pip > /dev/null; then
    echo "pip already installed"
else
    sudo easy_install pip
fi
if which virtualenv > /dev/null; then
    echo "virtualenv already installed"
else
    sudo pip install virtualenv
fi
if [ ! -d $HOME/.virtualenv ]; then
    echo "create virualenv directory"
    mkdir "$HOME/.virtualenv"
    virtualenv $HOME/.virtualenv/lint --no-site-packages
    source $HOME/.virtualenv/lint/bin/active
    pip install flake8
    deactive
fi
if [ ! -d $HOME/workspace ]; then
    echo "create workspace"
    mkdir "$HOME/workspace"
fi

if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if which zsh > /dev/null; then
    echo "chsh -s `which zsh`"
else
    echo "install zsh"
fi
