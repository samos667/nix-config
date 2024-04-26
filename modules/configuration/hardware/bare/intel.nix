{
  config,
  lib,
  ...
}: {
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  boot.kernelModules = ["kvm-intel"];
}
