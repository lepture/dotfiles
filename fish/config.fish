set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x COPYFILE_DISABLE "true"

set -x PATH /usr/local/bin $PATH $HOME/.config/bin $HOME/.rbenv/bin

# python
set -x PYTHONSTARTUP $HOME/.config/pystartup.py
. ~/.pythonz/etc/pythonz.fish

set -g VIRTUALFISH_HOME $HOME/.venvs
. ~/.config/fish/virtual.fish
set -g VIRTUALFISH_COMPAT_ALIASES on

# nodejs
set -x NODE_PATH /usr/local/lib/node_modules

# golang
set -x GOPATH $HOME/workspace/golang
set -x PATH $PATH $GOPATH/bin

# rbenv
. (rbenv init -|psub)
