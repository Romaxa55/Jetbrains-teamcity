{ config, options, lib, pkgs, ... }:

{


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

