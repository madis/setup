#!/usr/bin/env bash
# Link bash_login to get prompt & other goodies
ln -s /Users/madis/.setup/.bash_login /Users/madis/.bash_login
ln -s /Users/madis/.setup/.bashrc /Users/madis/.bashrc
ln -s /Users/madis/.setup/dotfiles/.vim /Users/madis/.vim
ln -s /Users/madis/.setup/dotfiles/.vimrc /Users/madis/.vimrc
ln -s /Users/madis/.setup/dotfiles/.gvimrc /Users/madis/.gvimrc
# Configure git to use global gitignore
ln -s /Users/madis/.setup/dotfiles/.gitignore /Users/madis/.gitignore
git config --global core.excludesfile ~/.gitignore
