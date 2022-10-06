{ config, options, lib, pkgs, ... }:

{
    imports =
    [ # Include the results of the hardware scan.
    ./configuration.nix
    ./hardware-configuration.nix
    ./vagrant-hostname.nix
    ./vagrant-network.nix
    ./vagrant.nix
    ];
#
#    virtualisation.docker.enable = true;
#    users.users.vagrant.extraGroups = [ "docker" ];

    environment.systemPackages = [
    pkgs.arion

     # Do install the docker CLI to talk to podman.
     # Not needed when virtualisation.docker.enable = true;
    pkgs.docker-client
  ];
  virtualisation.docker.enable = false;
  virtualisation.podman.enable = true;
  virtualisation.podman.dockerSocket.enable = true;
  virtualisation.podman.defaultNetwork.dnsname.enable = true;
  users.extraUsers.vagrant.extraGroups = ["podman"];

#    containerImage = pkgs.dockerTools.buildLayeredImage
#      {
#        name = "thewagner.net";
#        contents = [ pkgs.python3 vag ];
#        config = {
#          Cmd = [
#            "${pkgs.python3}/bin/python" "-m" "http.server" 8000
#            "--directory" "${htmlPages}"
#          ];
#          ExposedPorts = {
#            "8000/tcp" = { };
#          };
#        };
#      };

}

