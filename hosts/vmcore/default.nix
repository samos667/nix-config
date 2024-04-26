{ pkgs, ...}:
{
  imports = [
    ../../modules/configuration/hardware/vm
    ../../modules/configuration/system/common.nix
  ];

environment.systemPackages = with pkgs; [
    cloud-utils
  ];
}
