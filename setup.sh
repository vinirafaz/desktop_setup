#!/bin/bash

apt_update(){
  sudo apt update && sudo apt dist-upgrade -y
}

travas_apt(){
  if [ -f "/var/lib/dpkg/lock-frontend" ];
  then
    sudo rm /var/lib/dpkg/lock-frontend
  fi
  if [ -f "/var/cache/apt/archives/lock" ];
  then
    sudo rm /var/cache/apt/archives/lock
  fi
}


apt_update
travas_apt
wget https://raw.githubusercontent.com/vinirafaz/desktop_setup/main/setup.yml
sudo apt install -y ansible
sudo ansible-playbook setup.yml
