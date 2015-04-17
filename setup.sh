#!/usr/bin/env bash
# Turn off font smoothing to see more crispier text in iterm
# Not needed for linux system also probably not with retina display
defaults -currentHost write -globalDomain AppleFontSmoothing -int 0

# Link bash_login to get prompt & other goodies
ln -fs /Users/$USER/.setup/.bash_login /Users/$USER/.bash_login
ln -fs /Users/$USER/.setup/.bashrc /Users/$USER/.bashrc
ln -fs /Users/$USER/.setup/dotfiles/.vim /Users/$USER/.vim
ln -fs /Users/$USER/.setup/dotfiles/.vimrc /Users/$USER/.vimrc
ln -fs /Users/$USER/.setup/dotfiles/.gvimrc /Users/$USER/.gvimrc
# Configure git to use global gitignore
ln -fs /Users/$USER/.setup/dotfiles/.gitignore /Users/$USER/.gitignore
git config --global core.excludesfile ~/.gitignore

# Set up slime alias for Sublime Text
mkdir -p ~/bin
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/slime

# Set up global git config
git config --global user.name "Madis Nõmme"
git config --global user.email madis.nomme@gmail.com
git config --global color.diff true

# Use the brew installed vim instead of system one
git config --global core.editor /usr/bin/vim

# Link sublime settings
ln -sf /Users/madis/.setup/sublime-settings/User /Users/madis/Library/Application\ Support/Sublime\ Text\ 3/Packages

