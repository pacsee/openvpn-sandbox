# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # web machine runs ERP application
  config.vm.define "vpnserver" do |conf|
    conf.vm.box = "ubuntu/trusty64"
    conf.vm.box_check_update = false
    conf.vm.network "private_network", ip: "192.168.33.10"
    conf.vm.provision :shell, path: "bootstrap.sh"
    conf.vm.provision :shell, path: "bootstrap_vpnserver.sh"
    conf.ssh.forward_agent = true
  end

  config.vm.define "webserver" do |conf|
    conf.vm.box = "ubuntu/trusty64"
    conf.vm.box_check_update = false
    conf.vm.network "private_network", ip: "192.168.33.11"
    conf.vm.provision :shell, path: "bootstrap.sh"
    conf.vm.provision :shell, path: "bootstrap_webserver.sh"
    conf.ssh.forward_agent = true
  end

  config.vm.define "client1" do |conf|
    conf.vm.box = "ubuntu/trusty64"
    conf.vm.box_check_update = false
    conf.vm.network "private_network", ip: "192.168.33.12"
    conf.vm.provision :shell, path: "bootstrap.sh"
    conf.vm.provision :shell, path: "bootstrap_client1.sh"
    conf.ssh.forward_agent = true
  end

  config.vm.define "client2" do |conf|
    conf.vm.box = "ubuntu/trusty64"
    conf.vm.box_check_update = false
    conf.vm.network "private_network", ip: "192.168.33.13"
    conf.vm.provision :shell, path: "bootstrap.sh"
    conf.vm.provision :shell, path: "bootstrap_client2.sh"
    conf.ssh.forward_agent = true
  end

end
