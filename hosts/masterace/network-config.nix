{lib, ...}: {
  networking = {
    networkmanager.enable = false;
    useDHCP = lib.mkDefault true;
    firewall.enable = true;
    extraHosts = ''
      172.16.67.254 loulou.ekip.cc
    '';
  };
}
