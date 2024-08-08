{ pkgs, ... }: {
  home.packages = with pkgs; [
    # audio control
    pavucontrol
    playerctl
    pulsemixer
  ];
  xdg.configFile = {
    "easyeffects/output/" = {
      source = ./conf/easyeffects/output;
      recursive = true;
    };
    "easyeffects/input/" = {
      source = ./conf/easyeffects/input;
      recursive = true;
    };
  };
}
