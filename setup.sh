#!/bin/bash

apt_update(){
  sudo apt update && sudo apt dist-upgrade -y
}

# Internet conectando?
testes_internet(){
  if ! ping -c 1 8.8.8.8 -q &> /dev/null; then
    echo -e "${VERMELHO}[ERROR] - Seu computador não tem conexão com a Internet. Verifique a rede.${SEM_COR}"
    exit 1
  else
    echo -e "${VERDE}[INFO] - Conexão com a Internet funcionando normalmente.${SEM_COR}"
  fi
}

# ------------------------------------------------------------------------------ #

## Removendo travas eventuais do apt ##
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
testes_internet
travas_apt
wget https://raw.githubusercontent.com/vinirafaz/desktop_setup/main/setup.yml
sudo apt install -y ansible
sudo ansible-playbook setup.yml
