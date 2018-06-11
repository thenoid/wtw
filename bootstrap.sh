#!/bin/bash

if dpkg -l | egrep -i salt-minion -q; then
  cowsay "salt already installed"
else
  apt-get install -y cowsay git
  curl -L https://bootstrap.saltstack.com | sudo sh
fi

sudo mkdir /tmp/wtw
sudo chmod 5777 /tmp/wtw
git clone https://github.com/thenoid/wtw.git /tmp/wtw
sudo /usr/bin/rsync --delete -HaveX /tmp/wtw/salt/ /srv/salt/

sudo salt-call --local state.apply

cowsay "all done"
