#!/usr/bin/env bash

wait-for-it.sh database:5432
bin/console doctrine:migrations:migrate --no-interaction
