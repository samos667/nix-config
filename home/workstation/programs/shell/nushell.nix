{pkgs, ...}: {
  programs = {
    nushell = {
      enable = true;
      configFile.source = ./config.nu;
      shellAliases = {
        h = "helm";
        k = "kubectl";
        v = "nvim";
        d = "docker";
        dc = "docker compose";
      };
    };

    starship = {
      enable = true;
      settings = {
        os = {
          disabled = false;
        };
        os.symbols = {
          Debian = "🌀 ";
          FreeBSD = "😈 ";
          Linux = "🐧 ";
          NixOS = "❄️ ";
          OpenBSD = "🐡 ";
          Raspbian = "🍓 ";
          Redhat = "🎩 ";
          Windows = "🪟 ";
        };
        status = {
          symbol = "🔴 ";
          success_symbol = "🟢 SUCCESS";
          format = "[$symbol$common_meaning$signal_name$maybe_int]($style) ";
          map_symbol = true;
          disabled = false;
        };
        time = {
          disabled = false;
          format = "🕙[$time]($style) ";
        };
        memory_usage = {
          disabled = false;
          threshold = -1;
          symbol = " ";
          style = "bold dimmed green";
        };
        hostname = {
          ssh_only = false;
          format = "[$ssh_symbol](bold blue) on [$hostname](bold red) ";
          trim_at = ".companyname.com";
          disabled = false;
        };
        container = {
          disabled = true;
        };
        username = {
          style_user = "white bold";
          style_root = "black bold";
          format = "user: [$user]($style) ";
          disabled = false;
          show_always = true;
        };
        add_newline = true;
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };
  };
}
