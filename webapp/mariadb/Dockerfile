FROM        fedora:20
MAINTAINER  Michal Fojtik <mfojtik@redhat.com>

# To build this Docker container:
#
# $ docker pull fedora
# $ docker build -rm -t mfojtik:mariadb .
#

# Set the MariaDB account credentials here:
#
# The credentials are exported later by linking this container
# to other container.
#
# Change them to whatever is secure for you.
#
ENV     DBUSER   root
ENV     PASSWORD password

# Update base container on each rebuild
RUN     yum update -y --quiet
RUN     yum install -y --quiet mariadb-server

# Setup the default MariaDB account and database folder
ADD     setup_mariadb.sh /root/setup_mariadb.sh
RUN     /bin/sh /root/setup_mariadb.sh "$DBUSER" "$PASSWORD"

# Used for linking to other containers
EXPOSE  3306

# NOTE: /bin/sh is needed here to get mysqld_safe shell script to work.
#
ENTRYPOINT ["/bin/sh", "-c", "/usr/bin/mysqld_safe", "--bind-address", "0.0.0.0"]
