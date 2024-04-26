{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.yq-go
    pkgs.jq
    pkgs.go
    pkgs.python312
    inputs.nixvim.packages.${pkgs.system}.default
    pkgs.neovide
  ];
}
