#!/bin/sh
# `/sbin/setuser cloud9` runs the given command as the user `cloud9`.
# If you omit that part, the command will be run as root.
NODE_ENV="production"
export NODE_ENV
#exec /sbin/setuser cloud9 /cloud9/bin/cloud9.sh -l 0.0.0.0 -w /workspace >> /var/log/cloud9.log 2>&1
# fix bind port < 1024 for users
exec setcap 'cap_net_bind_service=+ep' `which node`
exec /bin/bash -l -c '/sbin/setuser www-data /cloud9/bin/cloud9.sh $CLOUD9_PARAMS -l 0.0.0.0 -w /workspace' >> /var/log/cloud9.log 2>&1

