{
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/virtualisation/proxmox-lxc.nix")
  ];
  nixpkgs.config.allowUnfree = true;

  users.users.sam.shell = pkgs.nushell;

  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = ["sam"];
}
