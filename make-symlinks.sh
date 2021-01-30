#!/bin/bash

# The dotfiles directory.
dir=~/dotfiles

# Old dotfiles backup directory.
olddir=~/dotfiles_old

# List of files/folders to symlink in homedir.
files="zshrc gitignore gitconfig Rprofile"

# Create dotfiles_old in home directory.
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# Change to the dotfiles directory.
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# Move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks from the homedir to any files in the ~/dotfiles directory 
# specified in $files.
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
