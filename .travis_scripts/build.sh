#!/bin/sh

#CREDENTIAL_FILE="$HOME/.config/git-credential"
#mkdir -p $HOME/.config

#echo "https://${GH_TOKEN}:@github.com" > $CREDENTIAL_FILE
#echo "github.com:
#- oauth_token: $GH_TOKEN
#  user: $GH_USER"
#> $HOME/.config/hub

#git config --global user.name "kiyomura"
#git config --global user.email "kiyomura@dwango.co.jp"
#git config --global hub.protocol "https"
#git config --global credential.helper "store --file=$CREDENTIAL_FILE"

echo "TRAVIS_EVENT_TYPE=$TRAVIS_EVENT_TYPE"
echo "TRAVIS_BRANCH=$TRAVIS_BRANCH"

echo '------'
pwd
which ruby
echo '------'

git log --oneline -n 200 --decorate --pretty=format:'[%cd]%d' --date=format:'%Y/%m/%d %H:%M:%S'

exit 0
