{
  programs.nixvim.plugins = {
    lsp.servers.nil_ls.enable = true;
    none-ls.sources.formatting.nixfmt.enable = true;
  };
}
