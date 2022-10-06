## Jetbrains-teamcity NixOs

#### Поднять Jetbrains teamcity сервер внутри NixOs и все необходимое для его функционирования. На том же сервере поднять соответствующего агента и обратный прокси с ssl.

### Решение
1) Развернел виртуалку NixOs через Vagrant (см Vagrantfile)

https://app.vagrantup.com/nixos/boxes/nixos-18.03-x86_64
```bash
vagrant plugin install vagrant-nixos-plugin
vagrant init nixos/nixos-18.03-x86_64
vagrant up
```


Если, посыпались ошибки

Solution:

Open VirtualBox and shut down every VM running
Go to System Preferences > Security & Privacy Then hit the "Allow" button to let Oracle (VirtualBox) load.
Restart VirtualBox

```bash
sudo "/Library/Application Support/VirtualBox/LaunchDaemons/VirtualBoxStartup.sh" restart
```