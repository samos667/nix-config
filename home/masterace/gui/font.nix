{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      font-manager
      dejavu_fonts
      font-awesome
      fira-code-symbols
      (iosevka-bin.override {variant = "aile";})
      material-design-icons
      monolisa-script
      (nerdfonts.override {fonts = ["FiraCode"];})
      noto-fonts
      powerline-symbols
      # sf-mono-liga-bin
    ];
  };
}
