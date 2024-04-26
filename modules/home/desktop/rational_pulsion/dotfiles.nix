{
  xdg.configFile = {
    "foot/foot.ini" = { source = ./conf/foot/foot.ini; };
    "hypr" = { source = ./conf/hypr; };
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
