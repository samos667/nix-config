{anyrun, ...}:

{
  imports = [
    anyrun.homeManagerModules.default
    ./hyprland.nix
    ./anyrun.nix
    ./packages.nix
    ./wayland-apps.nix
    ./misc.nix
    ./gtk.nix
    ./media.nix
    ./xdg.nix
  ];
}
