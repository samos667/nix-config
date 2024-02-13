{config, ...}: {

  imports = [
    ./fish.nix
    ./nushell.nix
  ];

#  home.shellAliases = {
#    k = "kubectl";
#  };
    
  # add environment variables
  home.sessionVariables = {
    # set default applications
  };
}
