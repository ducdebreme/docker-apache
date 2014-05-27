FROM ubuntu:12.04
ENV http_proxy http://00026898:Stefan1@165.222.184.232:8080
ENV https_proxy http://00026898:Stefan1@165.222.184.232:8080

RUN apt-get update
# RUN apt-get upgrade -y


RUN DEBIAN_FRONTEND=noninteractive apt-get install -y  apache2 php5 php5-mysql php-pear php5-gd php5-xcache memcached php5-memcache
RUN apt-get install -y  p7zip unzip vim supervisor

RUN pear config-set http_proxy http://00026898:Stefan1@165.222.184.232:8080
RUN pear channel-discover pear.drush.org
RUN pear install drush/drush
RUN pear install Console_Table


RUN a2enmod rewrite

ADD ./conf/apache/000-default /etc/apache2/sites-enabled/
ADD ./conf/apache/supervisord-apache2.conf /etc/supervisor/conf.d/
ADD ./conf/apache/start-apache.sh /opt/start-apache.sh

ADD ./conf/php/php.ini /etc/php5/apache2/
ADD ./conf/php/xcache.ini /etc/php5/conf.d/

ADD ./conf/memcached/supervisord-memcached.conf /etc/supervisor/conf.d/

ADD ./run.sh /opt/run.sh

RUN chmod 755 /opt/*.sh

EXPOSE 80

# CMD ["/bin/bash", "/opt/startup.sh"]