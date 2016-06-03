Vagrant.configure(2) do |config|
    config.vm.hostname = "training"
    config.vm.box = "ubuntu/trusty64"
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
        vb.cpus = 2
        vb.name = "devstack-training"
    end
    config.vm.provision "file", source: "files/home", destination: "/"
    # config.vm.provision "shell", path: "install.sh"
    config.ssh.forward_x11 = true
end
