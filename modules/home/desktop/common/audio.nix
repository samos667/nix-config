{pkgs, ...}: {
  home.packages = with pkgs; [
    # audio control
    pavucontrol
    playerctl
    pulsemixer
    easyeffects # Audio effects for PipeWire applications
  ];
  # service.easyeffects.enable = true;
  xdg.configFile = {
    "easyeffects/output/" = {
      source = ./conf/easyeffects/presets/output;
      recursive = true;
    };
    "easyeffects/input/" = {
      source = ./conf/easyeffects/presets/input;
      recursive = true;
    };
    "easyeffects/autoload/output/" = {
      source = ./conf/easyeffects/autload/output;
      recursive = true;
    };
    "easyeffects/autoload/input/" = {
      source = ./conf/easyeffects/autload/input;
      recursive = true;
    };
  };

  # bluetooth
  services.mpris-proxy.enable = true;
}
