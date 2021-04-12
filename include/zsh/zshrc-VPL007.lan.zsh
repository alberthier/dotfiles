### Override SHELL environment variable

export SHELL=/Users/ealber/.homebrew/bin/zsh

### Aliases

alias code="$HOME/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"""

### Helper functions

### Homebrew

export HOMEBREW_PREFIX=/Users/ealber/.homebrew
export PATH=$HOMEBREW_PREFIX/bin:$PATH
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

### zsh completions

fpath=($HOMEBREW_PREFIX/share/zsh-completions $fpath)

### nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && . "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion" ] && . "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion"

### Environment variables

export PKG_CONFIG_PATH=$HOMEBREW_PREFIX/lib/pkgconfig:/usr/lib/pkgconfig

