#!/usr/bin/env bash
set -o errexit
set -o nounset

if [ "$#" -eq 0 ]; then
  export PORT=${PORT:-80}
  cd /app
  exec bundle exec ruby routes.rb
else
  exec /usr/bin/cowsay $@
fi
