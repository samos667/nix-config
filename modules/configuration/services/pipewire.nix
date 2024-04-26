{pkgs, ...}: {
  services.pipewire = {
    enable = true;
    # package = pkgs-unstable.pipewire;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
    extraConfig.pipewire = {
      "10-clock-rate" = {
        "context.properties" = {
          "default.clock.rate" = 192000;
          # "default.clock.allowed-rates" = [44100 48000 96000 192000];
        };
      };
    };
    wireplumber = {
      enable = true;
      configPackages = [
        (pkgs.writeTextDir "share/wireplumber/main.lua.d/99-alsa-lowlatency.lua" ''
          alsa_monitor.rules = {
            {
              matches = {{{ "node.name", "matches", "alsa_output.pci-0000_00_1f.3.analog-stereo" }}};
              apply_properties = {
                ["audio.format"] = "S32LE",
                ["audio.rate"] = "192000", -- for USB soundcards it should be twice your desired rate
                ["api.alsa.period-size"] = 2, -- defaults to 1024, tweak by trial-and-error
                ["api.alsa.disable-batch"] = true, -- generally, USB soundcards use the batch mode
              },
            },
            {
              matches = {{{ "node.name", "matches", "easyeffects_sink" }}};
              apply_properties = {
                ["audio.format"] = "S32LE",
                ["audio.rate"] = "192000", -- for USB soundcards it should be twice your desired rate
                ["api.alsa.period-size"] = 2, -- defaults to 1024, tweak by trial-and-error
                ["api.alsa.disable-batch"] = true, -- generally, USB soundcards use the batch mode
              },
            },
          }
        '')
      ];
    };
  };
  sound.enable = false;
  hardware.pulseaudio.enable = false;
  services = {
    printing.enable = true; # Enable CUPS to print documents.
  };
}
