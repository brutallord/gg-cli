#!/bin/bash

#return if not sourced
if [ $0 != "-bash" ]; then
  echo "Run as source gg"
  exit
fi

#get scripts home directory
GG_CLI_HOME=$(dirname $(file $(which gg) | awk '{print $5}'))

#define import function
import() {
  source $GG_CLI_HOME/$1
}

#imports
import colors.sh
import configuration.sh
import project.sh

#run command
if [ $1 == "run" ]; then
  if [[ $2 == "airborne" || $2 == "bowman" || $2 == "cessna" || $2 == "fokker" ]]; then
    clear
    move_to $2
    use_environment $2
    if [ $2 == "airborne" ]; then
      honcho start
    else
      honcho start worker
    fi
  else
    echo "unknown project"
  fi
elif [ $1 == "config" ]; then
  if [ $# == 2 ]; then
    echo $(get_config $2)
  elif [ $# == 3 ]; then
    $(set_config $2 $3)
  else
    echo "incorrect config command arguments"
  fi
else
  echo "unknown commond"
fi
