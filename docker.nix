{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.arion

     # Do install the docker CLI to talk to podman.
     # Not needed when virtualisation.docker.enable = true;
    pkgs.docker-client
  ];
 }