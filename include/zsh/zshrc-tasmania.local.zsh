function vencmp4()
{
    avconv -threads 2 -i "$1" -s hd480 -c:v libx264 -crf:v 25 -c:a aac -q:a 100 -strict experimental "$2"
}

function sweechdev()
{
    nvm use default
    cd $HOME/Projects/sweech/app/src/main/js
    export PATH=$(npm bin):$PATH
}

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH