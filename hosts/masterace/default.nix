{pkgs, ...}:
#############################################################
#
#  Ai - my main computer, with NixOS + I5-13600KF + RTX 4090 GPU, for gaming & daily use.
#
#############################################################
let
  hostname = "masterace"; # Define your hostname.
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-config.nix
  ];

  networking.hostName = hostname;
  # networking.computerName = hostname;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sam = {
    initialHashedPassword = "$7$CU..../....cM.cjpSdcybWBpckxY1b90$grq57TCZ9N5gpXRech0atSYOu0Qwi4k9WRgRUOTsh53";
    isNormalUser = true;
    description = "Sammy ETUR";
    extraGroups = ["networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      firefox
      kate
      #  thunderbird
    ];
  };
  users.users.root = {
    initialHashedPassword = "$7$CU..../....cM.cjpSdcybWBpckxY1b90$grq57TCZ9N5gpXRech0atSYOu0Qwi4k9WRgRUOTsh53";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  users.users.sam.shell = pkgs.nushell;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Enable hyprland
  # programs.hyprland.enable = true;

  # Configure console keymap
  console.keyMap = "fr";

  networking = {
    networkmanager.enable = false;
  };

  # conflict with feature: containerd-snapshotter
  # virtualisation.docker.storageDriver = "btrfs";

  # for Nvidia GPU
  services.xserver.videoDrivers = ["nvidia"]; # will install nvidia-vaapi-driver by default
  hardware.nvidia = {
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    # package = config.boot.kernelPackages.nvidiaPackages.stable;

    # required by most wayland compositors!
    modesetting.enable = true;
    powerManagement.enable = true;
  };
  virtualisation.docker.enableNvidia = true; # for nvidia-docker

  hardware.opengl = {
    enable = true;
    # if hardware.opengl.driSupport is enabled, mesa is installed and provides Vulkan for supported hardware.
    driSupport = true;
    # needed by nvidia-docker
    driSupport32Bit = true;
  };

  services.pipewire = {
    enable = true;
    # package = pkgs-unstable.pipewire;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
    wireplumber.enable = true;
  };
  sound.enable = false;
  hardware.pulseaudio.enable = false;
  services = {
    printing.enable = true; # Enable CUPS to print documents.
    keyd = {
      enable = true;
      keyboards.default.settings = {
        main = {
          # overloads the capslock key to function as both escape (when tapped) and control (when held)
          capslock = "overload(control, esc)";
          esc = "capslock";
        };
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
