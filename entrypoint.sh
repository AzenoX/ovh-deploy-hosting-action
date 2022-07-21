#!/bin/bash

# Check if needed env vars are available
if [[ -z $OVH_HOSTING_USER || -z $OVH_HOSTING_PASSWORD || -z $OVH_HOSTING_DOMAIN || -z $REPOSITORY_URL || -z $DOMAIN ]]; then
  echo 'One or more needed env vars are undefined! Take a look at the example usage declaration.'
  exit 1
fi

sshpass -p "$OVH_HOSTING_PASSWORD" ssh -o StrictHostKeyChecking=no $OVH_HOSTING_USER@$OVH_HOSTING_DOMAIN "cd /var/www/$DOMAIN && rm -rf ..?* .[!.]* * && git clone $REPOSITORY_URL . && composer install && npm i && chmod 777 -R storage/ && chmod 777 -R public/ && service nginx restart"
echo 'Done.'