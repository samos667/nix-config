{ # Smart and powerful comment plugin for neovim. -- https://github.com/numToStr/Comment.nvim
  programs.nixvim.plugins.comment = {
    enable = true;

    settings = {
      opleader.line = "<C-b>";
      toggler.line = "<C-b>";
    };
  };
}
