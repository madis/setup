#!/usr/bin/env bash
# Turn off font smoothing to see more crispier text in iterm
# Not needed for linux system also probably not with retina display
defaults -currentHost write -globalDomain AppleFontSmoothing -int 0

# Link bash_login to get prompt & other goodies
ln -s /Users/madis/.setup/.bash_login /Users/madis/.bash_login
ln -s /Users/madis/.setup/.bashrc /Users/madis/.bashrc
ln -s /Users/madis/.setup/dotfiles/.vim /Users/madis/.vim
ln -s /Users/madis/.setup/dotfiles/.vimrc /Users/madis/.vimrc
ln -s /Users/madis/.setup/dotfiles/.gvimrc /Users/madis/.gvimrc
# Configure git to use global gitignore
ln -s /Users/madis/.setup/dotfiles/.gitignore /Users/madis/.gitignore
git config --global core.excludesfile ~/.gitignore

# iTerm config
mkdir -p ~/Library/Preferences
ln -s ~/.setup/iterm2/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
