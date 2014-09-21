FROM ubuntu:trusty
MAINTAINER Sébastien FAUVART <sebastien.fauvart@gmail.com>

# Dockerfile based from https://github.com/tutumcloud/tutum-docker-php
# adapted to work with a magento install

# Install base packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -yq install \
        curl \
        apache2 \
        libapache2-mod-php5
RUN apt-get -yq install \
        php5-mysql \
        php5-gd \
        php5-curl \
        php-pear \
        php5-mcrypt \
        php5-mhash \
        php-soap
        php-apc && \
    rm -rf /var/lib/apt/lists/*
RUN sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini

# prepare to the future...
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Configure /app folder with sample app
RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html
RUN php5enmod mcrypt
RUN a2enmod rewrite

# Add application code onbuild
ONBUILD RUN rm -fr /app
ONBUILD ADD . /app
ONBUILD RUN chown www-data:www-data /app -R

EXPOSE 80
WORKDIR /app
CMD ["/run.sh"]
