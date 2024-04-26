{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        terraformls.enable = true;
      };
    };

    none-ls.sources.formatting.terraform_fmt.enable = true;
  };
}
