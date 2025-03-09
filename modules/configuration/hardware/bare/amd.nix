{
  pkgs,
  inputs,
  ...
}: let
  hyprland = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  hardware = {
    graphics = {
      enable = true;
      package = hyprland.mesa.drivers;
      extraPackages = with pkgs; [
        vaapiVdpau
        rocmPackages.clr.icd
      ];

      enable32Bit = true;
      package32 = hyprland.pkgsi686Linux.mesa.drivers;
    };
    amdgpu = {
      opencl.enable = true;
    };
  };

  systemd = {
    packages = with pkgs; [lact];
    services.lactd.wantedBy = ["multi-user.target"];
    tmpfiles.rules = [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];
  };
  environment.systemPackages = with pkgs; [lact nvtopPackages.full];
}
