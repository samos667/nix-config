{ pkgs, ... }: {

  home.packages = with pkgs; [ golangci-lint delve ];


  programs = {
    go.enable = true;
    nixvim.plugins = {
    none-ls.sources.formatting.gofmt.enable = true;
    dap.extensions.dap-go.enable = true;
      neotest.enable = true;
      neotest.adapters.go.enable = true;
      lsp.servers = {
        golangci-lint-ls.enable = true;
        gopls.enable = true;
      };
    };
  };
}
