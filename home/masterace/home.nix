{ ... }: {
  imports = [
    ../../modules/home/common.nix
    ../../modules/home/tui/tools
    ../../modules/home/tui/shell
    ../../modules/home/tui/editor/nvim
    ../../modules/home/desktop/rational_pulsion
    ../../modules/home/desktop/common
    ../../modules/home/gaming
  ];
}
