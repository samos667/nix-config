{
  pkgs,
  inputs,
  ...
}: let
  # Impure, to properly work, need to run prismlauncher and declare 'Wyn' instance
  # based on fabulous opti modpack + modutils + shader + personal config
  # TODO find a way to purify that
  wynncraft = pkgs.makeDesktopItem {
    name = "Prism-Wynncraft";
    desktopName = "Wynncraft";
    exec = "${pkgs.prismlauncher}/bin/prismlauncher --launch \"Wynncraft\"";
    icon = "wynncraft";
    categories = ["Game"];
  };
in {
  home.file.".local/share/icons/hicolor/128x128/apps/wynncraft.png".source = pkgs.fetchurl {
    url = "https://i.postimg.cc/brygpXLf/wynncraft-icon-1.png";
    hash = "sha256-nSXN+rAx4hQ6hpb/wnRRYH0P+AiGRVqeV9hDUuYXikM=";
  };
  home.packages = with pkgs; [
    # ankama-launcher
    zulu # java 21
    mindustry-wayland
    cataclysm-dda
    prismlauncher
    wynncraft
    xonotic
    osu-lazer-bin
    shattered-pixel-dungeon
    appimage-run
    er-patcher

    #
    # unciv
    # warsow
    # brogue
    # sameboy
    # ppsspp
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
    # gamehub
    # nethack
  ];
  # nixpkgs.overlays = [
  #   (final: prev: {
  #     cataclysm-dda = prev.cataclysm-dda.withMods (mods: [
  #       (prev.cataclysmDDA.buildSoundPack {
  #         modName = "CC-Sounds";
  #         version = "2024-10-27";
  #         src = prev.fetchzip {
  #           url = "https://github.com/Fris0uman/CDDA-Soundpacks/releases/download/2024-10-27/CC-Sounds.zip";
  #           hash = "sha256-Or2gXcaVtcS7NPWKPvy5Lo4BgyrrU1kZpYLcyOuVxZM=";
  #         };
  #       })
  #     ]);
  #   })
  # ];
}
