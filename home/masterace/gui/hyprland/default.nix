{anyrun, ...}:

{
  imports = [
    anyrun.homeManagerModules.default
    ./hyprland.nix
    ./anyrun.nix
    ./packages.nix
    ./wayland-apps.nix
  ];
}
