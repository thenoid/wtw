#!/bin/bash

printf "%s\n" "################################################################################"
printf "%s\n" "Updating the box"
printf "%s\n" "################################################################################"
apt-get update
apt-get dist-upgrade -y
if dpkg -l | egrep -i salt-minion -q; then
  cowsay "salt already installed"
else
  printf "%s\n" "################################################################################"
  printf "%s\n" "Install Salt and Requirements"
  printf "%s\n" "################################################################################"
  apt-get install -y cowsay git
  curl -L https://bootstrap.saltstack.com | sudo sh
fi

printf "%s\n" "################################################################################"
printf "%s\n" "Getting the bits"
printf "%s\n" "################################################################################"
sudo rm -rfv /tmp/wtw
sudo mkdir /tmp/wtw
sudo chmod 5777 /tmp/wtw
git clone https://github.com/thenoid/wtw.git /tmp/wtw
sudo /usr/bin/rsync --delete -HaveX /tmp/wtw/salt/ /srv/salt/

printf "%s\n" "################################################################################"
printf "%s\n" " Executing Salt"
printf "%s\n" "################################################################################"
sudo salt-call --local state.apply

cowsay "all done"
