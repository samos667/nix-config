{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = with pkgs; xdg-desktop-portal-hyprland;
  };
  security.pam.services.hyprlock = {};

  services.gvfs.enable = true; # https://nixos.wiki/wiki/Thunar
  programs.xfconf.enable = true;
}
