#!/bin/bash

# An example on how to run Redmine
docker run -d \
  --name redmine-1 \
  --link mysql1:db1 \
  -v /home/sebf/redmine-store/1/config/database.yml:/usr/local/redmine/config/database.yml \
  -v /home/sebf/redmine-store/1/config/configuration.yml:/usr/local/redmine/config/configuration.yml \
  -v /home/sebf/redmine-store/1/files:/usr/local/redmine/files \
  -e "RUN_MIGRATION=True" \
  -e "INSTALL_BUNDLE=True" \
  -p 3030:3000 sebf/redmine
#  -v /home/sebf/redmine-store/1/themes:/usr/local/redmine/public/themes \
#  -v /home/sebf/redmine-store/1/plugins:/usr/local/redmine/plugins \
