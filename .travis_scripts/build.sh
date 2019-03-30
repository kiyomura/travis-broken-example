#!/bin/sh


if [ $TRAVIS_EVENT_TYPE = cron ]; then
  LIST=`git log --oneline -n 200 --decorate --pretty=format:'[%cd]%d' --date=format:'%Y/%m/%d %H:%M:%S'
fi


exit 0
