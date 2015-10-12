#master=$(get_config "root")
#set_config "root" "/srv/www"

get_config() {
  echo $(sed -n -e "/$1/ s/.*\= *//p" $GG_CLI_HOME/config)
}
set_config() {
  sed -i "s%^\($1\s*=\s*\).*$%\1$2%" $GG_CLI_HOME/config
}
