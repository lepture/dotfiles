set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x COPYFILE_DISABLE "true"

set -x PATH /usr/local/bin $PATH $HOME/.config/bin $HOME/.rbenv/bin

# python
set -x PYTHONSTARTUP $HOME/.config/pystartup.py

# pyenv
status --is-interactive; and . (pyenv init -|psub)

# nodejs
set -x NODE_PATH /usr/local/lib/node_modules

# golang
set -x GOPATH $HOME/workspace/golang
set -x PATH $PATH $GOPATH/bin

# rbenv
. (rbenv init -|psub)

alias ia="open -a \"iA Writer\""
alias subl="open -a \"Sublime Text 2\""
alias nw="~/Applications/node-webkit.app/Contents/MacOS/node-webkit"
