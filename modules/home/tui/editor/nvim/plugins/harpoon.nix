{ # Getting you where you want with the fewest keystrokes. -- https://github.com/ThePrimeagen/harpoon/tree/harpoon2
  programs.nixvim.plugins.harpoon = {
    enable = true;

    keymapsSilent = true;
    keymaps = {
      addFile = "<leader>a";
      toggleQuickMenu = "<C-e>";
      navFile = {
        "1" = "<C-j>";
        "2" = "<C-k>";
        "3" = "<C-l>";
        "4" = "<C-m>";
      };
    };
  };
}
