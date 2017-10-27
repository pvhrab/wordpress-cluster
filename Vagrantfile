# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
VAGRANTFILE_API_VERSION = "2" 

Vagrant.require_version ">= 1.6.3"

require 'shellwords'

Vagrant.configure("2") do |config|
  config.vm.box = "tknerr/baseimage-ubuntu-16.04"
  config.vm.box_version = "1.0.0"

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = false
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = false

  config.vm.define "node1" do |node1|
    node1.vm.hostname="docker10"
    node1.vm.provision "shell", inline: "service mysql restart && service php7.0-fpm restart && service nginx restart"
    node1.vm.network :forwarded_port, guest: 80, host: 8800, host_ip: "127.0.0.1"
  end

  config.vm.provider "docker" do |d|
    d.create_args = ["-d", "-it", "-m", "1g"]
    d.remains_running = true
    d.has_ssh = true
    d.volumes = [
        "/srv/www/:/var/www/",
        "/srv/db/mysql/:/var/lib/mysql/",
    ]
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.provisioning_path = "/vagrant"
    ansible.playbook = "playbook.yml"
  end
end
