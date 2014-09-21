#!/usr/bin/env bash
set -o errexit
set -o nounset

if [ "$#" -eq 0 ]; then
  export PORT=80
  cd /app
  exec bundle exec ruby routes.rb
else
  if [ "$1" = "--lol" ]; then
    /usr/bin/cowsay ${@:2:$#} | lolcat -f
  else
    exec /usr/bin/cowsay $@
  fi
fi
