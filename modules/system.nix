{ config, lib, pkgs, ... }:

{
  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "workstation"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sam = {
    shell = pkgs.fish;
    isNormalUser = true;
    openssh.authorizedKeys.keys  = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAJzb59KOgc9ldoJgsvH7eiE5BkIQQN059Cst0QYlFRN sam@workstation.k8s-ekip.cc" ];
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
  nix.settings.trusted-users = ["sam"];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs.fish.enable = true;

  # List services that you want to enable:

  services.qemuGuest.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Or disable the firewall altogether.
  networking.firewall.enable = false;

}
