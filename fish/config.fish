set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x COPYFILE_DISABLE "true"

set -x PATH $HOME/.config/bin $HOME/.rbenv/bin $HOME/.rbenv/shims /usr/local/bin $PATH 

# python
set -x PYTHONSTARTUP $HOME/.config/pystartup.py

# pyenv
set -x PYTHON_BUILD_SKIP_MIRROR "1"
status --is-interactive; and . (pyenv init -|psub)
. (pyenv virtualenv-init -|psub)
# set -x MACOSX_DEPLOYMENT_TARGET "10.6"
set -x PYTHON_CONFIGURE_OPTS "--enable-universalsdk=/ --with-universal-archs=intel"

# nodejs
set -x NODE_PATH /usr/local/lib/node_modules

# golang
set -x GOROOT $HOME/workspace/go
set -x GOPATH $HOME/workspace/golang
set -x PATH $GOROOT/bin $PATH

alias cnpm="npm --registry=http://registry.npm.taobao.org/"
alias ia="open -a \"iA Writer\""
alias subl="open -a \"Sublime Text\""
alias nw="~/Applications/node-webkit.app/Contents/MacOS/node-webkit"
