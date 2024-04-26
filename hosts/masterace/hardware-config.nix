{modulesPath, ...}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ../../modules/configuration/hardware/bare/intel.nix # i5-11600k
    # ../../modules/configuration/hardware/bare/nvidia-hyprland.nix # rtx 2080.. byebye.
    ../../modules/configuration/hardware/bare/amd.nix # amd 7900 xtx
    ../../modules/configuration/hardware/bare/peripheral.nix
    ../../modules/configuration/hardware/bare/power-management.nix
    ../../modules/configuration/hardware/bare/power-management.nix
    ./network-config.nix
    ./sound-config.nix
  ];

  ### MANDATORY AND SCTRICLY RELATED to my CURRENT installation on THIS SPECIFIC HARDWARE ###

  # Boot options and modules
  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = ["amdgpu"];
  boot.kernelParams = ["mitigations=off"];
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

  system.stateVersion = "24.05"; # https://search.nixos.org/options?channel=unstable&show=system.stateVersion&from=0&size=50&sort=relevance&type=packages&query=system.stateVersion
}
