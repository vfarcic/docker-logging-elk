# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.define "elk" do |node|
    node.vm.hostname = "elk"
    node.vm.network "private_network", ip: "10.100.199.200"
    node.vm.network "forwarded_port", guest: 5601, host: 5601
    node.vm.network "forwarded_port", guest: 9200, host: 9200
    node.vm.network "forwarded_port", guest: 25826, host: 25826
    node.vm.provision "ansible" do |a|
      a.playbook = "ansible/monitoring.yml"
    end
  end
  config.vm.define "docker-node" do |node|
    node.vm.hostname = "docker-node"
    node.vm.network "private_network", ip: "10.100.199.201"
    node.vm.network "forwarded_port", guest: 9000, host: 9000
    node.vm.provision "ansible" do |a|
      a.playbook = "ansible/docker-node.yml"
    end
  end
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end
end
