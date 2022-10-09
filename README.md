## Jetbrains-teamcity NixOs

#### Поднять Jetbrains teamcity сервер внутри NixOs и все необходимое для его функционирования. На том же сервере поднять соответствующего агента и обратный прокси с ssl.

### Решение
1) Собираю свежий образ NixOS и пушу его в облако Vagrant
```bash
git clone https://github.com/Romaxa55/Jetbrains-teamcity.git
cd Jetbrains-teamcity/nixbox && make build-x86_64
vagrant box add <Имя нашей сборки>
```

Ставим плагин vagrant-nixos-plugin для учтановкин nix пакетов через  provision
```bash
vagrant plugin install vagrant-nixos-plugin
vagrant up
```

```bash
% vagrant up     
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'romaxa55/NixOS'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'romaxa55/NixOS' version '22.05.4' is up to date...
==> default: Setting the name of the VM: Jetbrains-teamcity_default_1665178693601_83622
==> default: Fixed port collision for 22 => 2222. Now on port 2200.
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
    default: Adapter 2: hostonly
==> default: Forwarding ports...
    default: 22 (guest) => 2200 (host) (adapter 1)
==> default: Running 'pre-boot' VM customizations...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2200
    default: SSH username: vagrant
    default: SSH auth method: private key
    default: 
    default: Vagrant insecure key detected. Vagrant will automatically replace
    default: this with a newly generated keypair for better security.
    default: 
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if it's present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
==> default: Setting hostname...
==> default: Configuring and enabling network interfaces...
==> default: Mounting shared folders...
    default: /vagrant => /Users/19515436/DevOps/Jetbrains-teamcity
==> default: Running provisioner: nixos...
==> default: Running provisioner: shell...
    default: Running: inline script
    default: I am provisioning...
    default: git version 2.36.2
    default: Cloning into 'Jetbrains-teamcity'...
    default: teamcity-agent1 Pulling
    default: db Pulling
    default: teamcity-agent2 Pulling
    default: teamcity Pulling
    default: nginx Pulling
    default: node1 Pulling
    default: de9813870342 Pulling fs layer
    default: de9813870342 Download complete
    default: f76c285dfc76 Pulling fs layer
    default: 5f97dc5d71ab Pulling fs layer
    default: f76c285dfc76 Download complete
    default: 5f97dc5d71ab Download complete
    default: c39aa91943e9 Pulling fs layer
 ...
```

Контейнеры поднялись
```bash
ubuntu@work-vm:~$ docker ps
CONTAINER ID   IMAGE                              COMMAND                  CREATED          STATUS          PORTS                                                                      NAMES
cac229c63d8f   jetbrains/teamcity-server:latest   "/run-services.sh"       31 minutes ago   Up 31 minutes   0.0.0.0:49207->8111/tcp, :::49207->8111/tcp                                server
4aad77de7c4e   teamcity_agent                     "/run-services.sh"       31 minutes ago   Up 31 minutes                                                                              teamcity_agent_1
60fa6ee80d73   redis:3.2                          "docker-entrypoint.s…"   31 minutes ago   Up 31 minutes   6379/tcp                                                                   teamcity_redis_1
a53b2b6897c0   traefik:1.7-alpine                 "/entrypoint.sh --lo…"   31 minutes ago   Up 31 minutes   0.0.0.0:80->80/tcp, :::80->80/tcp, 0.0.0.0:443->443/tcp, :::443->443/tcp   teamcity_traefik_1
0fe03ff0f9b9   postgres                           "docker-entrypoint.s…"   31 minutes ago   Up 31 minutes   0.0.0.0:49205->5432/tcp, :::49205->5432/tcp                                teamcity_postgres_1
```

![Alt text](img/img1.png?raw=true "Teamcity")

![Alt text](img/img2.png?raw=true "Teamcity")

![Alt text](img/img3.png?raw=true "Teamcity")


[//]: # (sudo "/Library/Application Support/VirtualBox/LaunchDaemons/VirtualBoxStartup.sh" restart)


