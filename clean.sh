
#!/usr/bin/env zsh

# List the folders you want to remove the symbolic link below
STOW_FOLDERS="gitconfig,vim,zsh"

DOT_FILES=$HOME/.dotfiles

pushd $DOT_FILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "Removing $folder"
    stow -D $folder
done
popd
