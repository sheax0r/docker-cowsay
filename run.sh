#!/usr/bin/env bash
set -e errexit
set -e nounset

export PORT=${PORT:-80}

cd /app
exec bundle exec ruby routes.rb
