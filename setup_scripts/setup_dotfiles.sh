#!/usr/bin/env bash

# Link bash_login to get prompt & other goodies
CURRENT_DIR=/Users/madis/code/madis/setup
ln -fs $CURRENT_DIR/dotfiles/.bash_login /Users/$USER/.bash_login
ln -fs $CURRENT_DIR/dotfiles/.bashrc /Users/$USER/.bashrc
ln -fs $CURRENT_DIR/dotfiles/.vim /Users/$USER/.vim
ln -fs $CURRENT_DIR/dotfiles/.vimrc /Users/$USER/.vimrc
ln -fs $CURRENT_DIR/dotfiles/.gvimrc /Users/$USER/.gvimrc
