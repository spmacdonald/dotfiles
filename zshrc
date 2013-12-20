autoload -U compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt walters

typeset -U path
path=(/usr/local/bin $path)

alias ls="ls -G"

export HOMEBREW_GITHUB_API_TOKEN=f37cf70d007238fffddbd9c64071731d4d80fb61
export PYTHONDONTWRITEBYTECODE=1
