{lib, ...}: {
  networking = {
    networkmanager.enable = false;
    useDHCP = lib.mkDefault true;
    firewall.enable = true;
    extraHosts = ''
      172.16.66.100 pve.ekip.cc
      172.16.66.254 fw.ekip.cc
    '';
  };
}
