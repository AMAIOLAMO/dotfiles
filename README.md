# dotfiles
My personal dotfiles.

utilizes GNU Stow to automatically symlink everything from $HOME/dotfiles

# how to use
1. install GNU `stow` and `git`.
2. clone this repository with: `git clone` to your home directory(IMPORTANT)
3. change directory into the cloned directory
4. update all possible submodules, such as nvim by doing: `git submodule update --init --recursive`
4. call `stow .`, this should link all files from the current directory into it's parent


# how to sync and update
1. change into directory, and pull the changes by `git pull`
2. update submodules if necessary with: `git submodule update --init --recursive --remote`
3. call `stow .`


## Have fun!

