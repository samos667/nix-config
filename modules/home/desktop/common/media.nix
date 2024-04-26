{pkgs, ...}:
# media - control and enjoy audio/video
{
  home.packages = with pkgs; [
    youtube-tui

    spotify
    twitch-tui
    tidal-hifi
    foliate
    libva-utils
    vdpauinfo
    vulkan-tools
    glxinfo
  ];

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
      config = {
        hwdec = "auto";
      };
      scripts = with pkgs.mpvScripts; [
        mpris
        thumbnail
        webtorrent-mpv-hook
        youtube-upnext
        sponsorblock
        quality-menu
        mpv-playlistmanager
        mpv-cheatsheet
      ];
    };
  };

  services = {playerctld.enable = true;};
}
