# -*- mode: ruby -*-
# vi: set ft=ruby :
if ["up", "provision", "status"].include?(ARGV.first)
  require_relative "deployment/vagrant/ansible_galaxy_helper"
  AnsibleGalaxyHelper.install_dependent_roles("deployment/ansible")
end

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.define "website" do |website|

    website.vm.hostname = "website"

    # Jekyll server
    website.vm.network "forwarded_port", guest: 4000, host: 4000
    website.vm.synced_folder ".", "/vagrant"
    website.vm.synced_folder ".", "/opt/website"


    website.vm.provider "virtualbox" do |vb|
       vb.memory = "1024"
    end

    website.vm.provision "shell" do |s|
      s.inline = <<-SHELL
        if  ! grep -q "cd /opt/website" /home/vagrant/.bashrc; then
          echo 'cd /opt/website' >> /home/vagrant/.bashrc
        fi
      SHELL
    end

    website.vm.provision :ansible_local do |ans|
      ans.playbook = "deployment/ansible/website.yml"
      ans.install_mode = :pip
      ans.version = "2.1.2.0"
    end
  end
end
