# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.define "monitoring" do |node|
    node.vm.hostname = "monitoring"
    node.vm.network "private_network", ip: "10.100.199.202"
    node.vm.network "forwarded_port", guest: 5601, host: 5601
    node.vm.network "forwarded_port", guest: 9000, host: 9000
    node.vm.network "forwarded_port", guest: 9200, host: 9200
    node.vm.network "forwarded_port", guest: 25826, host: 25826
    node.vm.provision :shell, inline: "wget -qO- https://get.docker.com/ | sh"
    node.vm.provision :shell, inline: "ln -s /vagrant/conf conf"
  end
  config.vm.define "elk" do |node|
    node.vm.hostname = "elk"
    node.vm.network "private_network", ip: "10.100.199.200"
    node.vm.network "forwarded_port", guest: 5601, host: 5601
    node.vm.network "forwarded_port", guest: 9200, host: 9200
    node.vm.network "forwarded_port", guest: 25826, host: 25826
    node.vm.provision :shell, path: "ansible.sh"
    node.vm.provision :shell, inline: 'ansible-playbook /vagrant/ansible/monitoring.yml -c local -v'
  end
  config.vm.define "docker-node" do |node|
    node.vm.hostname = "docker-node"
    node.vm.network "private_network", ip: "10.100.199.201"
    node.vm.network "forwarded_port", guest: 9000, host: 9000
    node.vm.provision :shell, path: "ansible.sh"
    node.vm.provision :shell, inline: 'ansible-playbook /vagrant/ansible/docker-node.yml -c local -v'
  end
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end
end
