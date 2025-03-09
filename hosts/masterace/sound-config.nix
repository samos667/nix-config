{
  pkgs,
  inputs,
  ...
}: {
  services.pulseaudio.enable = false;

  security.rtkit.enable = true;

  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
    lowLatency = {
      # enable this module
      enable = true;
      # defaults (no need to be set unless modified)
      quantum = 64;
      rate = 48000;
    };
  };

  environment.systemPackages = with pkgs; [
    pulseaudio
    pavucontrol
    # alsa-utils
  ];

  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };

  services = {
    printing.enable = true;
  };
}
