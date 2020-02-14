#!/bin/sh

echo 'Initializing...'

sed -i 's/$host = .*/$host = '"'$DB_HOST';"'/g' /src/configuration.php
sed -i 's/$db = .*/$db = '"'$DB_NAME';"'/g' /src/configuration.php
sed -i 's/$user = .*/$user = '"'$DB_USERNAME';"'/g' /src/configuration.php
sed -i 's/$password = .*/$password = '"'$DB_PASSWORD';"'/g' /src/configuration.php
sed -i 's/$smtppass = .*/$smtppass = '"'$SMTP_PASSWORD';"'/g' /src/configuration.php

echo 'Copy source data into web folder'
rsync -aq --ignore-existing /src/images /var/www/html/images
rsync -aq /src/ /var/www/html/ --exclude images
chown -R 82:82 /var/www/html/.
find /var/www/html/ -type d -print0 | xargs -0 chmod 0755
find /var/www/html/ -type f -print0 | xargs -0 chmod 0644

echo 'Remove source data...'
rm -rf /src

echo 'Start serving...'