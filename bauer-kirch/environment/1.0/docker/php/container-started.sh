#!/usr/bin/env bash

wait-for-it.sh database:3306
bin/console doctrine:migrations:migrate --no-interaction
