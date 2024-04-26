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

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # security.rtkit.enable = true; # Don't seem to be needed anymore
}
