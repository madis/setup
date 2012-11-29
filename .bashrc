# Set locale
export LC_ALL="en_US.UTF-8"

PATH=$PATH:$HOME/.rvm/bin:/usr/local/share/python:/usr/local/share/npm/bin:$HOME/bin:$HOME/scripts # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# Open a ruby gem in slime
function sg { bundle show $@ | xargs slime; }
# export PROMPT_COMMAND='echo -ne "\033]0; ${PWD/#$HOME/~}\007"'
alias ssmdev='ssh -i ~/work/SM/keys/AWS.pem ubuntu@smdev1.salemove.com'
# source /usr/local/etc/bash_completion.d/git-prompt.sh
# export PS1='\[\033[01;34m\] \w\[\033[31m\]$(__git_ps1 "(%s)") \[\033[01;34m\]$\[\033[00m\] '

# git
# more git prompt stuff
# https://bbs.archlinux.org/viewtopic.php?id=50885&p=11
#export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '
#export GIT_PS1_SHOWDIRTYSTATE=1
#export PS1="\[\e[01;32m\]\u@\h \[\e[01;34m\]\W \`if [ \$? = 0 ]; then echo -e '\[\e[01;32m\]:)'; else echo -e '\[\e[01;31m\]:('; fi\` \[\e[01;34m\]$\[\e[00m\]"

# Make ls show color
export CLICOLOR=1

export PATH=$HOME/local/bin:$PATH
#export PATH=/usr/bin/node:$PATH
# more git prompt stuff
# https://bbs.archlinux.org/viewtopic.php?id=50885&p=11

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

function update_title_bar() {
  case "$TERM" in 
  xterm*|rxvt*)
      echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"
      ;;
  esac
}

function git_cwd_info() {
  local OPTS="$1"
  # Based parse_git_branch 
  #  https://gist.github.com/47267 
  # plus git_cwd_info from
  #   https://github.com/topfunky/zsh-simple/blob/master/bin/git-cwd-info

  GIT_REPO_PATH=`git rev-parse --git-dir 2>/dev/null`

  if [[ $GIT_REPO_PATH != '' && $GIT_REPO_PATH != '~' && $GIT_REPO_PATH != "$HOME/.git" ]]; then
    GIT_BRANCH=`git symbolic-ref -q HEAD | sed 's/refs\/heads\///'`

    # Uncomment to enable showing commit/revision ID:
    #GIT_COMMIT_ID=`git rev-parse --short HEAD 2>/dev/null`
    #
    #if [ -n "$GIT_COMMIT_ID" ] ; then
    #  GIT_COMMIT_ID="@${LIGHT_GRAY}${GIT_COMMIT_ID}"
    #fi

    GIT_MODE=""
    if [[ -e "$GIT_REPO_PATH/BISECT_LOG" ]]; then
      GIT_MODE=" +bisect"
    elif [[ -e "$GIT_REPO_PATH/MERGE_HEAD" ]]; then
      GIT_MODE=" +merge"
    elif [[ -e "$GIT_REPO_PATH/rebase" || -e "$GIT_REPO_PATH/rebase-apply" || -e "$GIT_REPO_PATH/rebase-merge" || -e "$GIT_REPO_PATH/../.dotest" ]]; then
      GIT_MODE=" +rebase"
    fi

    git_status="$(git status 2> /dev/null)"
    branch_pattern="^# On branch ([^${IFS}]*)"
    remote_pattern="# Your branch is (.*) of"
    diverge_pattern="# Your branch and (.*) have diverged"
    unstaged_changes="Changes not staged for commit"

    GIT_DIRTY=""
    # The first only matches for the current dir and children
    #if [[ "$GIT_REPO_PATH" != '.' && `git ls-files -m` != "" ]]; then
    #BROKEN: if [[ "$GIT_REPO_PATH" != '.' && `git ls-files "$GIT_REPO_PATH" -m` != "" ]]; then
    if [[ "$GIT_REPO_PATH" != '.' && ${git_status} =~ ${unstaged_changes} ]]; then
      GIT_DIRTY="${RED}✗${COLOR_NONE}"
    fi

    # TODO: could use state to check for non-added files etc
    if [[ ! ${git_status} =~ "working directory clean" ]]; then
      state="${RED}⚡"
    fi

    if [[ ${git_status} =~ ${diverge_pattern} ]]; then
      remote="${YELLOW}↕"
    elif [[ ${git_status} =~ ${remote_pattern} ]]; then
      if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
        remote="${YELLOW}↑"
      else
        remote="${YELLOW}↓"
      fi
    fi

    GIT_STATE=""
    if [ -n "$GIT_DIRTY$remote" ] ; then
      GIT_STATE="$GIT_DIRTY${remote}"
    fi

    if [[ ${git_status} =~ ${branch_pattern} ]]; then
      branch=${BASH_REMATCH[1]}
      case $OPTS in
        state)
          echo "$GIT_STATE"
          ;;
        *)
          echo " ${DARK_GRAY}($GIT_BRANCH)$GIT_MODE${GIT_STATE}"
          ;;
      esac
    fi
  fi
}

PROMPT_DIRTRIM=3

function prompt_func() {
    previous_return_value=$?;
    local smiley=""
    local GIT_INFO=""
    local prompt=""

    if [ "$1" = "simple" ] ; then
      GIT_INFO="$(git_cwd_info state)"
      if [ -n "$GIT_INFO" ] ; then
        GIT_INFO="${DARK_GRAY}($(git_cwd_info state)${DARK_GRAY})"
      fi
      prompt="\u@\h:${BLUE}\W ${GIT_INFO}${COLOR_NONE}"
      if test $previous_return_value -eq 0
      then
        PS1="${prompt}${COLOR_NONE}➔ "
      else
        PS1="${prompt}${RED}➔${COLOR_NONE} "
      fi
    else
      if test $previous_return_value -eq 0
      then
        smiley="${GREEN}☺ ${COLOR_NONE}"
      else
        smiley="${RED}☹ ${COLOR_NONE}"
      fi
      GIT_INFO="$(git_cwd_info)"
      # prompt="${BLUE}[${LIGHT_GREEN}\u@\h:${BLUE}\w${GIT_INFO}${BLUE}]${COLOR_NONE} "
      # PS1="${prompt}\n${smiley}➔ "
      # FOLDER="$(last_three_dirs)"
      prompt="${YELLOW}\w${GIT_INFO}${COLOR_NONE}"
      PS1="${prompt}${smiley}➔ "
    fi
    #update_title_bar
}

# Choose simple or more detailed prompt:
#PROMPT_COMMAND="prompt_func simple"
PROMPT_COMMAND="prompt_func"

