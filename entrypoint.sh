#!/bin/sh

echo 'Initializing...'

sed -i 's/$host = .*/$host = '"'$DB_HOST';"'/g' /src/configuration.php
sed -i 's/$db = .*/$db = '"'$DB_NAME';"'/g' /src/configuration.php
sed -i 's/$user = .*/$user = '"'$DB_USERNAME';"'/g' /src/configuration.php
sed -i 's/$password = .*/$password = '"'$DB_PASSWORD';"'/g' /src/configuration.php
sed -i 's/$smtppass = .*/$smtppass = '"'$SMTP_PASSWORD';"'/g' /src/configuration.php

echo 'Copy source data into web folder'
cp -ru /src/. /var/www/html && chown -R 82:82 /var/www/html/.

echo 'Remove source data...'
rm -rf /src

echo 'Start serving...'