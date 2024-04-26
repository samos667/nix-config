{ pkgs, ... }:
# media - control and enjoy audio/video
{
  home.packages = with pkgs; [
    nvtopPackages.full # GPU monitor

    youtube-tui
    twitch-tui
    tidal-hifi

    # video/audio tools
    libva-utils
    vdpauinfo
    vulkan-tools
    glxinfo
  ];

  services.easyeffects.enable = true;

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = [ "gpu-hq" ];
      scripts = [ pkgs.mpvScripts.mpris ];
    };
  };

  services = { playerctld.enable = true; };
}
