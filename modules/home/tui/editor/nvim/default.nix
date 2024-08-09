{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.beautysh
    pkgs.shellcheck
    pkgs.prettierd
    pkgs.go
    pkgs.go-tools
    pkgs.stylua
    pkgs.lua54Packages.luacheck
    pkgs.alejandra
    pkgs.statix
    pkgs.black
    pkgs.pylint
    pkgs.codespell
    pkgs.yamllint
    pkgs.jq
    inputs.nixvim.packages.${pkgs.system}.default
  ];
}
