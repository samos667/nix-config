{ inputs, pkgs, ... }: {
  imports = [
    ../../modules/home/common.nix
    ../../modules/home/tui/tools
    ../../modules/home/tui/shell
    ../../modules/home/desktop/rational_pulsion
    ../../modules/home/desktop/common
    ../../modules/home/gaming
  ];

  home.packages = with pkgs; [ inputs.nivxim.packages.${system}.default ];
}
