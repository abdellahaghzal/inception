#!/bin/bash

mkdir -p /var/www/html/

wget https://www.adminer.org/latest.php -O /var/www/html/adminer.ph<p

chown www-data:www-data /var/www/html/adminer.php

chmod 755 /var/www/html/adminer.php

mv /var/www/html/adminer.php /var/www/html/index.php

php -S  0.0.0.0:9090 -t /var/www/html
