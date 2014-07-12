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
if which pip > /dev/null; then
    echo "pip already installed"
else
    sudo easy_install pip
fi
if which virtualenv > /dev/null; then
    echo "virtualenv already installed"
else
    sudo pip install virtualenv
    sudo pip install fabric
fi
if [ ! -d $HOME/.venvs ]; then
    echo "create virualenv directory"
    mkdir "$HOME/.venvs"
fi
if [ ! -d $HOME/workspace ]; then
    echo "create workspace"
    mkdir "$HOME/workspace"
fi

echo "init nodejs"
if [ ! -d $HOME/.config/bin/n ]; then
    mkdir -p $HOME/.config/bin
    curl https://raw.github.com/visionmedia/n/master/bin/n -o $HOME/.config/bin/n
    chmod +x $HOME/.config/bin/n
fi

# rime input method
link_rime() {
    rm "$HOME/Library/Rime/$1"
    ln -s "`pwd`/rime/$1" "$HOME/Library/Rime/$1"
}
echo "init rime"
link_rime default.custom.yaml
link_rime squirrel.custom.yaml
link_rime wubi_pinyin.custom.yaml
link_rime wubi86.custom.yaml
# link_rime opencc/zhs2zht.ini
# download ocd files

OPENCC="/Library/Input Methods/Squirrel.app/Contents/SharedSupport/opencc"
if [ ! -f "$OPENCC/simp_to_trad_phrases.ocd" ]; then
    baseurl=https://rimeime.googlecode.com/svn/trunk/misc/opencc/data
    curl ${baseurl}/simp_to_trad_phrases.ocd -o "$OPENCC/simp_to_trad_phrases.ocd"
    curl ${baseurl}/simp_to_trad_characters.ocd -o "$OPENCC/simp_to_trad_characters.ocd"
fi
