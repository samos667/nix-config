{ agenix, pkgs, ... }:
let hostname = "masterace";
in {
  imports = [
    ../../modules/configuration/secret/github.nix
    ../ctcore
    ../../modules/configuration/services/docker.nix
  ];

  networking.hostName = hostname;
  # networking.computerName = hostname;

  users.users.sam.shell = pkgs.nushell;
}
