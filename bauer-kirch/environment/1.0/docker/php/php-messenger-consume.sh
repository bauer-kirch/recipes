#!/usr/bin/env bash

set -e

cd /var/www/app

wait-for-200.sh https://nginx/_profiler
bin/console messenger:consume async -vv
