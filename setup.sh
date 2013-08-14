#!/usr/bin/env bash
# Turn off font smoothing to see more crispier text in iterm
# Not needed for linux system also probably not with retina display
defaults -currentHost write -globalDomain AppleFontSmoothing -int 0

# Link bash_login to get prompt & other goodies
ln -s /Users/$USER/.setup/.bash_login /Users/$USER/.bash_login
ln -s /Users/$USER/.setup/.bashrc /Users/$USER/.bashrc
ln -s /Users/$USER/.setup/dotfiles/.vim /Users/$USER/.vim
ln -s /Users/$USER/.setup/dotfiles/.vimrc /Users/$USER/.vimrc
ln -s /Users/$USER/.setup/dotfiles/.gvimrc /Users/$USER/.gvimrc
# Configure git to use global gitignore
ln -s /Users/$USER/.setup/dotfiles/.gitignore /Users/$USER/.gitignore
git config --global core.excludesfile ~/.gitignore

# iTerm config
mkdir -p ~/Library/Preferences
ln -s ~/.setup/iterm2/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
