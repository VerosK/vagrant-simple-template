# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "centos-6.x-64bit-puppet.3.x"
  config.vm.box_url = "http://packages.vstone.eu/vagrant-boxes/centos-6.x-64bit-latest.box"

  config.vm.provider "virtualbox" do |vb|

    #  Boot with graphic card
    #vb.gui = true
 
    # Add memory
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "site.pp"
    puppet.module_path = ['modules']
    puppet.hiera_config_path = 'hiera/00_hiera_config.yaml'
    puppet.working_directory = "/vagrant"
  end

end