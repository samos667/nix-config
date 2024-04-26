{pkgs, ...}: let
  nu-grammar = pkgs.tree-sitter.buildGrammar {
    language = "nu";
    version = "0.0.0+rev=358c4f5";
    src = pkgs.fetchFromGitHub {
      owner = "nushell";
      repo = "tree-sitter-nu";
      rev = "2d0dd587dbfc3363d2af4e4141833e718647a67e";
      hash = "sha256-A0Lpsx0VFRYUWetgX3Bn5osCsLQrZzg90unGg9kTnVg=";
    };
  };
in {
  programs.nixvim = {

  plugins.lsp.servers.nushell.enable = true;

  # Set filetype to "nu" for files named "*.nu"
  filetype.extension.nu = "nu";

  # Add our nu parser to treesitter and associate it with nu filetype.
  extraConfigLua = ''
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.nu = {
      filetype = "nu",
    }
  '';

  # Add the nu injections
  extraFiles = {
    "/queries/nu/highlights.scm" = builtins.readFile "${nu-grammar}/queries/nu/highlights.scm";
    "/queries/nu/injections.scm" = builtins.readFile "${nu-grammar}/queries/nu/injections.scm";
  };

  plugins = {
    treesitter = {
      languageRegister.nu = "nu";
      grammarPackages =
        [
          nu-grammar
        ]
        ++ pkgs.vimPlugins.nvim-treesitter.allGrammars;
        };
    };
  };
}
