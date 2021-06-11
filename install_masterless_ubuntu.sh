#!/bin/bash

MINION_CONFD=/etc/salt/minion.d
PILLAR_PATH=/srv/pillar
SALT_FILE_ROOTS=/srv/salt

apt install --yes -q salt-minion
systemctl stop salt-minion
systemctl disable salt-minion

cat >$MINION_CONFD/masterless.conf <<EOF
file_client: local
file_roots:
  base:
    - /srv/salt

EOF

# create default folders
mkdir -p $SALT_FILE_ROOTS $PILLAR_PATH

git clone https://github.com/kbaikov/salt-states.git $SALT_FILE_ROOTS


# sync execution modules and states
salt-call saltutil.sync_all

salt-call state.apply