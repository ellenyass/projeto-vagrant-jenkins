Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"

  # VM 1 - Host/Jenkins
  config.vm.define "host" do |host|
    host.vm.hostname = "host"

    host.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
    end

    host.vm.network "private_network",
      ip: "192.168.56.10"

    host.vm.synced_folder "./app",
      "/home/projeto-vagrant-jenkins/app"

    host.vm.provision "shell",
      path: "vagrant/scripts/setup-jenkins.sh"
  end

  # VM 2 - Produção
  config.vm.define "prod" do |prod|
    prod.vm.hostname = "prod"

    prod.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
    end

    prod.vm.network "private_network",
      ip: "192.168.56.20"

    prod.vm.synced_folder "./app",
      "/home/projeto-vagrant-jenkins/app"

    prod.vm.provision "shell",
      path: "vagrant/scripts/setup-node.sh"
  end
end