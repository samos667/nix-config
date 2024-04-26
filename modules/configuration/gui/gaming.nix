{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    lutris
  ];

  hardware.xone.enable = true; # To use xbox controller wireless

  # Steam relate
  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
}
