#!/bin/bash
#return if not sourced
if [ $0 != "-bash" ]; then
  echo "Run as source gg"
  exit
fi

#get scripts home directory
HOME=$(dirname $(file $(which gg) | awk '{print $5}'))

#define import function
import() {
  source $HOME/$1
}

#imports
import colors.sh
import configuration.sh
import use.sh

#run command
if [ $1 == "run" ]; then
  if [[ $2 == "airborne" || $2 == "cessna" || $2 == "bowman" ]]; then
    move_to $2
    use_environment $2
    honcho start
  else
    echo "unknown project"
  fi
else
  echo "unknown commond"
fi
