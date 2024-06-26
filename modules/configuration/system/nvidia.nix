# Install the proprietary Nvidia GPU drivers
{ config, lib, ... }: {
  # Nvidia drivers are unfree software, if we want to use them, we must allow unfree
  nixpkgs.config.allowUnfree = true;

  hardware.opengl.enable = true;
  # These are the correct drivers for modern Nvidia GPUs, this may need to be changed for older cards
  hardware.nvidia.package =
    lib.mkDefault config.boot.kernelPackages.nvidiaPackages.stable;
  # Set the correct display modes in the kernel, disable in case of problems during boot
  hardware.nvidia.modesetting.enable = true;

  services = {
    # for Nvidia GPU
    xserver.exportConfiguration = true;
    xserver.videoDrivers =
      [ "nvidia" ]; # will install nvidia-vaapi-driver by default
  };

  virtualisation.docker.enableNvidia = true;
}
