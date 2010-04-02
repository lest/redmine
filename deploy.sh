#!/bin/sh

host="redmine@redmine.tsdv.net"
dir="/home/redmine/apps/redmine-new"

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
ssh "$host" touch "$dir/tmp/restart.txt"
