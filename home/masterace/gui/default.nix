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
    ./misc.nix
    ./media.nix
  ];
}
