# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"  # Ubuntu 22.04 LTS
  
  # VM Configuration
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 2
    vb.name = "dev-setup"
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
    vb.gui = ENV['VAGRANT_GUI'] == 'true'
  end
  
  # Network Setup
  config.vm.network "private_network", ip: "192.168.56.10"
  
  # Shared Folders
  config.vm.synced_folder ".", "/vagrant"
  config.vm.synced_folder "files/automation", "/home/vagrant/automation", create: true
  config.vm.synced_folder "files/recordings", "/home/vagrant/recordings", create: true
  config.vm.synced_folder "~/Wallpapers", "/home/vagrant/Wallpapers", create: true
  
  # Ansible Provisioning
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"
    ansible.inventory_path = "inventory.ini"
    ansible.limit = "all"
    ansible.verbose = ENV['ANSIBLE_VERBOSE'] == 'true' ? "v" : false
    ansible.extra_vars = {
      ansible_user: "vagrant",
      ansible_ssh_private_key_file: ".vagrant/machines/default/virtualbox/private_key"
    }
  end
end

