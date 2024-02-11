{pkgs, ...}: {
  programs = {
    nushell = {
      enable = true;
      # The config.nu can be anywhere you want if you like to edit your Nushell with Nu
      configFile.source = ./config.nu;
      # for editing directly to config.nu
      extraConfig = ''
        let carapace_completer = {|spans|
        carapace $spans.0 nushell $spans | from json
        }
        $env.config = {
         show_banner: false,
         completions: {
         case_sensitive: false # case-sensitive completions
         quick: true    # set to false to prevent auto-selecting completions
         partial: true    # set to false to prevent partial filling of the prompt
         algorithm: "fuzzy"    # prefix or fuzzy
         external: {
         # set to false to prevent nushell looking into $env.PATH to find more suggestions
             enable: true
         # set to lower can improve completion performance at the cost of omitting some options
             max_results: 100
             completer: $carapace_completer # check 'carapace_completer'
           }
         }
        }
        $env.PATH = ($env.PATH |
        split row (char esep) |
        prepend /home/myuser/.apps |
        append /usr/bin/env
        )
      '';
      shellAliases = {
        v = "nvim";
        vi = "nvim";
        vim = "nvim";
        nano = "nvim";
      };
    };
    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    starship = {
      enable = true;
      settings = {
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
