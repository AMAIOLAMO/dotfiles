# config.nu
#
# Installed by:
# version = "0.114.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

alias fzf = fzf --preview 'bat --style=numbers --color=always {}'

alias cl = clear

alias v = nvim

alias ipy = ipython

alias py = python

# Git
alias g = git
alias gstat = git status
alias gdiff = git diff

alias gfetch = git fetch
alias gpull = git pull
alias gpush = git push
alias gcommit = git commit

alias ggraph = git log --graph

alias gaa = git add .

alias ff = fastfetch

alias drop = blobdrop

alias rm = echo use trash / trsh instead!

alias trsh = trash

alias trshe = trash-empty

alias x = exit
