FROM phusion/baseimage:0.9.13
MAINTAINER Sebastien FAUVART <sebastien.fauvart@gmail.com>

# ------------------------------------------------------------------------------
# Install base
RUN apt-get update
RUN apt-get install -y git apache2 apache2-utils
RUN apt-get install -y php5 libapache2-mod-php5 php5-mysql php5-cli php-pear php5-curl php5-mcrypt php5-gd

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Enable PHP5 Modules
RUN php5enmod mcrypt
RUN a2enmod rewrite

RUN mkdir /etc/service/apache2
ADD apache2.sh /etc/service/apache2/run
RUN chmod +x /etc/service/apache2/run

EXPOSE 80

WORKDIR /app
CMD ["/sbin/my_init"]
