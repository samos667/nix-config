{
  description = "Samos's Flake";

  inputs = {
    # Overlays
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland.git";
      rev  = "3b99e906df8b439d65e740301940e57efc057012";
      submodules = true;
      # url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nixvim = {
      url = "github:samos667/nivis";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wezterm = {
      url = "github:wez/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # umu = {
    #   url = "git+https://github.com/Open-Wine-Components/umu-launcher/?dir=packaging\/nix&submodules=1";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    agenix,
    stylix,
    ...
  } @ inputs: let
    supportedSystems = ["x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    nixpkgsFor = forAllSystems (system: import nixpkgs {inherit system;});

    createNixosConfiguration = {
      system,
      username,
      homeDirectory,
      hostname ? null,
      modules ? [],
      includeHomeManager ? true,
    }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs username homeDirectory hostname system;};
        modules =
          [
            ./hosts/${hostname}
            {networking.hostName = hostname;}
          ]
          ++ (
            if includeHomeManager
            then [
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useUserPackages = true;
                  useGlobalPkgs = false;
                  extraSpecialArgs = {inherit inputs system username homeDirectory;};
                  users.${username} = import ./home/${hostname}/home.nix {
                    inherit inputs username homeDirectory;
                    pkgs = nixpkgsFor.${system};
                  };
                  backupFileExtension = "backuppp";
                };
              }
            ]
            else []
          )
          ++ modules;
      };
  in {
    nixosConfigurations.masterace = createNixosConfiguration {
      system = "x86_64-linux";
      username = "sam";
      homeDirectory = "/home/sam";
      hostname = "masterace";
      modules = [
        stylix.nixosModules.stylix
        agenix.nixosModules.default
      ];
    };
  };
}
