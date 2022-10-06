## Jetbrains-teamcity NixOs

#### Поднять Jetbrains teamcity сервер внутри NixOs и все необходимое для его функционирования. На том же сервере поднять соответствующего агента и обратный прокси с ssl.

### Решение
1) Развернел виртуалку NixOs через Vagrant (см Vagrantfile)

https://app.vagrantup.com/nixos/boxes/nixos-18.03-x86_64
```bash
vagrant init nixos/nixos-18.03-x86_64
vagrant up
```