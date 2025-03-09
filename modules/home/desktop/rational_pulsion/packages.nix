{pkgs, ...}: {
  home.packages = with pkgs; [
    # x11
    xclip

    # Wayutils
    cliphist # Wayland clipboard manager
    wl-clipboard # copying and pasting
    wl-screenrec # High performance wlroots screen recording
    # xwaylandvideobridge # Streaming Wayland windows to X applications
    # hyprland-qt-support # provides a QML style for hypr* qt6 apps.
    slurp # Select a region in a Wayland compositor
    grimblast # wayland screenshot script based on slurp and grim

    # Hyprutils
    hyprpicker # color picker

    # Desktop
    waybar # the status bar
    wlogout # logout menu
    mako # the notification daemon, the same as dunst
    swayimg # Image viewer for Wayland
    swww # A Solution to your Wayland Wallpaper Woes

    ## Utils
    evince # gnome document viewer
    xfce.thunar # Modern, fast and easy-to-use file manager for Xfce
    gimp-with-plugins # The GNU Image Manipulation Program
    drawing # A free basic image editor, similar to Microsoft Paint, but aiming at the GNOME desktop
    ff2mpv-rust

    ### audio ###
    cava # for visualizing audio
    # alsa-utils # provides amixer/alsamixer/...
    mpd # for playing system sounds
    mpc-cli # command-line mpd client
    ncmpcpp # a mpd client with a UI
    networkmanagerapplet # provide GUI app: nm-connection-editor

    google-chrome
  ];

  # programs = {
  #   firefox = {
  #     enable = true;
  #     enableGnomeExtensions = false;
  #     package = pkgs.firefox;
  #     nativeMessagingHosts = with pkgs; [
  #       ff2mpv # https://addons.mozilla.org/en-US/firefox/addon/ff2mpv/
  #     ];
  #   };
  # };
  xdg.configFile."google-chrome/NativeMessagingHosts/ff2mpv.json".text = builtins.toJSON {
    name = "ff2mpv";
    description = "ff2mpv's external manifest";
    path = "${pkgs.ff2mpv-rust}/bin/ff2mpv-rust";
    type = "stdio";
    allowed_origins = [
      "chrome-extension://ephjcajbkgplkjmelpglennepbpmdpjg/"
    ];
  };

  nixpkgs.overlays = [
    (self: super: {
      google-chrome = super.google-chrome.override {
        commandLineArgs = "--enable-features=AcceleratedVideoDecodeLinuxZeroCopyGL,AcceleratedVideoDecodeLinuxGL,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE --ozone-platform-hint=wayland";
      };
    })
  ];
}
