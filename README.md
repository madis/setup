# Setup & dotfiles

In this repository are my *dotfiles* and some other configuration files and scripts to set up productive working environment

## Notes for self (on new ubuntu install)

1. Homebrew
  - https://brew.sh/
2. Zsh
  - `sudo apt install zsh`
3. Asdf
 - https://asdf-vm.com/guide/getting-started.html
 - `asdf install nodejs x.x.x` && add it to `~/.tool-versions`
4. Install _Pure_ shell
  - https://github.com/sindresorhus/pure
4. Neovim
  - `brew install neovim`
  - alias `vim` to NeoVim `ln -s ~/code/setup/dotfiles/vimrc ~/.config/nvim/init.vim`
  - VimPlug https://github.com/junegunn/vim-plug
  - fzf https://github.com/junegunn/fzf#using-homebrew
  - install SilverSearcher `brew install the_silver_searcher`
5. Tmux
  - `brew install tmux`
  - intall Tmux plugin manager https://github.com/tmux-plugins/tpm
  - `ln -s ~/code/setup/dotfiles/tmux.conf ~/.tmux.conf`
  - add _tat_ https://github.com/thoughtbot/dotfiles/blob/master/bin/tat
6. JVM
  - `sudo apt install openjdk-18-jre-headless`
