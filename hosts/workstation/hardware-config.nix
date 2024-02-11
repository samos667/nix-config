{ modulesPath, ... }:
{
  imports = [
    (modulesPath + "/virtualisation/proxmox-lxc.nix")
  ];
  nixpkgs.config.allowUnfree = true;
}
