HISTSIZE=50000
HISTFILE=~/.zsh_history
SAVEHIST=50000
setopt    appendhistory
setopt    sharehistory
setopt    incappendhistory

autoload -U compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt walters

typeset -U path
path=(/usr/local/bin /usr/local/git/bin /Applications/Postgres.app/Contents/Versions/latest/bin $path)

alias ls="ls -G"

export PYTHONDONTWRITEBYTECODE=1
