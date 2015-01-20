# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'json'

VAGRANTFILE_API_VERSION = '2'
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hp-ess/boot2docker"
  config.ssh.forward_agent = true
  config.vm.provider :virtualbox do |vb|
  vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.memory = 2048
    vb.cpus = 2
  end
end
