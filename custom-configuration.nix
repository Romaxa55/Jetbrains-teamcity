{ config, pkgs, ... }:

{
    imports =
    [ # Include the results of the hardware scan.
    ./configuration.nix
    ./hardware-configuration.nix
    ./vagrant-hostname.nix
    ./vagrant-network.nix
    ./vagrant.nix
    ];

  virtualisation.docker.enable = true;
  users.users.vagrant.extraGroups = [ "docker" ];

   config.docker-containers = {
    hello-world = {
      image = "hello-world:latest";
    };
  };
}