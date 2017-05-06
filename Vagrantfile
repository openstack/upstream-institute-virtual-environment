Vagrant.configure(2) do |config|
    config.vm.hostname = "upstream-training"
    config.vm.box = "ubuntu/xenial64"
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
        vb.cpus = 2
        vb.name = "upstream-training"
        vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
        vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
        vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
        vb.customize ["modifyvm", :id, "--vram", "32"]
        vb.customize ["modifyvm", :id, "--natnet1", "192.168.10/24"]
        # Xenial COM1 port logging
        vb.customize ["modifyvm", :id, "--uartmode1", "disconnected"]
        # Set disks as SSD (fixes OSX Virtualbox Ubuntu boot problems)
        vb.customize ["storageattach", :id, "--storagectl", "SCSI", 
                                            "--port", "0", 
                                            "--nonrotational", "on"]
        vb.customize ["storageattach", :id, "--storagectl", "SCSI", 
                                            "--port", "1", 
                                            "--nonrotational", "on"]
    end
    config.vm.provision :shell, inline: "/vagrant/install-base.sh",
        privileged: false, keep_color: true
    config.vm.provision :shell, inline: "/vagrant/install-gui.sh",
        privileged: false, keep_color: true
    config.vm.provision :shell, inline: "/vagrant/install-devstack.sh",
        privileged: false, keep_color: true
    config.vm.provision :shell, inline: "/vagrant/configure-vagrant.sh",
        privileged: false, keep_color: true
    config.vm.provision :shell, inline: "/vagrant/cleanup.sh",
        privileged: false, keep_color: true
    config.vm.box_check_update = true
    config.vm.graceful_halt_timeout = 180
    config.ssh.forward_x11 = true
    config.ssh.forward_agent = true
end
