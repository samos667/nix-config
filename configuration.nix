{ pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/virtualisation/proxmox-lxc.nix")
  ];

  environment.systemPackages = [
    pkgs.vim
    pkgs.git
  ];
  
  system.stateVersion = "23.11"; # Did you read the comment?
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.sam = {
    isNormalUser  = true;
    home  = "/home/sam";
    extraGroups  = [ "wheel"];
    description  = "sam";
    openssh.authorizedKeys.keys  = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAJzb59KOgc9ldoJgsvH7eiE5BkIQQN059Cst0QYlFRN sam@DESKTOP-1SJKPJE" ];
  };
}
