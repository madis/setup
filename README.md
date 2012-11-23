OS X bash
---------
Bash tries to find local profile in following order
1. ~/.bash_profile
2. ~/.bash_login
3. ~/.profile
Upgrading bash through brew:
```bash
brew install bash
```

In (from [http://apple.stackexchange.com/questions/24632/is-it-safe-to-upgrade-bash-via-homebrew](stackexchange)

1. Add /usr/local/bin/bash to /etc/shells
