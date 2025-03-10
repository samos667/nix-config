{lib, ...}: {
  networking = {
    firewall.enable = true;
    extraHosts = ''
      172.16.67.254 loulou.ekip.cc
    '';
    interfaces = {
      "enp6s0".useDHCP = lib.mkForce false;
      "vlan667".useDHCP = lib.mkForce false;
    };
  };
  systemd.network = {
    enable = true;
    networks = {
      "10-lan0" = {
        matchConfig.Name = "enp6s0";
        vlan = ["vlan667"];
      };
      "11-vlan667" = {
        matchConfig.Name = "vlan667";
        networkConfig.DHCP = "ipv4";
        # address = ["172.16.67.17/24"];
        vlan = ["vlan667"];
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
