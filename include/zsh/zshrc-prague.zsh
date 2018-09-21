### Aliases

alias fglcomp='fglcomp -M'
alias fglform='fglform -M'

### Helper functions

function cptohome()
{
    scp $1 eric@alberthier.dynu.net:/home/eric/Downloads/$2
}

function cpfromhome()
{
    sftp eric@alberthier.dynu.net:/home/eric/Downloads/$1 $2
}

function fglcompall()
{
  for i in `ls *.4gl`; do fglcomp $i; done
}

function fglformall()
{
  for i in `ls *.per`; do fglform $i; done
}

function fglall()
{
  fglcompall
  fglformall
}

function cjs()
{
    export NVM_DIR="/home/eral/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm use default
    cd $HOME/projects/cjs
    export PATH=$(npm bin):$PATH
}

### Environment variables

export FGLDIR=$HOME/fourjs/fglgws
export FGLASDIR=$HOME/fourjs/gas
export ANDROID_HOME=$HOME/software/android-sdk
export ANDROID_NDK_HOME=$HOME/software/android-ndk-r10d
export PATH=$HOME/bin:$FGLASDIR/bin:$FGLDIR/bin:$ANDROID_NDK_HOME:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
