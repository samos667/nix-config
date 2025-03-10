{
  services.kea.dhcp4 = {
    enable = true;
    settings = {
      interfaces-config = {
        interfaces = ["vlan667"];
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
}
