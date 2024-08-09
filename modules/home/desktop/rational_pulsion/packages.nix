{pkgs, ...}: {
  home.packages = with pkgs; [
    waybar # the status bar
    swayidle # the idle timeout
    swaylock # locking the screen
    wlogout # logout menu
    mako # the notification daemon, the same as dunst

    hyprpicker # color picker
    cliphist # Wayland clipboard manager
    wl-clipboard # copying and pasting

    grimblast # screen shot
    wf-recorder # screen recording

    imv # simple image viewer
    gnome.nautilus # The file manager for GNOME
    gimp # The GNU Image Manipulation Program
    vscode # Open source source code editor developed by Microsoft
    vivaldi
    vivaldi-ffmpeg-codecs
    qbittorrent

    ### audio ###
    cava # for visualizing audio
    alsa-utils # provides amixer/alsamixer/...
    easyeffects # Audio effects for PipeWire applications
    mpd # for playing system sounds
    mpc-cli # command-line mpd client
    ncmpcpp # a mpd client with a UI
    networkmanagerapplet # provide GUI app: nm-connection-editor
  ];

  programs = {
    # a wayland only terminal emulator
    foot = {
      enable = true;
      server.enable = true;
      settings = {
        key-bindings = {
          clipboard-copy = "Control+c";
          clipboard-paste = "Control+v";
          search-start = "Control+f";
        };
      };
    };

    firefox = {
      enable = true;
      enableGnomeExtensions = false;
      package = pkgs.firefox-wayland; # firefox with wayland support
    };
  };
}
