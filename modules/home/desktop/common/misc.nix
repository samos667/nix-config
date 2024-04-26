{ pkgs, ... }: {
  home.packages = with pkgs; [
    foliate
    vesktop
    syncthing
    solaar
    exfat
    jellyfin-web

    # misc
    ventoy # multi-boot usb creator
  ];

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-vaapi
      obs-vkcapture
      obs-pipewire-audio-capture
    ];
  };

  services.syncthing.enable = true;
  # GitHub CLI tool
  programs.gh = { enable = true; };

  # allow fontconfig to discover fonts and configurations installed through home.packages
  # Install fonts at system-level, not user-level
  fonts.fontconfig.enable = false;
}
