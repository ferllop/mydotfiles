#! /usr/bin/env bash

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

function link() {
    local source_inside_dotfiles=$DOTFILES/$1
    local destination_inside_home=$HOME/$2
    rm -rf $destination_inside_home
    ln -s $source_inside_dotfiles $destination_inside_home
    echo "Linked ${source_inside_dotfiles} to ${destination_inside_home}"
}

link bash_aliases .bash_aliases
link vimrc .vimrc
link kitty .config/kitty
mkdir -p $HOME/.local/bin; link scripts/t .local/bin/t
link tmux/tmux.conf .tmux.conf


