{
  networking = {
    firewall.enable = true;
    extraHosts = ''
      172.16.67.254 loulou.ekip.cc
    '';
  };
  systemd.network = {
    enable = true;
    networks = {
      "10-lan0" = {
        matchConfig.Name = "enp6s0";
        vlan = ["vlan667"];
      };
    };
    netdevs = {
      "vlan667" = {
        netdevConfig = {
          Name = "vlan667";
          Kind = "vlan";
        };
        networkConfig.DHCP = "ipv4";
        vlanConfig.Id = 667;
      };
    };
  };
}
