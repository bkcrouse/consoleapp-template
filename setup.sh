#!/usr/bin/bash

#
# pre-install for playbook execution
#
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
sudo dnf install git ansible -y
sudo dnf update -y


if [[ -d /tmp/consoleapp ]]; then
    rm -rf /tmp/consoleapp
fi

cd /tmp
git clone https://github.com/bkcrouse/consoleapp-template.git consoleapp
cd consoleapp

ansible-playbook site.yml --ask-vault-pass --flush-cache

