{pkgs, ...}: {
  imports = [
    ./hardware-config.nix
    ../../modules/configuration/common.nix
    ../../modules/configuration/services/docker.nix
    ../../modules/configuration/services/kmscon.nix
    ../../modules/configuration/services/ollama.nix
    ../../modules/configuration/services/ssh.nix
    ../../modules/configuration/services/zram.nix
    ../../modules/configuration/gui/hypr
    ../../modules/configuration/gui/gaming.nix
    ../../modules/configuration/localization/baguette.nix
    ../../modules/configuration/users/sam.nix # It's me :)
  ];
  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
    enableSSHSupport = true;
  };
}
