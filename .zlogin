[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

export EDITOR=vim

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

VBoxClient-all
