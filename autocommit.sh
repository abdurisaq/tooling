#!/bin/bash

timestamp(){

  date +%F_%T

}

if [[ "$2" != "running" ]]; then
  "$0" "$1" running &
  echo "now running with PID $!"
  exit 0
fi

while true
do
  var=$(timestamp)
  git -C "$1" add . > /dev/null
  git -C "$1" commit -m "$var" > /dev/null
  sleep 600
done


# add to zshrc
#alias timeStamp='~/tooling/autocommit.sh `pwd`'
