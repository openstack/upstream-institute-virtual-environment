Vagrant.configure(2) do |config|
    config.vm.hostname = "training"
    config.vm.box = "ubuntu/trusty64"
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "5120"
        vb.cpus = 2
        vb.name = "devstack-training"
        vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
        vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
    end
    config.vm.provision :shell, inline: "/vagrant/install-base.sh",
        privileged: false, keep_color: true
    config.vm.provision :shell, inline: "/vagrant/install-gui.sh",
        privileged: false, keep_color: true
    # config.vm.provision :shell, inline: "/vagrant/install-devstack.sh",
    #     privileged: false, keep_color: true
    config.vm.provision :shell, inline: "/vagrant/configure-vagrant.sh",
        privileged: false, keep_color: true
    config.vm.box_check_update = false
    config.ssh.forward_x11 = true
end
