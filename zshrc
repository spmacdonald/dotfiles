autoload -U compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt walters

typeset -U path
path=(/usr/local/bin $path)

alias ls="ls -G"

export PYTHONDONTWRITEBYTECODE=1
export VAGRANT_VMWARE_CLONE_DIRECTORY=/Users/scott/vagrant
