{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    lutris
  ];

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
    ];
  };
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraPackages = with pkgs; [
      zulu
      mangohud
    ];
    # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };
}
