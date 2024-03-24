{anyrun, ...}:

{
  imports = [
    ./packages.nix
    ./hyprland.nix
    anyrun.homeManagerModules.default
    ./anyrun.nix
  ];
}
