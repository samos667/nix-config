{ ... }:
let
  hostname = "mc";
in {
  imports = [
    ../ctcore
    ../../modules/configuration/services/docker.nix
  ];

  networking.hostName = hostname;
  # networking.computerName = hostname;
}
