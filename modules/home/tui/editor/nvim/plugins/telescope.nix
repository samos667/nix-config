{ # Find, Filter, Preview, Pick. All lua, all the time. -- https://github.com/nvim-telescope/telescope.nvim
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      extensions.frecency.enable = true;
      extensions.fzf-native.enable = true;
      extensions.undo.enable = true;
      extensions.file-browser.enable = true;

      keymaps = {
        # Find files using Telescope command-line sugar.
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>b" = "buffers";
        "<leader>fh" = "help_tags";
        "<leader>fd" = "diagnostics";

        # FZF like bindings
        "<C-p>" = "git_files";
        "<leader>p" = "oldfiles";
        "<C-f>" = "live_grep";
      };

      settings.defaults = {
        file_ignore_patterns = [
          "^.git/"
          "^.mypy_cache/"
          "^__pycache__/"
          "^output/"
          "^data/"
          "%.ipynb"
        ];
        # set_env.COLORTERM = "truecolor";
      };
    };
  };
}
