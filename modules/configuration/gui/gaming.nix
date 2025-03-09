{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # (lutris.override
    #   {
    #     stdenv.hostPlatform.system = "x86_64-linux";
    #   })
    cartridges
    wineWowPackages.waylandFull
    winetricks
    protontricks
    rivalcfg
  ];
  # Steelseries
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="1038", MODE="0666", GROUP="plugdev"
  '';
  users.users.sam.extraGroups = ["plugdev"];

  hardware.xone.enable = true; # To use xbox controller wireless
  virtualisation.waydroid.enable = true;

  # Steam relate
  programs.gamemode.enable = true;
  programs.gamescope = {
    enable = true;
    capSysNice = false;
  };

  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-cpp;
    extraRules = [
      {
        "name" = "gamescope";
        "nice" = -20;
      }
      {
        "name" = "easyeffects";
        "nice" = -21;
      }
      {
        "name" = "pipewire";
        "nice" = -22;
      }
    ];
  };
  # https://nixos.wiki/wiki/steam
  # https://wiki.archlinux.org/title/Steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraPackages = with pkgs; [
      mangohud
    ];
    # https://github.com/fufexan/nix-gaming?tab=readme-ov-file#platform-optimizations
    platformOptimizations.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
      inputs.nix-gaming.packages.${pkgs.system}.northstar-proton
    ];
  };
  imports = [
    inputs.nix-gaming.nixosModules.platformOptimizations
  ];

  # https://nixos.wiki/wiki/Appimage
  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };
}
