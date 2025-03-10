{
  inputs,
  pkgs,
  lib,
  ...
}: let
  adlist = inputs.adblock-unbound.packages.${pkgs.system};
in {
  firewall.interfaces."lan0".allowedUDPPorts = [53];
  networking.nameservers = lib.mkForce ["172.16.67.254"];
  services.unbound = {
    enable = true;
    settings = {
      server = {
        include = [
          "\"${adlist.unbound-adblockStevenBlack}\""
        ];
        interface = ["172.16.67.254"];
        port = 53;
        access-control = [
          "172.16.67.0/24 allow"
        ];
        harden-glue = true;
        harden-dnssec-stripped = true;
        use-caps-for-id = false;
        hide-identity = true;
        hide-version = true;
        prefetch = true;
        edns-buffer-size = 1232;
        so-rcvbuf = "1m";
        auto-trust-anchor-file = "/var/lib/unbound/root.key";

        local-zone = [
          ''"ekip.cc." static''
        ];

        local-data = [
          ''"loulou.ekip.cc. 3600 IN A 172.16.67.254"''
        ];
      };

      forward-zone = [
        {
          name = ".";
          forward-addr = [
            "1.1.1.1@853#cloudflare-dns.com"
            "1.0.0.1@853#cloudflare-dns.com"
          ];
          forward-tls-upstream = true;
        }
      ];
    };
  };
}
