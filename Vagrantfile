# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "node1" do |node1|
	node1.vm.box = "debian/buster64"
	node1.vm.hostname = "node1"
	node1.vm.network "private_network", ip: "10.0.3.154", virtualbox__intnet: "lab_ansible"
  node1.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
	node1.vm.provider "virtualbox" do |node1_vb|
      node1_vb.cpus = 2
      node1_vb.memory = 2048
      node1_vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    end
	node1.vm.provision "shell", path: "scripts_va/node.sh"
  end
  config.vm.define "ansible_linux" do |ansible|
	ansible.vm.box = "debian/buster64"
	ansible.vm.hostname = "ansible"
	ansible.vm.network "private_network", ip: "10.0.3.153", virtualbox__intnet: "lab_ansible"
	ansible.vm.synced_folder "Ansible", "/tmp/ansible/"
	ansible.vm.provider "virtualbox" do |ansible_vb|
      ansible_vb.cpus = 2
      ansible_vb.memory = 2048
      ansible_vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    end
	ansible.vm.provision "shell", path: "scripts_va/ansible.sh"
  end
end