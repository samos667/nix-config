{config, ...}: {

  imports = [
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
