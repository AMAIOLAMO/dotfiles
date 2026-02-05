if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

zoxide init fish | source

alias fzfbat "fzf --preview 'batcat --style=numbers --color=always {}'"

alias fzfhistory "history | fzf"

alias cl "clear"

alias v "nvim"

alias ipy "ipython"

alias py "python"

alias gitfp "git fetch && git pull"

alias fetch "fastfetch"

alias ff "fastfetch"

alias drop "blobdrop"

alias rm "echo use trash / trsh instead!"

alias trsh "trash"

alias trshe "trash-empty"

alias x "exit"

export EDITOR="nvim"

export GEM_HOME="$(gem env user_gemhome)"
export GEM_PATH="$(gem env user_gemhome)/bin"
export PATH="$PATH:$GEM_PATH"
