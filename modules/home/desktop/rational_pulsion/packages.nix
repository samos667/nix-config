{
  pkgs,
  system,
  ...
}: let
  thorium =
    import
    (builtins.fetchTarball {
      url = https://github.com/samos667/nixpkgs/tarball/thorium-browser?ref=refs/tags/M128.0.6613.189;
      sha256 = "1l6h838nkmd8sjfd6f3xn3w1j55x9mw3g907fjxfl0frgyp6l9pb";
    })
    # reuse the current configuration
    {inherit system;};
in {
  home.packages = with pkgs; [
    waybar # the status bar
    wlogout # logout menu
    mako # the notification daemon, the same as dunst

    hyprpicker # color picker
    cliphist # Wayland clipboard manager
    wl-clipboard # copying and pasting

    grimblast # screen shot
    wf-recorder # screen recording

    imv # simple image viewer
    xfce.thunar
    gimp-with-plugins # The GNU Image Manipulation Program
    drawing # A free basic image editor, similar to Microsoft Paint, but aiming at the GNOME desktop
    vivaldi
    vivaldi-ffmpeg-codecs
    qbittorrent
    ff2mpv #TODO integrate to chome directly cf ~/.config/chromium/NativeMessagingHosts/ff2mpv.json
    thorium.thorium-browser

    ### audio ###
    cava # for visualizing audio
    alsa-utils # provides amixer/alsamixer/...
    mpd # for playing system sounds
    mpc-cli # command-line mpd client
    ncmpcpp # a mpd client with a UI
    networkmanagerapplet # provide GUI app: nm-connection-editor
  ];

  programs = {
    foot = {
      # a wayland only terminal emulator
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

    # chromium = {
    #   enable = true;
    #   commandLineArgs = [
    #     "--enable-features=VaapiVideoDecodeLinuxGL,VaapiOnNvidiaGPUs"
    #     "--disable-features=Vulkan"
    #     "--ozone-platform=wayland"
    #     "--use-gl=angle"
    #     "--use-angle=gl"
    #   ];
    # };

    firefox = {
      enable = true;
      enableGnomeExtensions = false;
      # package = stable.pkgs.firefox;
      package = pkgs.firefox;
      nativeMessagingHosts = with pkgs; [
        ff2mpv # https://addons.mozilla.org/en-US/firefox/addon/ff2mpv/
      ];
    };
  };
}
