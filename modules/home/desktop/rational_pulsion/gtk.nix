{ pkgs, config, ... }: {
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors-translucent;
    name = "Bibata_Spirit";
    size = 48; # Affects gtk applications as the name suggests
  };

  gtk = {
    enable = true;

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}
