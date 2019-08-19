### Aliases


### Helper functions

function cptohome()
{
    scp $1 eric@alberthier.dynu.net:/home/eric/Downloads/$2
}

function cpfromhome()
{
    sftp eric@alberthier.dynu.net:/home/eric/Downloads/$1 $2
}

### zsh completions

fpath=($HOMEBREW_PREFIX/share/zsh-completions $fpath)

### nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && . "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion" ] && . "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion"

### Environment variables

export PKG_CONFIG_PATH=$HOMEBREW_PREFIX/lib/pkgconfig:/usr/lib/pkgconfig

# Android
export ANDROID_HOME=$HOME/software/android-sdk
export ANDROID_NDK_HOME=$HOME/software/android-ndk-r10d
export PATH=$ANDROID_NDK_HOME:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

# Other PATH additions
export PATH=$HOME/.cargo/bin:$PATH
