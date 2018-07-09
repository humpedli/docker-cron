#!/bin/sh

# copy crone file to the right place
cp /cronfile /var/spool/cron/crontabs/root

# start cron
/usr/sbin/crond -f -l 2