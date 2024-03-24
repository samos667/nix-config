{anyrun, ...}:

{
  imports = [
    anyrun.homeManagerModules.default
    ./misc.nix
    ./gtk.nix
    ./media.nix
    ./xdg.nix
  ];
}
