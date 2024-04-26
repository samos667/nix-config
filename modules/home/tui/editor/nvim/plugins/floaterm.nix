{ # Terminal manager for (neo)vim --- https://github.com/voldikss/vim-floaterm
  programs.nixvim.plugins.floaterm = {
    enable = true;
    keymaps.toggle = "<leader>,";
    width = 0.8;
    height = 0.8;
    title = "";
  };
}
