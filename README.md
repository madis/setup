# Setup & dotfiles

In this repository are my *dotfiles* and some other configuration files and scripts to set up productive working environment

## Setting up arrow keys in iTerm

1. For Bash add to ~/.inputrc:
```
"\M-d": backward-kill-word
"\e[1;5C": forward-word
"\e[1;5D": backward-word
```
2. For Zsh add to ~/.zshrc
```
bindkey ';5C' forward-word
bindkey ';5D' backward-word
```

2. iTerm2 preferences:
Profiles -> Keys

1) mark Left option key acts as +Esc
2) ⌥← to Action: *Send Escape Sequence* Esc+: ```[1;5D```
3) ⌥→ to Action: *Send Escape Sequence* Esc+: ```[1;5C```

Now you can *delete by word* with pressing option + delete key down and *move by word* with pressing option + arrow.

# Set up hyper key

[Install karabinier & seil](https://pqrs.org/osx/karabiner/)

