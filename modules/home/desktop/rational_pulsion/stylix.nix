{pkgs, ...}: {
  stylix = {
    enable = true;
    autoEnable = true;
    image = ./config/wallpapers/anime-girls_tea.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    polarity = "dark";
    opacity = {
      applications = 1.0;
      terminal = 0.95;
      desktop = 1.0;
      popups = 1.0;
    };
    targets.qt = {
      enable = true;
      platform = "kde";
    };
    fonts = {
      monospace = {
        package = pkgs.fira-code-nerdfont;
        name = "FiraCode Nerd Font";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 11;
        terminal = 16;
        desktop = 11;
        popups = 11;
      };
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 32;
    };
  };
}
