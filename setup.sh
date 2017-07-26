#!/usr/bin/env bash
# Turn off font smoothing to see more crispier text in iterm
# Not needed for linux system also probably not with retina display
defaults -currentHost write -globalDomain AppleFontSmoothing -int 0

# Configure git to use global gitignore
ln -fs /Users/$USER/.setup/dotfiles/.gitignore /Users/$USER/.gitignore
git config --global core.excludesfile ~/.gitignore

# Set up slime alias for Sublime Text
mkdir -p ~/bin

# Set up global git config
git config --global user.name "Madis Nõmme"
git config --global user.email madis.nomme@gmail.com
git config --global color.diff true

# Use the brew installed vim instead of system one
git config --global core.editor /usr/bin/vim

# Development

