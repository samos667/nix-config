{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      # icon fonts
      material-design-icons
      font-awesome
    ];
  };
}
