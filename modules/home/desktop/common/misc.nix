{pkgs, ...}: {
  home.packages = with pkgs; [
    syncthing
    solaar
    exfat
    xwaylandvideobridge
    teams-for-linux
    vesktop
    mumble
    newsflash
    httpie-desktop

    # misc
    ventoy # multi-boot usb creator
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

  services.syncthing.enable = true;

  programs.gh = {enable = true;}; # GitHub CLI tool
}
