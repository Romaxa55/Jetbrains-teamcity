Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", disabled: false
  config.vm.box = "romaxa55/NixOS"
  config.vm.box_version = "22.05.4"
  config.vm.network "private_network", ip: "192.168.56.4"
  # set hostname
  config.vm.hostname = "nixy"
  config.vm.provision :nixos,
    run: 'always',
    expression: {
      environment: {
        systemPackages: [ :git ]
      }
    }
    $script = <<-SCRIPT
    echo I am provisioning... &&
    cd $HOME
    git --version
    docker rmi $(docker images -a -q
    cd Jetbrains-teamcity/teamcity
    docker compose up -d
    SCRIPT
  config.vm.provision "shell", inline: $script   #VirtualBox
    config.vm.provider :virtualbox do |vb|
          # Размер RAM памяти
         vb.customize ["modifyvm", :id, "--memory", 4096]
         vb.customize ["modifyvm", :id, "--cpus",  2]
         vb.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
    end
end