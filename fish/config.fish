set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x COPYFILE_DISABLE "true"

set -x PATH $HOME/.config/bin /usr/local/bin $PATH

# pyenv
set -x PYTHON_BUILD_SKIP_MIRROR "1"
status --is-interactive; and . (pyenv init -|psub)
. (pyenv virtualenv-init -|psub)
set -x PYTHONSTARTUP $HOME/.config/pystartup.py

# nodejs
set -x NODE_PATH /usr/local/lib/node_modules

alias subl="open -a \"Sublime Text\""
alias nw="~/Applications/node-webkit.app/Contents/MacOS/node-webkit"
