#!/bin/sh

host="root@serv"
dir="/var/www/localhost/apps/redmine-new"

ssh "$host" mkdir -p "$dir"
rsync -rLzc --progress --force --delete \
  --exclude ".git*" \
  --exclude "/deploy.sh" \
  --exclude "/log" \
  --exclude "/tmp" \
  --exclude "/files" \
  --exclude "/config/database.yml" \
  --exclude "/config/email.yml" \
  . "$host:$dir"
ssh "$host" sh -c '"chown -R redmine.redmine '$dir'; touch '$dir/tmp/restart.txt'"'
