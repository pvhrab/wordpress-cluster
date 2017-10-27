#!/bin/bash

# Update System Ubuntu & Install Criticall applications
sudo apt -qqy update && sudo apt -qqy upgrade && sudo apt install -qqy aptitude software-properties-common python-software-properties ufw mc git python-apt 

# Connect Ansible Repossitory
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt -qqy update
sudo apt-get -qqy install ansible

# Clear System
sudo apt -qqy autoremove && sudo apt -qqy autoclean

# Install docker
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
sudo apt-get install -y docker-engine

# Install Galaxy Ansible Rules
ansible-galaxy install andrewrothstein.vagrant -p /etc/ansible/roles
ansible-galaxy install geerlingguy.haproxy -p /etc/ansible/roles

# Play Ansible
ansible-playbook -c local core.yml

# Vagrant install modules
vagrant plugin install docker
vagrant plugin install host-manager

# start project
vagrant up
