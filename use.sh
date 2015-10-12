move_to() {
  echo -e moving to $RED$1$NC project root
  cd $(get_config "project_root")/$1
}

use_environment() {
  echo -e activating $RED$1$NC environment
  source $(get_config "environment_root")/$1/bin/activate
}
