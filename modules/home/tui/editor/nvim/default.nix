{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    yq-go
    jq
    go
    python312
    inputs.nixvim.packages.${system}.default
    neovide
  ];
}
