{
  xdg.configFile = {
    # "foot/foot.ini" = { source = ./config/foot/foot.ini; };
    "mako" = {source = ./config/mako;};
    "scripts" = {source = ./config/scripts;};
    "wlogout" = {source = ./config/wlogout;};
    "waybar" = {source = ./config/waybar;};

    "cava" = {
      source = ./config/cava;
      recursive = true;
    };
    "mpd" = {
      source = ./config/mpd;
      recursive = true;
    };

    "wallpapers" = {
      source = ./config/wallpapers;
      recursive = true;
    };
  };
}
