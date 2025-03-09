{
  config,
  lib,
  ...
}: {
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  boot.kernelModules = ["kvm-intel"];
}
