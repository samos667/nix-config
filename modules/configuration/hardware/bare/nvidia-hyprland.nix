# Install the proprietary Nvidia GPU drivers
{
  config,
  inputs,
  pkgs,
  ...
}: let
  pkgs-unstable =
    inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  hardware = {
    nvidia = {
      # open = true;
      nvidiaSettings = true;
      powerManagement.enable = false;
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    graphics = {
      enable = true;
      package = pkgs-unstable.mesa.drivers;
      package32 = pkgs-unstable.pkgsi686Linux.mesa.drivers;
      enable32Bit = true;
      extraPackages = with pkgs; [nvidia-vaapi-driver];
    };
  };

  services.xserver.videoDrivers = ["nvidia"]; # will install nvidia-vaapi-driver by default
}
