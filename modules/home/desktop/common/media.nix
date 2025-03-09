{
  pkgs,
  inputs,
  config,
  ...
}: let
  catppuccinTheme = pkgs.fetchzip {
    url = "https://github.com/catppuccin/chatterino2/releases/download/v0.1.3/mocha-blue.tar.gz";
    sha256 = "sha256-yQ0XyFVQv5RAJTE0yTm9Cohvef76Vi+tFpwgfbEJowo=";
  };
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  home.packages = with pkgs; [
    youtube-tui
    # spotify
    twitch-tui
    foliate
    libva-utils
    vdpauinfo
    vulkan-tools
    glxinfo
    streamlink-twitch-gui-bin
    chatterino2
    qbittorrent
    config.programs.spicetify.spicedSpotify
  ];

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
      config = {
        hwdec = "auto";
        save-position-on-quit = "yes";
      };
      scripts = with pkgs.mpvScripts; [
        mpris
        thumbnail
        youtube-upnext
        sponsorblock
        quality-menu
        mpv-playlistmanager
        mpv-cheatsheet
      ];
    };
  };

  home.file = {
    ".local/share/chatterino/Themes/mocha-blue.json".source = "${catppuccinTheme}/Themes/mocha-blue.json";
    ".local/share/chatterino/Settings/settings.json".source = "${catppuccinTheme}/Settings/settings.json";
  };

  services = {playerctld.enable = true;};

  # import the flake's module for your system
  imports = [inputs.spicetify-nix.homeManagerModules.default];

  # configure spicetify :)
  programs.spicetify = {
    enable = true;
    # theme = spicePkgs.themes.catppuccin;
    # colorScheme = "mocha";

    # enabledExtensions = with spicePkgs.extensions; [
    #   fullAppDisplay
    #   shuffle # shuffle+ (special characters are sanitized out of ext names)
    #   hidePodcasts
    # ];
  };
}
