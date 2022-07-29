#!/usr/bin/env bash

wait-for-it.sh mariadb:3306
bin/console doctrine:migrations:migrate --no-interaction
