## Jetbrains-teamcity NixOs

#### Поднять Jetbrains teamcity сервер внутри NixOs и все необходимое для его функционирования. На том же сервере поднять соответствующего агента и обратный прокси с ssl.

### Решение
1) Собираю свежий образ NixOS и пушу его в облако Vagrant
```bash
git clone https://github.com/Romaxa55/Jetbrains-teamcity.git
cd Jetbrains-teamcity/nixbox && make build-x86_64
```

Ставим плагин vagrant-nixos-plugin
```bash
vagrant plugin install vagrant-nixos-plugin
vagrant init nixos/nixos-18.03-x86_64
vagrant up
```

P.S. Это на тот случай, если VirtualBox работает не стабильно и валится с ошибкой
```bash
sudo "/Library/Application Support/VirtualBox/LaunchDaemons/VirtualBoxStartup.sh" restart
```