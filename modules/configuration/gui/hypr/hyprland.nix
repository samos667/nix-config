{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };
  security.pam.services.hyprlock = {};

  services.gvfs.enable = true; # https://nixos.wiki/wiki/Thunar
  programs.xfconf.enable = true;
}
