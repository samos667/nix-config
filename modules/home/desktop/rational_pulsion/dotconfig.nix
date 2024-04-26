{pkgs, ...}: {
  home.file.".config/wallpapers" = {
    source = pkgs.fetchFromGitHub {
      owner = "samos667";
      repo = "wallpapers";
      rev = "main"; # or specific commit hash
      sha256 = "sha256-3fEUEhOKVdQggUIE3hQWlUCQ8/1BeU0hr7Xl+4MHaAk=";
    };
    recursive = true;
  };
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
  };
}
