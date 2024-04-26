{pkgs, ...}: {
  home.packages = with pkgs; [
    hyprlang
    waybar # the status bar
    wlogout # logout menu
    mako # the notification daemon, the same as dunst

    hyprpicker # color picker
    cliphist # Wayland clipboard manager
    wl-clipboard # copying and pasting
    xclip
    wl-screenrec
    slurp # Select a region in a Wayland compositor

    grimblast # screen shot
    wf-recorder # screen recording

    imv # simple image viewer
    swww
    xfce.thunar
    kdePackages.okular
    kdePackages.qt6ct
    gimp-with-plugins # The GNU Image Manipulation Program
    drawing # A free basic image editor, similar to Microsoft Paint, but aiming at the GNOME desktop
    qbittorrent
    ff2mpv #TODO integrate to chome directly cf ~/.config/chromium/NativeMessagingHosts/ff2mpv.json
    google-chrome

    ### audio ###
    cava # for visualizing audio
    alsa-utils # provides amixer/alsamixer/...
    mpd # for playing system sounds
    mpc-cli # command-line mpd client
    ncmpcpp # a mpd client with a UI
    networkmanagerapplet # provide GUI app: nm-connection-editor
  ];

  programs = {
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

  nixpkgs.overlays = [
    (self: super: {
      google-chrome = super.google-chrome.override {
        commandLineArgs = "--enable-features=VaapiVideoDecoder,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE --use-gl=angle --use-angle=vulkan --ozone-platform-hint=auto";
      };
    })
  ];
}
