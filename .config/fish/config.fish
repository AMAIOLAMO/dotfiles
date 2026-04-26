if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

zoxide init fish | source

alias fzf "fzf --preview 'bat --style=numbers --color=always {}'"

alias fzfhistory "history | fzf"

alias cl "clear"

alias v "nvim"

alias ipy "ipython"

alias py "python"

# Git
alias g "git"
alias gstat "git status"

alias gfetch "git fetch"
alias gpull "git pull"
alias gpush "git push"
alias gcommit "git commit"

alias ggraph "git log --graph"

alias gaa "git add ."


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
