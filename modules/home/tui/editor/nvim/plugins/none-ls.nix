{ # null-ls.nvim reloaded -- https://github.com/nvimtools/none-ls.nvim
  programs.nixvim.plugins = {
    none-ls = {
      enable = true;
      enableLspFormat = true;
    };
    lsp-format.enable = true;
  };
}
