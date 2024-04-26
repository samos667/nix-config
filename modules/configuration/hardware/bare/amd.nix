{
  pkgs,
  inputs,
  ...
}: let
  pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  hardware = {
    graphics = {
      enable = true;
      package = pkgs-unstable.mesa.drivers;
      enable32Bit = true;
      package32 = pkgs-unstable.pkgsi686Linux.mesa.drivers;
      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
    };
    amdgpu = {
      opencl.enable = true;
    };
  };

  hardware.opengl.extraPackages = with pkgs; [
    rocmPackages.clr
    rocmPackages.clr.icd
    vaapiVdpau
  ];

  systemd = {
    packages = with pkgs; [lact];
    services.lactd.wantedBy = ["multi-user.target"];
    tmpfiles.rules = [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];
  };
  environment.systemPackages = with pkgs; [lact nvtop];
}
