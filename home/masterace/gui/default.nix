{anyrun, ...}:

{
  imports = [
    ./packages.nix
    ./hyprland.nix
    anyrun.homeManagerModules.default
    ./anyrun.nix
    ./wayland-apps.nix
    ./gtk.nix
    ./xdg.nix
    ./fcitx5
    ./font.nix
    ./wallpaper
    ./misc.nix
    ./media.nix
  ];
}
