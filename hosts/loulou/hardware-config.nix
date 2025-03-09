{
  lib,
  vars,
  ...
}: {
  imports = [
    ../../modules/configuration/hardware/bare/${vars.soc}.nix # nanopi5
    ./network-config.nix
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  # https://search.nixos.org/options?channel=unstable&show=system.stateVersion&from=0&size=50&sort=relevance&type=packages&query=system.stateVersion
  system.stateVersion = lib.mkDefault "24.11"; # Did you read the comment?
}
