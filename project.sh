move_to() {
  local destination=$(get_config "project_root")/$1
  if [ "$destination" != `pwd` ]; then
    echo -e moving to $RED$1$NC project root
    cd $destination
  fi
}

activate_environment() {
  local environment=$(get_config "environment_root")/$1
  if [ "$environment" != "$VIRTUAL_ENV" ]; then
    echo -e "activating $RED$1$NC environment"
    source $environment/bin/activate
  fi
}
