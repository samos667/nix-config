{pkgs, ...}: {
  home.packages = with pkgs; [
    zulu # java 21
    mindustry-wayland
    prismlauncher
    xonotic
    osu-lazer-bin
    shattered-pixel-dungeon
    appimage-run
    # unciv
    # warsow
    # brogue
    # sameboy
    # ppsspp
    # cataclysm-dda
    # widelands
    # openttd
    # openra
    # openrct2
    # minetest
    # endless-sky
    # freeciv
    # devilutionx
    # zeroad
    # osu-lazer-bin
    # superTuxKart
    # vcmi
    # corsix-th
    # warzone2100
    # julius
    # augustus
    # superTux
    # gamehub
    # ryujinx
    # nethack
  ];
}
