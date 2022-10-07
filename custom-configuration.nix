{ config, lib, pkgs, ... }: {
  networking.firewall.allowedTCPPorts = [ 80 443 ];
  services.nginx = {
    enable = true;
    virtualHosts = {
      "git.ingolf-wagner.de" = {
        listen = [
          {
            addr = "0.0.0.0";
            port = 4443;
            ssl = true;
          }
          {
            addr = "0.0.0.0";
            port = 80;
            ssl = false;
          }
        ];
        forceSSL = true;
        enableACME = true;
        locations."/" = { proxyPass = "http://workhorse.private:3000"; };
      };
      "paste.ingolf-wagner.de" = {
        listen = [
          {
            addr = "0.0.0.0";
            port = 4443;
            ssl = true;
          }
          {
            addr = "0.0.0.0";
            port = 80;
            ssl = false;
          }
        ];
        forceSSL = true;
        enableACME = true;
        locations."/" = { proxyPass = "http://workhorse.private:8000"; };
      };
      #"landing.ingolf-wagner.de" = {
      #  default = true;
      #  listen = [
      #    { addr = "0.0.0.0"; port = 4443; ssl = true; }
      #    { addr = "0.0.0.0"; port = 80; ssl = false; }
      #  ];
      #  forceSSL   = true;
      #  enableACME = true;
      #  locations."/" = {
      #    root = "/srv/www/ingolf-wagner.de";
      #  };
      #};
      "travel.ingolf-wagner.de" = {
        listen = [
          {
            addr = "0.0.0.0";
            port = 4443;
            ssl = true;
          }
          {
            addr = "0.0.0.0";
            port = 80;
            ssl = false;
          }
        ];
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          root = "/srv/www/travel";
          extraConfig = ''
            if (-d $request_filename) {
              rewrite [^/]$ $scheme://$http_host$request_uri/ permanent;
            }
          '';
        };
      };
      "tech.ingolf-wagner.de" = {
        listen = [
          {
            addr = "0.0.0.0";
            port = 4443;
            ssl = true;
          }
          {
            addr = "0.0.0.0";
            port = 80;
            ssl = false;
          }
        ];
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          root = "/srv/www/tech";
          extraConfig = ''
            if (-d $request_filename) {
              rewrite [^/]$ $scheme://$http_host$request_uri/ permanent;
            }
          '';
        };
      };
      "terranix.org" = {
        listen = [
          {
            addr = "0.0.0.0";
            port = 4443;
            ssl = true;
          }
          {
            addr = "0.0.0.0";
            port = 80;
            ssl = false;
          }
        ];
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          root = "/srv/www/terranix";
          extraConfig = ''
            if (-d $request_filename) {
              rewrite [^/]$ $scheme://$http_host$request_uri/ permanent;
            }
          '';
        };
      };
      "seafile.gaykraft.com" = {
        listen = [
          {
            addr = "0.0.0.0";
            port = 4443;
            ssl = true;
          }
          {
            addr = "0.0.0.0";
            port = 80;
            ssl = false;
          }
        ];
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://workhorse.private:3030";
          extraConfig = ''
            proxy_set_header   Host $host;
            proxy_set_header   X-Real-IP $remote_addr;
            proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header   X-Forwarded-Host $server_name;
            proxy_set_header   X-Forwarded-Proto https;
            sub_filter "http://seafile.gaykraft.com" "https://seafile.gaykraft.com";
            # used for view/edit office file via Office Online Server
            client_max_body_size 0;
          '';
        };
      };
      "gaykraft.com" = {
        listen = [
          {
            addr = "0.0.0.0";
            port = 4443;
            ssl = true;
          }
          {
            addr = "0.0.0.0";
            port = 80;
            ssl = false;
          }
        ];
        forceSSL = true;
        enableACME = true;
        locations."/" = { root = "/srv/www/gaykraft"; };
      };
    };
  };
  services.sslh = {
    enable = true;
    listenAddress = "0.0.0.0";
    port = 443;
    verbose = false;
    transparent = true;
    appendConfig = # json
      ''
        protocols:
        (
          { name: "ssh"; service: "ssh"; host: "localhost"; port: "2222"; probe: "builtin"; },
          { name: "ssl"; host: "localhost"; port: "4443"; probe: "builtin"; },
          { name: "tinc"; host: "localhost"; port: "655"; probe: "builtin"; }
        );
      '';
  };
  systemd.services."socat-proxy" = {
    wantedBy = [ "sslh.service" "multi-user.target" ];
    after = [ "sslh.service" ];
    script = ''
      ${pkgs.socat}/bin/socat TCP-LISTEN:2222,fork TCP:workhorse.private:2222
    '';
    #serviceConfig.User = "sslh";
  };
}