{
  pkgs,
  lib,
  hostname,
  ...
}: {
  ### Common config between all my systems

  i18n.defaultLocale = "en_US.UTF-8";

  networking.hostName = hostname;

  users.users.root = {
    initialHashedPassword = "$7$CU..../....cM.cjpSdcybWBpckxY1b90$grq57TCZ9N5gpXRech0atSYOu0Qwi4k9WRgRUOTsh53";
  };

  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib
    # Add other required libraries here
  ];

  # Packages mandatory
  environment.systemPackages = with pkgs; [
    vi
    wget
    git
    zip
    unzip
    bottom
    iftop
    ethtool
    sysstat # Collection of performance monitoring tools for Linux (such as sar, iostat and pidstat)
  ];

  # Nix shit
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      trusted-users = [
        "root"
        "@wheel"
      ];
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true; # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
    };
    gc = {
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "monthly"; # do garbage collection weekly to keep disk usage low
      options = lib.mkDefault "--delete-older-than 30d";
    };
  };

  boot.loader.systemd-boot = {
    configurationLimit = lib.mkDefault 10; # we use Git for version control, so we don't need to keep too many generations.
    consoleMode = lib.mkDefault "max"; # pick the highest resolution for systemd-boot's console.
  };

  nix = {
    settings = {
      substituters = [
        "https://hyprland.cachix.org"
        "https://nix-gaming.cachix.org"
        # Nixpkgs-Wayland
        "https://cache.nixos.org"
        "https://nixpkgs-wayland.cachix.org"
        "https://nix-community.cachix.org"
        # Nix-community
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        # Nixpkgs-Wayland
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
        # Nix-community
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
}
