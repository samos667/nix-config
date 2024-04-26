{ # markdown preview plugin for (neo)vim -- https://github.com/iamcco/markdown-preview.nvim
  programs.nixvim = {
    plugins.markdown-preview = {
      enable = true;

      settings = {
        auto_close = false;
        theme = "dark";
      };
    };

    keymaps = [{
      mode = "n";
      key = "<leader>m";
      action = ":MarkdownPreview<cr>";
      options.silent = true;
    }];
  };
}
