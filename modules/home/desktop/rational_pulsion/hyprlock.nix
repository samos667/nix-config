{pkgs, ...}: {
  home.packages = with pkgs; [
    grim # f*ck nvidia everyday https://github.com/hyprwm/hyprlock/issues/59
  ];
  stylix.targets.hyprlock.enable = false;
  #TODO Setup hypridle
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock.overrideAttrs (old: {
      version = "git";
      src = pkgs.fetchFromGitHub {
        owner = "hyprwm";
        repo = "hyprlock";
        rev = "f673759d01400e49e25a15566543a6b833466793";
        sha256 = "0bk1/7HCi3wzeW1a4t7xPUYXzmOeq/AtXTOe72gC7so=";
      };
      # patchPhase = ''
      #   substituteInPlace src/core/hyprlock.cpp \
      #   --replace "5000" "16"
      # '';
    });
    settings = {
      general = {
        no_fade_in = true;
        no_fade_out = true;
        hide_cursor = false;
        grace = 0;
        disable_loading_bar = true;
      };

      background = [
        {
          monitor = "HDMI-A-1";
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
        {
          monitor = "DP-1";
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "250, 60";
          outline_thickness = "2";
          dots_size = "0.2"; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = "0.35"; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          outer_color = "rgba(0, 0, 0, 0)";
          inner_color = "rgba(0, 0, 0, 0.2)";
          fade_on_empty = false;
          rounding = -1;
          check_color = "rgb(204, 136, 34)";
          placeholder_text = "<i><span foreground='##cdd6f4'>Input Password...</span></i>";
          hide_input = true;
          position = "0, -200";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
