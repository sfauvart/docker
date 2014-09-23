FROM ubuntu:14.04
MAINTAINER Sebastien Fauvart <sebastien.fauvart@gmail.com>

# Make sure we're up to date
RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y unzip wget ruby ruby-dev build-essential imagemagick libmagickwand-dev libmysqlclient-dev apache2 apt-transport-https ca-certificates git-core

# Install Phusion Passenger
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
RUN echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main" > /etc/apt/sources.list.d/passenger.list
RUN apt-get update
RUN apt-get install -y libapache2-mod-passenger

# Fetch and extract Redmine
RUN wget -O /tmp/redmine.tar.gz http://www.redmine.org/releases/redmine-2.5.2.tar.gz
RUN tar xvfz /tmp/redmine.tar.gz -C /usr/local/
RUN ln -s /usr/local/redmine-* /usr/local/redmine
RUN touch /usr/local/redmine/log/production.log

WORKDIR /usr/local/redmine/plugins
RUN git clone git://github.com/backlogs/redmine_backlogs.git
# If needed check a tag
# RUN git checkout v1.0.6
RUN wget http://redminecrm.com/license_manager/14218/redmine_checklists-3_0_1-light.zip
RUN unzip redmine_checklists-3_0_1-light.zip
RUN rm redmine_checklists-3_0_1-light.zip

WORKDIR /usr/local/redmine

# Install dependencies
RUN gem install bundler
RUN gem install mysql2
RUN bundle install --without development test
# RUN bundle exec rake redmine:plugins NAME=redmine_checklists RAILS_ENV=production
# RUN bundle exec rake redmine:plugins NAME=redmine_backlogs RAILS_ENV=production

# Add files and clean up unnecessary files
ADD include_files/redmine_apache.conf /etc/apache2/redmine_apache.conf
ADD include_files/start.sh /start.sh

# Free up some disk space
RUN apt-get clean

EXPOSE 3000

CMD /start.sh
