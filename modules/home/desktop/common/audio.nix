{ pkgs, ... }: {
  home.packages = with pkgs; [
    # audio control
    pavucontrol
    playerctl
    pulsemixer
  ];
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      # # for flypy chinese input method
      # fcitx5-rime
      # needed enable rime using configtool after installed
      fcitx5-configtool
      # fcitx5-chinese-addons
      # fcitx5-mozc    # japanese input method
      fcitx5-gtk # gtk im module
    ];
  };
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
