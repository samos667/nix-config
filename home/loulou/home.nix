{
  username,
  homeDirectory,
  ...
}: {
  imports = [
    # ../../modules/home/common.nix
  ];

  home = {
    inherit username homeDirectory; # Inherit from ../../flake.nix
    stateVersion = "24.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
}
