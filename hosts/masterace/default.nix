{ pkgs, ... }:
let hostname = "masterace";
in {
  imports = [
    ../../modules/configuration/secrets/github.nix
    ../../modules/configuration/secrets/sops_steropes.nix
    ../../modules/configuration/secrets/talconfig.nix
    ../../modules/configuration/secrets/kubeconfig.nix
    ./hardware-config.nix
    ../../modules/configuration/system/nvidia.nix
    ../../modules/configuration/system/common.nix
    ../../modules/configuration/system/zram.nix
    ../../modules/configuration/services/kmscon.nix
    ../../modules/configuration/services/docker.nix
    ../../modules/configuration/gui/hypr
    ./packages.nix
    ../../modules/configuration/services/steam.nix
  ];

  networking.hostName = hostname;
  # networking.computerName = hostname;

  users.users.sam.shell = pkgs.nushell;

  networking = { networkmanager.enable = false; };

  # Needed for screen sharing on hyprland
  security.rtkit.enable = true;

  virtualisation.docker.enableNvidia = true;

  hardware.logitech.wireless.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  programs.nix-ld.enable = true;

  services.flatpak.enable = true;
}
