#!/bin/sh

CREDENTIAL_FILE="$HOME/.config/git-credential"
mkdir -p $HOME/.config

echo "https://${GH_TOKEN}:@github.com" > $CREDENTIAL_FILE
#echo "github.com:
#- oauth_token: $GH_TOKEN
#  user: $GH_USER"
#> $HOME/.config/hub

git config --global user.name "kiyomura"
git config --global user.email "kiyomura@dwango.co.jp"
git config --global hub.protocol "https"
git config --global credential.helper "store --file=$CREDENTIAL_FILE"

echo $TRAVIS_EVENT_TYPE
echo $TRAVIS_BRANCH

pwd

git log --oneline -n 20

exit 0
