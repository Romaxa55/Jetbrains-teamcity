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

```bash
mkdir -p teamcity
mkdir teamcity/data
mkdir teamcity/logs
mkdir teamcity/agent
docker pull jetbrains/teamcity-server
docker run -it -d --name server -u root -v /teamcity/data:/data/teamcity_server/datadir -v /teamcity/logs:/opt/teamcity/logs -p 8111:8111 jetbrains/teamcity-server
```