{lib, ...}: {
  networking = {
    firewall.enable = true;
    nftables.enable = true;

    nat = {
      enable = true;
      externalInterface = "wan0";
      internalInterfaces = ["lan0"];
    };

    firewall.interfaces."lan0" = {
      allowedTCPPorts = [22];
      allowedUDPPorts = [53];
    };

    # Disable legacy DHCP
    interfaces = {
      "lan0".useDHCP = lib.mkForce false;
      "wan0".useDHCP = lib.mkForce false;
    };
  };

  systemd.network = {
    enable = true;
    links = {
      "10-lan0" = {
        matchConfig = {
          Path = "platform-3c0400000.pcie-pci-0001:01:00.0";
        };
        linkConfig = {
          Name = "lan0";
          MACAddress = "66:15:01:00:00:01";
          MACAddressPolicy = "none";
        };
      };
      "10-wan0" = {
        matchConfig = {
          Path = "platform-3c0800000.pcie-pci-0002:01:00.0";
        };
        linkConfig = {
          Name = "wan0";
          MACAddress = "66:15:01:00:00:00";
          MACAddressPolicy = "none";
        };
      };
    };
    networks = {
      "10-lan0" = {
        matchConfig.Name = "lan0";
        address = [
          "172.16.67.254/24"
        ];
        networkConfig.ConfigureWithoutCarrier = true;
      };
      "10-wan0" = {
        matchConfig.Name = "wan0";
        networkConfig = {
          # start a DHCP Client for IPv4 Addressing/Routing
          DHCP = "ipv4";
        };
        # make routing on this interface a dependency for network-online.target
        linkConfig.RequiredForOnline = "routable";
      };
    };
  };

  services.kea.dhcp4 = {
    enable = true;
    settings = {
      interfaces-config = {
        interfaces = ["lan0"];
      };
      lease-database = {
        type = "memfile";
        persist = true;
        name = "/var/lib/kea/dhcp4.leases";
      };
      subnet4 = [
        {
          id = 1;
          subnet = "172.16.67.0/24";
          pools = [{pool = "172.16.67.50 - 172.16.67.100";}];
          option-data = [
            {
              name = "routers";
              data = "172.16.67.254";
            }
            {
              name = "domain-name-servers";
              data = "172.16.67.254";
            }
          ];
        }
      ];
      valid-lifetime = 7200;
      renew-timer = 3600;
      rebind-timer = 6300;
    };
  };

  services.unbound = {
    enable = true;
    settings = {
      server = {
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
  networking.nameservers = ["172.16.67.254"];
}
