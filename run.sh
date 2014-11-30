#!/usr/bin/env bash
set -o errexit
set -o nounset

if [ "$#" -eq 0 ]; then
  export PORT=80
  exec cowsapi
else
  if [ "$1" = "--lol" ]; then
    /usr/bin/cowsay ${@:2:$#} | lolcat -f
  else
    exec /usr/bin/cowsay $@
  fi
fi
