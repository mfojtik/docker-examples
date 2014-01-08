FROM        fedora:20
MAINTAINER  Michal Fojtik <mfojtik@redhat.com>

# To build this Docker container:
#
# $ docker pull fedora
# $ docker build -rm -t mfojtik:httpd .
#

# Update base container on each rebuild
RUN     yum update -y --quiet
RUN     yum install -y --quiet httpd php ruby

ADD     http://wordpress.org/latest.tar.gz /var/www/html/wordpress.tar.gz
RUN     cd /var/www/html && tar --strip-components=1 -zxvf wordpress.tar.gz
ADD     wordpress.conf /etc/httpd/conf.d/wordpress.conf
ADD     wp-settings.php.erb /root/wp-settings.php.erb
RUN     rm /etc/httpd/conf.d/welcome.conf
RUN     erb /root/wp-settings.php.erb > /var/www/html/wp-settings.php

# Used for linking to other containers
EXPOSE  80

ENTRYPOINT ["/bin/sh", "-c", "/usr/sbin/httpd", "-DFOREGROUND", "-k", "start"]
