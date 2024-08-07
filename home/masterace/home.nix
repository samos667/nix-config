{ inputs, pkgs, username, homeDirectory, ... }: {
  imports = [
    ../../modules/home/common.nix
    ../../modules/home/tui/tools
    ../../modules/home/tui/shell
    ../../modules/home/desktop/rational_pulsion
    ../../modules/home/desktop/common
    ../../modules/home/gaming
  ];

  home = {
    inherit username homeDirectory;
    stateVersion = "23.11";
  };

  # Let Home Manager install and manage itself.
  programs = { home-manager.enable = true; };

  nixpkgs = { config = { allowUnfree = true; }; };

  home.packages = [ inputs.nixvim.packages.${pkgs.system}.default ];
}
