# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT

rpm -i http://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.noarch.rpm
rpm -i http://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
yum -q -y install unzip ruby MAKEDEV java-1.7.0-openjdk
cd /opt
wget -q http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip
unzip -qq ec2-api-tools.zip
rm -f ec2-api-tools.zip
ln -sf /opt/ec2-api-tools-* /opt/ec2-api-tools

cat > ${IMGMOUNT}/etc/sudoers.d/jenkins << EOM
Defaults:jenkins !requiretty
jenkins        ALL=(ALL)       NOPASSWD: /bin/mkdir, /bin/mount, /sbin/MAKEDEV, /usr/bin/yum, /bin/rm, /bin/sync, /bin/umount
EOM
chmod 0440 ${IMGMOUNT}/etc/sudoers.d/jenkins

echo "gem: --no-rdoc --no-ri" >> ~/.gemrc
puppet module install --force puppetlabs/stdlib
puppet module install --force puppetlabs/java
puppet module install --force rtyler/jenkins
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
    jenkins.vm.box = "puppet-centos-65-x64"
    jenkins.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"
    jenkins.vm.network "private_network", ip: "10.0.0.20"
    #jenkins.vm.network "public_network"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", "2048" ]
    end
    jenkins.vm.provision :shell, :inline => $script
    jenkins.vm.provision :puppet,
      :options => ["--debug", "--verbose", "--summarize"],
      :facter => { "fqdn" => "jenkins.sandbox.internal" } do |puppet|
        puppet.manifests_path = "./"
        puppet.manifest_file = "jenkins.pp"
    end
  end
end
