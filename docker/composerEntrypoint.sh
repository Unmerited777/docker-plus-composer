#!/bin/bash

#install composer
composer install --ignore-platform-reqs --no-ansi --no-autoloader --no-interaction --no-scripts

#keep local container up for future composer needs
tail -f /dev/null