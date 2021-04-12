### Helper functions

### Homebrew

export HOMEBREW_PREFIX=/Users/ealber/Applications/Homebrew
export PATH=$HOMEBREW_PREFIX/bin:$PATH
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

### Override SHELL environment variable

export SHELL=$HOMEBREW_PREFIX/bin/zsh

### zsh completions

fpath=($HOMEBREW_PREFIX/share/zsh-completions $fpath)

### nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && . "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion" ] && . "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion"

### Aliases

if whence exa > /dev/null; then
  alias ls='exa -F --group-directories-first --git'
  alias tree='exa -T'
fi

### Environment variables

export PKG_CONFIG_PATH=$HOMEBREW_PREFIX/lib/pkgconfig:/usr/lib/pkgconfig

export LDFLAGS="-L$HOMEBREW_PREFIX/lib $LDFLAGS"
export CPPFLAGS="-I$HOMEBREW_PREFIX/include $CPPFLAGS"
export PYTHON_CONFIGURE_OPTS="--enable-optimizations"
