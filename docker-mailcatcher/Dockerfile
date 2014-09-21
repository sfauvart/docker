FROM ubuntu:trusty
MAINTAINER Sébastien FAUVART <sebastien.fauvart@gmail.com>

# Install base packages
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# Install Ruby.
RUN apt-get update
#RUN apt-get upgrade -yq
RUN apt-get install -yq ruby ruby-dev ruby-bundler build-essential g++

# Install dependencies (sqlite3)
RUN apt-get install -yq sqlite3 libsqlite3-dev
RUN rm -rf /var/lib/apt/lists/*

# Install Mailcatcher
RUN gem install mailcatcher --no-rdoc --no-ri

EXPOSE 1025
EXPOSE 1080

#ENTRYPOINT ["mailcatcher"]
CMD ["mailcatcher","--foreground","--ip=0.0.0.0"]
