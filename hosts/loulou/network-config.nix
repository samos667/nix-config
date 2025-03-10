{lib, ...}: {
  import = [
    ./dhcp-kea.nix
    ./dns-unbound.nix
    # ./ha-kube.nix
  ];

  networking = {
    firewall.enable = true;
    nftables.enable = true;

    nat = {
      enable = true;
      externalInterface = "wan0";
      internalInterfaces = ["lan0"];
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
}
