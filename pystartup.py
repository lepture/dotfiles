import sys
import readline
import rlcompleter

if sys.platform == 'darwin':
    readline.parse_and_bind("bind ^I rl_complete")
else:
    readline.parse_and_bind("tab: complete")
