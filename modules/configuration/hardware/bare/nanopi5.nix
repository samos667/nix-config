{pkgs, ...}: {
  # Bigup 2 @bdew https://github.com/bdew/nanopi-image/blob/master/nanopi.nix
  # Thanks it can be used on any installation on any nanopi5(s/c) !
  # TODO propose to upstream

  powerManagement.cpuFreqGovernor = "schedutil";
  hardware = {
    deviceTree.name = "rockchip/rk3568-nanopi-r5c.dtb";
    firmware = [
      #TODO ?
      pkgs.linux-firmware
    ];
  };
  environment.etc = {
    "systemd/journald.conf.d/99-storage.conf".text = ''
      [Journal]
      Storage=volatile
    '';
  };
  boot = {
    # growPartition = true;
    tmp.useTmpfs = true;

    kernelPackages = pkgs.linuxKernel.packages.linux_6_13;
    kernelParams = [
      "console=tty0"
      "earlycon=uart8250,mmio32,0xfe660000"
    ];
    initrd.availableKernelModules = [
      "sdhci_of_dwcmshc"
      "dw_mmc_rockchip"
      "analogix_dp"
      "io-domain"
      "rockchip_saradc"
      "rockchip_thermal"
      "rockchipdrm"
      "rockchip-rga"
      "pcie_rockchip_host"
      "phy-rockchip-pcie"
      "phy_rockchip_snps_pcie3"
      "phy_rockchip_naneng_combphy"
      "phy_rockchip_inno_usb2"
      "dwmac_rk"
      "dw_wdt"
      "dw_hdmi"
      "dw_hdmi_cec"
      "dw_hdmi_i2s_audio"
      "dw_mipi_dsi"
    ];

    loader = {
      grub.enable = false;
      generic-extlinux-compatible = {
        enable = true;
        useGenerationDeviceTree = true;
      };
      timeout = 1;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS";
      fsType = "ext4";
    };
    "/var/log" = {
      fsType = "tmpfs";
    };
  };
}
