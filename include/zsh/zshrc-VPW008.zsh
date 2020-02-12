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
export JAVA_HOME=$HOME/software/android-studio/jre
export ANDROID_SDK_ROOT=$HOME/software/android-sdk
export ANDROID_NDK=$ANDROID_SDK_ROOT/ndk/19.2.5345600
export PATH=$ANDROID_NDK:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/tools/bin:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$JAVA_HOME/bin:$PATH

# Other PATH additions
export PATH=$HOME/.cargo/bin:$PATH
