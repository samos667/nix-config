{
  pkgs,
  lib,
  hostname,
  username,
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
    vim
    wget
    git
    zip
    unzip

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    bpftrace # powerful tracing tool
    tcpdump # network sniffer
    lsof # list open files

    # system monitoring
    sysstat
    iotop
    iftop
    btop
    nmon

    # system tools
    nix-output-monitor
    psmisc # killall/pstree/prtstat/fuser/...
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    hdparm # for disk performance, command
    dmidecode # a tool that reads information about your system's hardware from the BIOS according to the SMBIOS/DMI standard
    parted
    ntfs3g
  ];

  # Nix shit
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      trusted-users = [username];
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true; # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
    };
    gc = {
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "weekly"; # do garbage collection weekly to keep disk usage low
      options = lib.mkDefault "--delete-older-than 7d";
    };
  };

  boot.loader.systemd-boot = {
    configurationLimit = lib.mkDefault 10; # we use Git for version control, so we don't need to keep too many generations.
    consoleMode = lib.mkDefault "max"; # pick the highest resolution for systemd-boot's console.
  };
}