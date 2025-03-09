{...}: {
  systemd.network.networks."lan0" = {
    # https://www.freedesktop.org/software/systemd/man/latest/systemd.network.html#%5BDHCPv4%5D%20Section%20Options
    dhcpV4Config = {
      UseDNS = true;
      UseRoutes = true;
    };

    # https://www.freedesktop.org/software/systemd/man/latest/systemd.network.html#:~:text=Enables%20DHCPv4%20and,in%20version%20211.
    # What a mess
    # "Note that DHCPv6 will by default be triggered by Router Advertisements, if
    # reception is enabled, regardless of this parameter. By explicitly enabling DHCPv6
    # support here, the DHCPv6 client will be started in the mode specified by the
    # WithoutRA= setting in the [DHCPv6] section, regardless of the presence of routers
    # on the link, or what flags the routers pass."

    # https://www.freedesktop.org/software/systemd/man/latest/systemd.network.html#%5BDHCPv6%5D%20Section%20Options
    # dhcpV6Config = {
    #   UseDNS = true;
    #   UseRoutes = true;
    # };
  };

  networking = {
    firewall.enable = true;
    nftables.enable = true;
    networking.firewall.interfaces."lan0".allowedTCPPorts = [22];
    extraHosts = ''
      172.16.66.100 pve.ekip.cc
    '';

    interfaces."lan0" = {
      useDHCP = true;
      # OUI base:arbitrary model/hardware ID:virtual(0),physical(1):interface ID(16 last bit)
      macAddress = "66:15:01:00:00";
    };
  };
}
