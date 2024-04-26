{
  imports = [
    ./barbar.nix
    ./comment.nix
    # ./efm.nix
    ./floaterm.nix
    ./harpoon.nix
    ./languages
    ./lualine.nix
    ./lsp.nix
    ./markdown-preview.nix
    # ./neorg.nix
    ./neo-tree.nix
    ./none-ls.nix
    ./startify.nix
    ./tagbar.nix
    ./telescope.nix
    ./treesitter.nix
    ./git.nix
  ];

  programs.nixvim = {
    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };

    plugins = {
      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      nvim-autopairs.enable = true;

      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };

      oil.enable = true;
    };
  };
}
