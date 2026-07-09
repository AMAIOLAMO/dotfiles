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

###################
# config settings #
###################

$env.config.show_banner = false

def show_banner [] {
  use kawaiiface

  printf $"(kawaiiface pick_random) "

  printf $"WELCOME BACK "
  printf $"(ansi red)C(ansi magenta)x"
  printf $"(ansi yellow)R(ansi green)e(ansi aqua)d(ansi blue)i(ansi purple)x"
  printf $"(ansi reset)"
  printf "\n"

  cal
}

$env.config.edit_mode = 'vi'

$env.config.menus ++= [{
    name: completion_menu
    only_buffer_difference: false # Search is done on the text written after activating the menu
    marker: "| "                  # Indicator that appears with the menu is active
    type: {
        layout: columnar          # Type of menu
        columns: 4                # Number of columns where the options are displayed
        col_width: 20             # Optional value. If missing all the screen width is used to calculate column width
        col_padding: 2            # Padding between columns
    }
    style: {
        text: green                   # Text style
        selected_text: green_reverse  # Text style for selected option
        description_text: yellow      # Text style for description
    }
}]

# prompt
$env.prompt_command_right = {||}

###########
# aliases #
###########

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

source zoxide.nu

source theme.nu


##################
# initialization #
##################
show_banner
