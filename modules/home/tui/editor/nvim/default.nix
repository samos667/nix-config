{ nixvim, ... }:
{
  imports = [
    nixvim.homeManagerModules.nixvim
    ./autocommands.nix
    ./completion.nix
    ./debug.nix
    ./keymappings.nix
    ./options.nix
    ./plugins
    ./todo.nix
  ];

  programs.nixvim = {
    enable = true;

    luaLoader.enable = true;

    # Highlight and remove extra white spaces
    highlight.ExtraWhitespace.bg = "red";
    match.ExtraWhitespace = "\\s\\+$";
  };
}
