{
  imports = [./nushell];
  programs.starship.enable = true;
  xdg.configFile."starship.toml".source = ./starship.toml;

  programs = {
    direnv = {
      enable = true;
      enableNushellIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
