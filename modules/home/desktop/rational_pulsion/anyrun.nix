{ pkgs, inputs, ... }: {
  imports = [ inputs.anyrun.homeManagerModules.default ];

  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        # randr
        rink
        shell
        symbols
        dictionary
        translate
        websearch
      ];

      width.fraction = 0.3;
      y.absolute = 15;
      hidePluginInfo = true;
      closeOnClick = true;
    };

    # custom css for anyrun, based on catppuccin-mocha
    extraCss = ''
      * {
        all: unset;
        font-size: 1.3rem;
      }

      #window,
      #match,
      #entry,
      #plugin,
      #main {
        background: transparent;
      }

      #match.activatable {
        border-radius: 16px;
        padding: 0.3rem 0.9rem;
        margin-top: 0.01rem;
      }
      #match.activatable:first-child {
        margin-top: 0.7rem;
      }
      #match.activatable:last-child {
        margin-bottom: 0.6rem;
      }

      #plugin:hover #match.activatable {
        border-radius: 10px;
        padding: 0.3rem;
        margin-top: 0.01rem;
        margin-bottom: 0;
      }

      #match:selected,
      #match:hover,
      #plugin:hover {
        background: #6C7086;
      }

      #entry {
        background: rgba(30, 30, 46, 0.7);
        border: 1px solid rgba(30, 30, 46, 0.7);
        border-radius: 16px;
        margin: 0.5rem;
        padding: 0.3rem 1rem;
      }

      list > #plugin {
        border-radius: 16px;
        margin: 0 0.3rem;
      }
      list > #plugin:first-child {
        margin-top: 0.3rem;
      }
      list > #plugin:last-child {
        margin-bottom: 0.3rem;
      }
      list > #plugin:hover {
        padding: 0.6rem;
      }

      box#main {
        background: #1E1E2E;
        box-shadow:
          inset 0 0 0 1px rgba(30, 30, 46, 0.7),
          0 0 0 1px rgba(30, 30, 46, 0.7);
        border-radius: 24px;
        padding: 0.3rem;
      }
    '';
  };
}
