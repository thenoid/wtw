# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
#  config.vm.box = "parallels/ubuntu-16.04"
  config.vm.define "1604" do |sixteen|
    sixteen.vm.box = "parallels/ubuntu-16.04"
  end
  config.vm.define "1404" do |fourteen|
    fourteen.vm.box = "parallels/ubuntu-14.04"
  end

  hv_memory = 6 * 1024
  hv_cpu = 4
  config.vm.provider "parallels" do |prl, override|
    prl.update_guest_tools = false
    prl.memory = hv_memory
    prl.cpus = hv_cpu
  end

  config.vm.provision "shell", inline: "touch /etc/is_vagrant_vm"
  config.vm.provision "shell", path: "bootstrap.sh"

end
