{
  modulesPath,
  vars,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ../../modules/configuration/hardware/bare/${vars.cpu}.nix # i5-11600k
    # ../../modules/configuration/hardware/bare/nvidia-hyprland.nix # rtx 2080.. byebye.
    ../../modules/configuration/hardware/bare/${vars.gpu}.nix # amd 7900 xtx
    ../../modules/configuration/hardware/bare/peripheral.nix
    ../../modules/configuration/hardware/bare/power-management.nix
    ./network-config.nix
    ./sound-config.nix
  ];

  ### MANDATORY AND SCTRICLY RELATED to my CURRENT installation on THIS SPECIFIC HARDWARE ###

  # Boot options and modules
  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
  boot.kernelParams = ["mitigations=off"]; # !
  boot.initrd.kernelModules = ["amdgpu"];
  boot.extraModulePackages = [];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # System file systems to mount (/ and /boot)
  swapDevices = []; # TODO set (persistent) swap device to be able to suspend my system

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/18acb2ab-82ed-4293-ac15-09c25637a892";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/9B41-1CFA";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  # https://search.nixos.org/options?channel=unstable&show=system.stateVersion&from=0&size=50&sort=relevance&type=packages&query=system.stateVersion
  system.stateVersion = "24.05"; # Did you read the comment?
}
