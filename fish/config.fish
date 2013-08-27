set -x LANG "en_US.UTF-8"
set -x LC_TYPE "en_US.UTF-8"

set -x PATH $PATH $HOME/.config/bin

# python
set -x PYTHONSTARTUP $HOME/.config/pystartup.py
. ~/.pythonz/etc/pythonz.fish

set -g VIRTUALFISH_HOME $HOME/.venvs
. ~/.config/fish/virtual.fish
set -g VIRTUALFISH_COMPAT_ALIASES on

# nodejs
set -x NODE_PATH /usr/local/lib/node_modules/
