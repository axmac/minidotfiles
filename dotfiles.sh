#!/usr/bin/env bash

# Start
echo "`basename $0` starting."

directory=~/.minidotfiles/dotfiles
backup=~/.dotfiles_backup
files=`find $directory -maxdepth 1 -type f -iname ".*"` 
directories=`find $directory -maxdepth 1 -type d -iname ".*"`

function doIt() {
    # make the backup directory
    [[ ! -d $backup ]] && mkdir -p $backup

    # move existing dotfiles to backup, then create symlinks from directory to ~
    for file in ${files[@]}; do
        if [[ -f ~/$(basename $file) ]]; then
            echo "Moving ~/$(basename $file) to $backup"
            mv -n ~/$(basename $file) $backup/
        fi
        echo "Symlinking $file to ~/$(basename $file)"
        ln -f -s $file ~/$(basename $file)
    done

    # symlinks for directories
    for dir in ${directories[@]}; do
        echo "Symlinking $dir to ~/$(basename $dir)"
        rm ~/$(basename $dir)
        ln -f -s $dir/ ~/$(basename $dir)
    done

}

read -p "This script will backup your current dotfiles and symlink to a new set of dotfiles. Are you sure? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
fi

unset doIt

# Finished
echo "`basename $0` complete."
