# queries common used directories
function zf
  z $(zoxide query -l "$argv" | fzf)
end
