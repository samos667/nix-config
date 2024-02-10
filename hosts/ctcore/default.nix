{ pkgs, modulesPath, ... }:

{
  imports =
    [
      ../../modules/default.nix

      ./hardware-config.nix
    ];
}
