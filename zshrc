#!/usr/bin/env zsh

DOTFILES=$HOME/.dotfiles

### ZSH Setup

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

autoload -U compinit && compinit
zmodload -i zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ''
# case-insensitive, partial-word, and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

unsetopt flowcontrol
setopt no_beep
setopt prompt_subst
setopt always_to_end
setopt append_history
setopt inc_append_history
setopt auto_menu
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt interactivecomments

### Keybinding

autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -v # VIM insert mode keybindings
if [[ "$(uname -s)" == "Linux" ]]; then
  bindkey "^[[1;5C" forward-word  # Ctrl-Left
  bindkey "^[[1;5D" backward-word # Ctrl-Right
  bindkey "^H" backward-kill-word # Ctrl-Backspace
  bindkey "^[[1;3D" backward-word # Alt-Left
  bindkey "^[[1;3C" forward-word  # Alt-Right
  bindkey '^[[1;5A' up-line-or-beginning-search # Ctrl-Up
  bindkey '^[[1;5B' down-line-or-beginning-search # Ctrl-Down
  bindkey -M menuselect '^[[Z' reverse-menu-complete # Shift-Tab
  bindkey -M menuselect '^[' send-break # Escape
else
  bindkey "^[f" forward-word  # Alt-Left
  bindkey "^[b" backward-word # Alt-Right
  bindkey "^[[H" beginning-of-line # Fn-Left
  bindkey "^[[F" end-of-line       # Fn-Right
fi
bindkey '^R' history-incremental-search-backward # Ctrl-R
bindkey '^F' history-incremental-search-forward # Ctrl-R

### Prompt

git_prompt() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')

  if [ ! -z $BRANCH ]; then
    echo -n "%F{yellow}$BRANCH"

    if [ ! -z "$(git status --short)" ]; then
      echo " %F{red}✗"
    fi
  fi
}

PROMPT_SHELL_CHAR='➜'
PROMPT_SHELL="%B%(!.%F{red}${PROMPT_SHELL_CHAR}%f.%F{green}${PROMPT_SHELL_CHAR}%f)%b"
PROMPT_USER_HOST="${SSH_TTY:+"%B%F{green}%n@%m%f%b:"}"
PROMPT="${PROMPT_USER_HOST}%B%F{blue}%~%f%b ${PROMPT_SHELL} "
RPROMPT_RETURN_VALUE="%(?.. %F{red}%?↵%f)"
RPROMPT='${RPROMPT_RETURN_VALUE} $(git_prompt)'

# Support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

### Aliases

if [[ "$(uname -s)" == "Linux" ]]; then
  eval `dircolors $DOTFILES/include/zsh/dircolors`
  alias ls='ls -hF --color=auto'
  alias xo='xdg-open'
else
  export CLICOLOR=1
  export LSCOLORS=ExgxFxDxCxDxDxAbxcxbxc
  alias ls='ls -hFG'
  alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
  alias firefox='/Applications/Firefox.app/Contents/MacOS/firefox'
  alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
fi
alias ll='ls -l'
alias la='ls -A'
alias rm='rm -iv'
alias mv='mv -iv'
alias cp='cp -iv'
alias df='df -h'
alias du='du -h'
alias grep='grep --color'
alias diff='colordiff -u'
alias tmux='tmux new-session -A -s main'
alias sshhome='ssh eric@alberthier.dynu.net'

### Environment variables

export EDITOR=vim
export VISUAL=$EDITOR
export TMP=$HOME/tmp
export PAGER=less
export GIT_PAGER='less -F -X'

### Load host specific file
HOST_ZSHRC="$DOTFILES/include/zsh/zshrc-$(hostname).zsh"
if [[ -s ${HOST_ZSHRC} ]]; then
  source ${HOST_ZSHRC}
fi
