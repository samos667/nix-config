{pkgs, ...}: {
  home.packages = with pkgs; [
    syncthing
    solaar
    exfat
    teams-for-linux
    vesktop
    discord
    newsflash
    httpie-desktop
  ];

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-vaapi
      obs-vkcapture
      obs-pipewire-audio-capture
      wlrobs
    ];
  };
  xdg.configFile."obs-studio/themes/Catppuccin_Mocha.ovt".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/obs/refs/heads/main/themes/Catppuccin_Mocha.ovt";
    sha256 = "sha256-6jatJRRojATjSjKDoOP6U1av927uoP1fQh4EB8+gfgs=";
  };
  xdg.configFile."obs-studio/themes/Catppuccin.obt".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/obs/refs/heads/main/themes/Catppuccin.obt";
    sha256 = "sha256-k7zi1eJ/Hq54BTEVqo+94e9f2huV7u3DZ2DMmPXVR2E=";
  };

  services.syncthing.enable = true;

  programs.gh = {enable = true;}; # GitHub CLI tool
}
