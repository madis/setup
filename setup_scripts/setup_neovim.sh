#!/usr/bin/env bash
export TEMPDIR=/tmp/vim_setup_temp

echo "Installing neovim head"
# brew reinstall --HEAD neovim

echo "Making neovim default (linking to /usr/local/bin/vim)"
ln -s /usr/local/bin/nvim /usr/local/bin/vim

echo "Installing Plug for vim"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing plugins for neovim"
vim +PluginInstall +qall

echo "Working in $TEMPDIR"
mkdir -p $TEMPDIR
cd  $TEMPDIR

echo "Installing fonts for powerline"
git clone git@github.com:powerline/fonts.git
cd $TEMPDIR/fonts && ./install.sh

echo "Now make sure your terminal is using these fonts!"

echo "Installing silver searcher"
brew install the_silver_searcher

echo "Installing youcompleteme plugin for autocompletion"
brew install python
brew install python3
pip2 install --upgrade neovim
pip3 install --upgrade neovim

