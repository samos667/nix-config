{ pkgs, ... }: {

  home.packages = with pkgs; [ python311Full virtualenv pipx ];

  programs.nixvim.plugins = {
    none-ls.sources.formatting.black.enable = true;
    dap.extensions.dap-python.enable = true;
    lsp.servers.pyright.enable = true;
  };
}
