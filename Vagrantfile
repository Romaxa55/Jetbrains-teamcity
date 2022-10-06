Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", disabled: false
  config.vm.box = "romaxa55/NixOS"
  config.vm.box_version = "22.05"
  config.vm.network "private_network", ip: "192.168.56.4"
  # set hostname
  config.vm.hostname = "nixy"
  # Через плагин прогоняем наш кастомный конфиг для nixOS
  config.vm.provision :nixos, run: 'always', path: "custom-configuration.nix", include:true,
  verbose: true
   #VirtualBox
    config.vm.provider :virtualbox do |vb|
          # Размер RAM памяти
         vb.customize ["modifyvm", :id, "--memory", 4096]
         vb.customize ["modifyvm", :id, "--cpus",  2]
         vb.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
    end
end