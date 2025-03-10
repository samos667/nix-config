{lib, ...}: {
  imports = [
    ./dhcp-kea.nix
    ./dns-unbound.nix
    # ./ha-kube.nix
  ];

  networking = {
    firewall.enable = true;
    nftables.enable = true;
    firewall.interfaces."vlan667".allowedTCPPorts = [22];

    nat = {
      enable = true;
      externalInterface = "wan0";
      internalInterfaces = ["vlan667"];
    };

    # Disable legacy DHCP
    interfaces = {
      "lan0".useDHCP = lib.mkForce false;
      "wan0".useDHCP = lib.mkForce false;
      "vlan667".useDHCP = lib.mkForce false;
    };
  };

  systemd.network = {
    enable = true;
    links = {
      "10-lan0" = {
        linkConfig = {
          MACAddress = "66:15:01:00:00:01";
          MACAddressPolicy = "none";
        };
      };
      "10-wan0" = {
        linkConfig = {
          MACAddress = "66:15:01:00:00:00";
          MACAddressPolicy = "none";
        };
      };
    };
    networks = {
      "10-lan0" = {
        matchConfig.Name = "lan0";
        vlan = [
          "vlan667"
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

      "11-vlan667" = {
        matchConfig.Name = "vlan667";
        networkConfig.ConfigureWithoutCarrier = true;
        address = ["172.16.67.254/24"];
      };
    };
    netdevs = {
      "vlan667" = {
        netdevConfig = {
          Name = "vlan667";
          Kind = "vlan";
        };
        vlanConfig.Id = 667;
      };
    };
  };
}
