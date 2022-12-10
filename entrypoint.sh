#!/bin/sh

# Check if needed env vars are available
if [[ -z $OVH_HOSTING_USER || -z $OVH_HOSTING_PASSWORD || -z $OVH_HOSTING_DOMAIN || -z $REPOSITORY_URL || -z $DOMAIN ]]; then
  echo 'One or more needed env vars are undefined! Take a look at the example usage declaration.'
  exit 1
fi

sshpass -p "$OVH_HOSTING_PASSWORD" ssh -o StrictHostKeyChecking=no $OVH_HOSTING_USER@$OVH_HOSTING_DOMAIN "eval 'ssh-agent -s' && ssh-add ~/.ssh/id_rsa_deploy_alexishayat_me && cd /var/www/$DOMAIN && ssh -o StrictHostKeyChecking=no -vT git@github.com && git fetch && git reset --hard origin/master && rm -rf vendor/* && composer install && composer dump-autoload && npm ci && service nginx restart"

echo 'Done.'