export LC_ALL="en_US.UTF-8"

[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"  # This loads NVM

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
DARK_GRAY="\[\033[0;90m\]"
COLOR_NONE="\[\e[0m\]"
ORANGE="\[\033[01;32m\]"

# Open a ruby gem in slime
function sg { bundle show $@ | xargs slime; }

function user_aware_prompt {
  if [[ $EUID -ne 0 ]];
  then
    echo -e "${COLOR_NONE}➔ "
  else
    echo -e "${LIGHT_RED}#${COLOR_NONE} "
  fi
}
export PROMPT_COMMAND='echo -ne "\033]0; ${PWD/#$HOME/~}\007"'
export PS1="\[$YELLOW\]\w${GREEN}\$(__git_ps1) "$(user_aware_prompt)
# Make ls show color
export CLICOLOR=1
PROMPT_DIRTRIM=3

alias simulator='open /Applications/Xcode.app/Contents/Developer/Applications/iOS\ Simulator.app'

export SM_CONF=/Users/madis/code/salemove/sm-configuration

export PATH="$HOME/bin:$PATH:/usr/local/sbin:/usr/local/opt/go/libexec/bin:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export JAVA_HOME=$(/usr/libexec/java_home)

export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/madis/.boot2docker/certs/boot2docker-vm

complete -C aws_completer aws

ulimit -n 65536
ulimit -u 2048

