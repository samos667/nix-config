{
  xdg.configFile = {
    # "foot/foot.ini" = { source = ./conf/foot/foot.ini; };
    "mako" = { source = ./conf/mako; };
    "scripts" = { source = ./conf/scripts; };
    "wlogout" = { source = ./conf/wlogout; };
    "waybar" = { source = ./conf/waybar; };
    "swaylock" = {
      source = ./conf/swaylock;
      recursive = true;
    };

    "cava" = {
      source = ./conf/cava;
      recursive = true;
    };
    "mpd" = {
      source = ./conf/mpd;
      recursive = true;
    };

    "wallpapers" = {
      source = ./conf/wallpapers;
      recursive = true;
    };
  };
}
