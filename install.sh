#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -si $DIR/bash/bash_profile $HOME/.bash_profile
ln -si $DIR/bash/bashrc $HOME/.bashrc
ln -si $DIR/tmux/tmux.conf $HOME/.tmux.conf
ln -siF $DIR/nvim $HOME/.config
ln -siF $DIR/scripts $HOME/.config
