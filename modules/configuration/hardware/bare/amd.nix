{pkgs, ...}: {
  hardware.graphics = {
    enable = true;
    package = pkgs.mesa.drivers;
    extraPackages = with pkgs; [amdvlk];
    enable32Bit = true;
    extraPackages32 = with pkgs; [driversi686Linux.amdvlk];
  };
  systemd = {
    packages = with pkgs; [lact];
    services.lactd.wantedBy = ["multi-user.target"];
  };
  environment.systemPackages = with pkgs; [lact];
}
