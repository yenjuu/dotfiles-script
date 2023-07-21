#!/bin/bash
echo ">> Start to update dotfile"
cd ~/.dotfiles/

echo ">> Update brewfile?(y/n)"
read input1

### Gen & overwrite BrewFile

if [ "$input1" = "y" ]; then
    new_brewfile=$(brew bundle dump --describe --force)
    echo "$new_brewfile"
    echo ">> Update brewfile done."
fi

### Check git status
git_status=$(git status --porcelain)
if [ -n "$git_status" ]; then
    echo ">> Changed list:"
    echo "$git_status"
    
    echo ">> Commit updates？(y/n)"
    read input

    if [ "$input" = "y" ]; then
        git add .
        #echo ">> Commit message:"
        #read message
        git commit
        git_log=$(git log --oneline --graph)
        echo "$git_log"
        echo ">> Git commit done, now  pushing..."
        git push origin main
        echo ">> Dotfile updated."
    else
        echo ">> Update canceled."
    fi
else
    echo ">> Nothing chaged."
fi
