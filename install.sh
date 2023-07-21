#!/usr/bin/env zsh

# List the folders you want to create symbolic link with GNU stow below
STOW_FOLDERS="gitconfig,vim,zsh"

DOT_FILES=$HOME/.dotfiles

pushd $DOT_FILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    stow -D $folder
    stow $folder
done
popd
