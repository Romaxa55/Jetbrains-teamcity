Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", disabled: false
  config.vm.box = "nixos/nixos-18.03-x86_64"
  config.vm.network "private_network", ip: "192.168.56.4"
  # set hostname
  config.vm.hostname = "nixy"
  # Через плагин прогоняем наш кастомный конфиг для nixOS
  config.vm.provision :nixos, run: 'always', path: "custom-configuration.nix", verbose: true
end