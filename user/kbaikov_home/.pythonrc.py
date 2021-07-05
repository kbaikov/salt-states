# Add the following to ~/.bash_profile
# export PYTHONSTARTUP=~/.pythonrc.py
import readline
import rlcompleter  # imported purely for side-effects

readline.parse_and_bind('tab: complete')
del readline, rlcompleter
