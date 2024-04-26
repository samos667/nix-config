{pkgs, ...}: let
  hyprConfig = pkgs.writeText "greetd-hypr-config" ''
    exec-once = ${pkgs.greetd.regreet}/bin/regreet; hyprctl dispatch exit

    input {
      kb_layout = fr # Baguette
    }
  '';
in {
  services.greetd = {
    enable = true;
    settings.default_session.command = "${pkgs.hyprland}/bin/Hyprland --config ${hyprConfig}";
  };
}
