{...}: {
  imports = [
    ./hardware-config.nix
    ../../modules/default.nix
    ./configuration.nix
  ];
}
