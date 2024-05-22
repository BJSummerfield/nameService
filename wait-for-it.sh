#!/usr/bin/env bash
set -e

host="$1"
shift
until nc -z "$host" 3306; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "MySQL is up - executing command"
exec "$@"
