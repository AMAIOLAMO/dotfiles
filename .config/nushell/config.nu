# config.nu
#
# Installed by:
# version = "0.114.0"
#
# You can also page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

###################
# config settings #
###################

$env.config.show_banner = false

def show_banner [] {
  use kawaiiface

  def align_term_center []: string -> string {
    $in | fill --alignment center --character ' ' --width (term size).columns

  }

  mut result_heading = ""
  $result_heading = $result_heading + $"(kawaiiface pick_random) "

  $result_heading = $result_heading + $"WELCOME BACK "
  $result_heading = $result_heading + $"(ansi red)C(ansi magenta)x"
  $result_heading = $result_heading + $"(ansi yellow)R(ansi green)e(ansi aqua)d(ansi blue)i(ansi purple)x"
  $result_heading = $result_heading + $"(ansi reset)"

  printf $"($result_heading | align_term_center)"
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
