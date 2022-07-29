#!/bin/bash

# source: https://github.com/stefan-evinance/wait-for-200/blob/master/wait-for-200.sh

TIMEOUT="${TIMEOUT:-60}"
seconds=0

echo 'Waiting up to' $TIMEOUT 'seconds for HTTP 200 from' $1
until [ "$seconds" -gt "$TIMEOUT" ] || $(curl -k --output /dev/null --silent --max-time $TIMEOUT --head --fail $1); do
  printf '.'
  sleep 2
  seconds=$((seconds+2))
done

if [ "$seconds" -lt "$TIMEOUT" ]; then
  echo 'OK'
else
  echo "ERROR: Timed out wating for HTTP 200 from" $1 >&2
  exit 1
fi