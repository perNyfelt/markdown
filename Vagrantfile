# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version
VAGRANTFILE_API_VERSION = "2"

# Override host locale variable
ENV["LC_ALL"] = "en_US.UTF-8"

$script = <<-'SCRIPT'
    wget -q https://ftpmirror1.infania.net/mirror/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
    tar -zxf apache-maven-3.6.3-bin.tar.gz -C /usr/local/
    if [[ -f /usr/bin/mvn ]]; then
        rm /usr/bin/mvn
    fi
    ln -s /usr/local/apache-maven-3.6.3/bin/mvn /usr/bin/mvn
    rm apache-maven-3.6.3-bin.tar.gz
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.provision "shell", inline: "apt-get update && apt-get install openjdk-8-jdk make gcc-4.7 gcc-4.7-plugin-dev gfortran-4.7 g++-4.7 gcc-4.7.multilib g++-4.7-multilib unzip libz-dev -y"
  config.vm.provision "shell", inline: $script
  config.vm.synced_folder ".", "/home/ubuntu/project"
  config.vm.synced_folder "~/.m2", "/home/vagrant/.m2"

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end
end
