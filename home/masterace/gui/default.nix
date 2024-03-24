{anyrun, ...}:

{
  imports = [
    ./packages.nix
    ./hyprland.nix
    anyrun.homeManagerModules.default
    ./waybar.nix
    ./anyrun.nix
  ];
}
