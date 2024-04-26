{lib, ...}: {
  networking.useDHCP = lib.mkDefault true;
  networking = {networkmanager.enable = false;};
  networking.firewall.enable = true;
}
