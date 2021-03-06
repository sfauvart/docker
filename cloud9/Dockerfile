FROM phusion/baseimage:0.9.13
MAINTAINER Sebastien FAUVART <sebastien.fauvart@gmail.com>

# ------------------------------------------------------------------------------
# Install base
RUN apt-get update
RUN apt-get install -y build-essential g++ wget curl libssl-dev apache2-utils git libxml2-dev

# Replace bourne shell
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# ------------------------------------------------------------------------------
# Install Node.js with NVM
ENV PROFILE /etc/profile
ENV NVM_DIR /usr/local/nvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | bash
RUN chmod -R u+rwX,g+rwX,o+rX /usr/local/nvm
RUN source /etc/profile
RUN /bin/bash -l -c 'nvm install v0.8.28'
RUN /bin/bash -l -c 'nvm alias default v0.8.28 && nvm use v0.8.28'

# ------------------------------------------------------------------------------
# Install Cloud9
RUN git clone https://github.com/ajaxorg/cloud9/ /cloud9
WORKDIR /cloud9
RUN /bin/bash -l -c 'npm install'

RUN /bin/bash -l -c 'npm install -g sm'

WORKDIR /cloud9/node_modules/ace
RUN /bin/bash -l -c 'make clean build'

WORKDIR /cloud9/node_modules/packager
RUN rm -rf node_modules
RUN /bin/bash -l -c 'sm install'
    
WORKDIR /cloud9
CMD ["make"]

RUN /bin/bash -l -c 'node ./node_modules/mappings/scripts/postinstall-notice.js'
# Fix port behind reverse proxy
# RUN sed -i "s/return schema + ':\/\/' + this.hostname + port + this.path + query;/return this.path + query;/" node_modules/engine.io-client/lib/transports/polling.js
# Fix sessions files
RUN mkdir .sessions
RUN chmod -R 777 .sessions

# ------------------------------------------------------------------------------
# Add volumes
RUN mkdir /workspace
VOLUME /workspace

# ------------------------------------------------------------------------------
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ------------------------------------------------------------------------------
# Expose ports.
# EXPOSE 3131

# ------------------------------------------------------------------------------
# Create the runit script
RUN mkdir /etc/service/cloud9
ADD cloud9.sh /etc/service/cloud9/run
RUN chmod +x /etc/service/cloud9/run

# create a user www-data
#USER www-data

WORKDIR /workspace
CMD ["/sbin/my_init"]

