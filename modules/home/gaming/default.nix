{pkgs, ...}: {
  home.packages = with pkgs; [
    mindustry-wayland
    prismlauncher
    unciv
    warsow
    brogue
    sameboy
    ppsspp
    cataclysm-dda
    widelands
    openttd
    minetest
    endless-sky
  ];
}
