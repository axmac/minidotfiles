# About

This is a set of dotfiles based on [these](https://github.com/craighurley/dotfiles) dotfiles. They are tweaked and extended for use with the Windows Bash Subsystem (Ubuntu), and _should_ work ok for Linux shells more generally.

# Setup

Clone this repo, then `cd` into your local `minidotfiles` repo and run

    ./dotfiles.sh

Any existing dotfiles you have in `~/` will be backed up to `~/.dotfiles_backup`.

## bash-git-prompt

The dotfiles assume the use of [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt.git).

    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt

## Vundle for Vim plugin management

The .vimrc assumes use of Vundle.

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Run vim and :PluginInstall. (Ignore the 'cannot find color scheme error' on vim startup)

# Acknowledgements

- [Craig Hurley](https://github.com/craighurley)
