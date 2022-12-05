#!/bin/bash

# Check if needed env vars are available
if [[ -z $OVH_HOSTING_USER || -z $OVH_HOSTING_PASSWORD || -z $OVH_HOSTING_DOMAIN || -z $REPOSITORY_URL || -z $DOMAIN ]]; then
  echo 'One or more needed env vars are undefined! Take a look at the example usage declaration.'
  exit 1
fi

sshpass -p "$SECRET_PASS" ssh -o StrictHostKeyChecking=no git@github.com "cd /var/www/$DOMAIN && git reset --hard origin/master && rm -rf vendor/* && composer install && composer dump-autoload && npm ci && service nginx restart"

echo 'Done.'