# OS X

1. Install chrome
2. Install Xcode
3. [Install divvy](http://mizage.com/divvy/)
  - copy divvy config
4. Install latest JDK
5. Install homebrew
6. run ```./setup_scripts/install_homebrew_stuff.sh```
7. Install iTerm2
  - set up arrows 
  
    1) in ~/.inputrc:
    ```
    "\M-d": backward-kill-word
    "\e[1;5C": forward-word
    "\e[1;5D": backward-word
    ```

    2) iTerm2 preferences:
    Profiles -> Keys

      1) mark Left option key acts as +Esc
      2) ⌥← to Action: *Send Escape Sequence* Esc+: ```[1;5D```
      3) ⌥→ to Action: *Send Escape Sequence* Esc+: ```[1;5C```

    Now you can *delete by word* with pressing option + delete key down and *move by word* with pressing option + arrow.

8. Install SublimeText
  - Better CoffeeScript
  - Better RSpec
  - BracketHighlighter
  - ApplySyntax
  - GitGutter
  - lispindent
  - MarkdownEditing
  - RubySlim
  - Solarized Color Scheme
  - SublimeREPL
  - SublimeBookmarks

9. 
10. [Install karabinier & seil](https://pqrs.org/osx/karabiner/)

Bash tries to find local profile in following order
1. ~/.bash_profile
2. ~/.bash_login
3. ~/.profile
Upgrading bash through brew:
```bash
brew install bash
```

In (from [http://apple.stackexchange.com/questions/24632/is-it-safe-to-upgrade-bash-via-homebrew](stackexchange)

1. install Xcode
2. install homebrew

3. install git
4. [install openssh](http://www.dctrwatson.com/2013/07/how-to-update-openssh-on-mac-os-x/)

5. Add /usr/local/bin/bash to /etc/shells

