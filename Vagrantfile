Vagrant.configure(2) do |config|
    config.vm.hostname = "training"
    config.vm.box = "ubuntu/trusty64"
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
        vb.cpus = 2
        vb.name = "devstack-training"
        vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
        vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
    end
    config.vm.provision :file, source: "files/home", destination: "/"
    config.vm.provision :shell, path: "install-base.sh", privileged: false,
        keep_color: true
    config.vm.provision :shell, path: "install-devstack.sh", privileged: false,
        keep_color: true
    config.vm.box_check_update = false
    config.ssh.forward_x11 = true
    config.vm.synced_folder File.expand_path('~'), '/home/vagrant/host'
end
