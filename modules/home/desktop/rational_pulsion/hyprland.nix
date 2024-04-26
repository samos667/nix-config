{
  wayland.windowManager.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;

    # https://github.com/redyf/nixdots/blob/main/home/desktop/hyprland/default.nix
    settings = {
      "$mainMod" = "SUPER";
      monitor = [
        "HDMI-A-1, 1920x1080@60, 0x0, 1"
        "DP-1, 2560x1440@360, 1920x0, 1"
        # "DP-1, 2560x1440@360, 1920x0, 1, bitdepth, 10"
        "DP-2,disable"
        "Unknown-1,disable"
      ];

      env = [
        "GDK_SCALE,1"
        "XCURSOR_SIZE,32"
        "VDPAU_DRIVER,radeonsi"
        "LIBVA_DRIVER_NAME,radeonsi"
      ];

      workspace = [
        "1, monitor:HDMI-A-1, persistent:true"
        "2, monitor:DP-1, persistent:true"
        "3, monitor:DP-1, persistent:true"
        "4, monitor:DP-1, persistent:true"
        "5, monitor:DP-1, persistent:true"
      ];

      xwayland.force_zero_scaling = true;

      input = {
        kb_layout = "fr,us";
        kb_options = "grp:alt_shift_toggle";

        follow_mouse = 1;
        repeat_delay = 140;
        repeat_rate = 30;
        numlock_by_default = 1;
        accel_profile = "flat";
        sensitivity = 0;
        force_no_accel = 1;
        touchpad.natural_scroll = 1;
      };

      cursor.enable_hyprcursor = true;

      general = {
        gaps_in = 4;
        gaps_out = 5;
        gaps_workspaces = 50;
        border_size = 1;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };
        blur = {
          enabled = true;
          size = 4;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = true;
          noise = 1.17e-2;
          contrast = 1.3;
          brightness = 1;
          xray = true;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
          "softAcDecel, 0.26, 0.26, 0.15, 1"
          "md2, 0.4, 0, 0.2, 1"
        ];
        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "windowsIn, 1, 3, md3_decel, popin 60%"
          "windowsOut, 1, 3, md3_accel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 3, md3_decel"
          "layersIn, 1, 3, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 4.5, menu_accel"
          "workspaces, 1, 7, menu_decel, slide"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };

      misc = {
        vfr =
          true; # misc:no_vfr -> misc:vfr. bool, heavily recommended to leave at default on. Saves on CPU usage.
        vrr =
          0; # misc:vrr -> Adaptive sync of your monitor. 0 (off), 1 (on), 2 (fullscreen only). Default 0 to avoid white flashes on select hardware.
        disable_hyprland_logo = true;
      };

      dwindle = {
        pseudotile = true; # enable pseudotiling on dwindle
        force_split = 0;
        preserve_split = true;
        default_split_ratio = 1.0;
        special_scale_factor = 0.8;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
      };

      master = {
        mfact = 0.5;
        orientation = "right";
        special_scale_factor = 0.8;
        new_status = "slave";
      };

      gestures.workspace_swipe = false;
      debug = {
        damage_tracking =
          2; # leave it on 2 (full) unless you hate your GPU and want to make it suffer!
      };

      exec-once = ["~/.config/scripts/startup"];

      bind = [
        # https://github.com/hyprwm/Hyprland/issues/2319#issuecomment-1650958363
        # "Control_L,v,exec,wl-paste -t text -w xclip -selection clipboard"
        "SUPER,Q,killactive,"
        "SUPER SHIFT,X,exec,exit,"
        "SUPER,Space,togglefloating,"
        "SUPER,G,togglegroup,"
        "SUPER,F,fullscreen,0"
        "SUPERSHIFT,F,fullscreen,1"

        # Vim binds
        "SUPER,h,movefocus,l"
        "SUPER,l,movefocus,r"
        "SUPER,k,movefocus,u"
        "SUPER,j,movefocus,d"
        "SUPER CTRL,l, workspace, +1"
        "SUPER CTRL,h, workspace, -1"

        "SUPER,left,movefocus,l"
        "SUPER,down,movefocus,r"
        "SUPER,up,movefocus,u"
        "SUPER,right,movefocus,d"
        "SUPER,TAB,movefocus,r"
        "SUPERSHIFT,TAB,movefocus,l"

        "SUPER,ampersand,workspace,1"
        "SUPER,eacute,workspace,2"
        "SUPER,quotedbl,workspace,3"
        "SUPER,apostrophe,workspace,4"
        "SUPER,parenleft,workspace,5"
        "SUPER,minus,workspace,6"
        "SUPER,egrave,workspace,7"
        "SUPER,underscore,workspace,8"
        "SUPER,ccedilla,workspace,9"
        "SUPER,agrave,workspace,10"
        "Super, mouse_up, workspace, +1"
        "Super, mouse_down, workspace, -1"

        ################################## Move ###########################################
        "SUPER SHIFT, H, movewindow, l"
        "SUPER SHIFT, L, movewindow, r"
        "SUPER SHIFT, K, movewindow, u"
        "SUPER SHIFT, J, movewindow, d"
        "SUPER SHIFT, left, movewindow, l"
        "SUPER SHIFT, right, movewindow, r"
        "SUPER SHIFT, up, movewindow, u"
        "SUPER SHIFT, down, movewindow, d"

        #---------------------------------------------------------------#
        # Move active window to a workspace with mainMod + ctrl + [0-9] #
        #---------------------------------------------------------------#
        # same as above, but doesnt switch to the workspace
        "SUPER SHIFT,ampersand,movetoworkspacesilent,1"
        "SUPER SHIFT,eacute,movetoworkspacesilent,2"
        "SUPER SHIFT,quotedbl,movetoworkspacesilent,3"
        "SUPER SHIFT,apostrophe,movetoworkspacesilent,4"
        "SUPER SHIFT,parenleft,movetoworkspacesilent,5"
        "SUPER SHIFT,minus,movetoworkspacesilent,6"
        "SUPER SHIFT,egrave,movetoworkspacesilent,7"
        "SUPER SHIFT,underscore,movetoworkspacesilent,8"
        "SUPER SHIFT,ccedilla,movetoworkspacesilent,9"
        "SUPER SHIFT,agrave,movetoworkspacesilent,10"

        "SUPER,B,exec,google-chrome-stable"
        "SUPER,E,exec,thunar"
        "SUPER,T,exec,wezterm"
        "SUPER,V,exec,wezterm start nvim"
        "SUPER,less,exec,~/.config/scripts/menu"
        "SUPER,F4,exec,hyprlock"
        "Control_L,F7,exec, wezterm start ~/.config/scripts/recordmp4"
        "Control_L,F8,exec,amixer set Capture toggle" # Toggle mic system-wide
        "Control_L,F9,exec,grimblast --freeze copysave area"
      ];

      bindm = [
        # Mouse binds
        "SUPER,mouse:272,movewindow"
        "SUPER,mouse:273,resizewindow"
      ];

      windowrulev2 = [
        "float, class:^(imv|mpv|vesktop|thunar|Spotify|xdg-desktop-portal-gtk|Waydroid|waydroid)$"
        "float, title:^(pavucontrol|Easy Effects|Extension|Picture in picture)$"
        "monitor HDMI-A-1, class:^(vesktop|Spotify)$"
        "monitor HDMI-A-1, title:^(Picture in picture)$"
        "size 50% 50%, class:^(mpv|foot|vesktop|thunar)$"
        "size 50% 50%, title:^(Picture in picture)$"
        "opacity 0.95 0.95, class:^(thunar|Spotify)$"
      ];
      layerrule = [
        "noanim, walker"
        "noanim, selection"
        "noanim, overview"
        "noanim, anyrun"
        "noanim, indicator.*"
        "noanim, osk"
        "noanim, hyprpicker"
      ];
    };
    extraConfig = ''
      general {
        col.active_border = rgba(F7DCDE39)
        col.inactive_border = rgba(A58A8D30)
      }
      # PoE
      windowrulev2 = tag +poe, title:(Path of Exile)
      windowrulev2 = tag +poe, class:(steam_app_238960)
      windowrulev2 = workspace 1, tag:poe
      windowrulev2 = immediate, tag:poe

      windowrulev2 = tag +apt, title:(Awakened PoE Trade)
      windowrulev2 = float, tag:apt
      windowrulev2 = noblur, tag:apt
      windowrulev2 = nofocus, tag:apt # Disable auto-focus
      windowrulev2 = noshadow, tag:apt
      windowrulev2 = noborder, tag:apt
      windowrulev2 = size 100% 100%, tag:apt
      windowrulev2 = center, tag:apt

      experimental {
      #   hdr = true
      #   wide_color_gamut = true
        xx_color_management_v4 = true
      }
    '';
  };
}
