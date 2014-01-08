#!/bin/bash -e

echo "Creating MariaDB database directory"
/usr/bin/mysql_install_db --user=mysql >/dev/null

echo "Creating '$1' MariaDB account with password '$2'"
/usr/bin/mysqld_safe --nowatch --skip-syslog --flush-caches && sleep 5
/usr/bin/mysqladmin -u "$1" password "$2"
echo "GRANT ALL ON *.* TO $1@'%' IDENTIFIED BY '$2' WITH GRANT OPTION; FLUSH
PRIVILEGES" | /usr/bin/mysql --password="$2"
kill -n 15 `cat /var/run/mariadb/mariadb.pid`
