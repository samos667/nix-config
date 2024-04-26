{pkgs, ...}: {
  # https://wiki.archlinux.org/title/KMSCON
  services.kmscon = {
    enable = true;
    fonts = [
      {
        name = "Source Code Pro";
        package = pkgs.source-code-pro;
      }
    ];
    extraOptions = "--term xterm-256color";
    extraConfig = "font-size=16 xkb-layout=fr";
    hwRender = true;
  };
}
