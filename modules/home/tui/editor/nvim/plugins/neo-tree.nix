{ # Neovim Plugin to manage the file system and other tree like structures. -- https://github.com/nvim-neo-tree/neo-tree.nvim
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;

      closeIfLastWindow = true;
      window = {
        width = 30;
        autoExpandWidth = true;
      };
    };

    keymaps = [{
      mode = "n";
      key = "<leader>e";
      action = ":Neotree action=focus reveal toggle<CR>";
      options.silent = true;
    }];
  };
}
