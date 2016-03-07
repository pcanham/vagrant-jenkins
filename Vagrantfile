# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
echo "gem: --no-rdoc --no-ri" >> ~/.gemrc
puppet module install --force puppetlabs/stdlib
puppet module install --force puppetlabs/java
puppet module install --force nanliu/staging
puppet module install --force camptocamp/archive
puppet module install --force rtyler/jenkins
puppet module install --force puppetlabs/firewall
SCRIPT


Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.customize [
      "modifyvm", :id,
      "--memory", "512",
      "--cpus", "4",
      "--natdnspassdomain1", "off",
      ]
  end


  config.vm.define :jenkins do |jenkins|
    jenkins.vm.box = "puppet-centos-70-x64"
    jenkins.vm.box = "puppetlabs/centos-7.0-64-puppet"
    jenkins.vm.box_version = '1.0.1'
    jenkins.vm.box_check_update = true
    jenkins.vm.network "private_network", ip: "10.0.0.20"
    #jenkins.vm.network "public_network"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", "4096" ]
    end
    jenkins.vm.provision :shell, :inline => $script
    jenkins.vm.provision :puppet,
      :options => ["--debug", "--verbose", "--summarize"],
      :facter => { "fqdn" => "jenkins.sandbox.internal" } do |puppet|
        puppet.manifests_path = "."
        puppet.manifest_file = "jenkins.pp"
        puppet.environment = 'all'
        #puppet.environment_path = 'environments'
        #puppet.module_path = "/etc/puppetlabs/code/environments/production/modules"
    end
  end
end
