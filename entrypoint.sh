#!/bin/bash

# Check if needed env vars are available
if [[ -z $OVH_HOSTING_USER || -z $OVH_HOSTING_PASSWORD || -z $OVH_HOSTING_DOMAIN || -z $REPOSITORY_URL || -z $DOMAIN ]]; then
  echo 'One or more needed env vars are undefined! Take a look at the example usage declaration.'
  exit 1
fi

#sshpass -p "$OVH_HOSTING_PASSWORD" ssh $OVH_HOSTING_USER@$OVH_HOSTING_DOMAIN "cd /var/www/$DOMAIN && git fetch && git reset --hard origin/master && rm -rf vendor/* && composer install && composer dump-autoload && npm ci && service nginx restart"
sshpass -p "$OVH_HOSTING_PASSWORD" -o StrictHostKeyChecking=no ssh $OVH_HOSTING_USER@$OVH_HOSTING_DOMAIN "cd /root && touch test.txt"

echo 'Done.'