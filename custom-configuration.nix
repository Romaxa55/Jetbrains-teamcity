{ pkgs ? import <nixpkgs> {}
}:
{
environment.systemPackages = [ pkgs.git ];
}

