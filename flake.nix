{
  description = "Samos's Flake";

  inputs = {
    # Overlays
    nixpkgs.url = "github:nixos/nixpkgs/?rev=4c30668e1edb7348169407f218fa7c71a94b17f3";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?ref=refs/tags/v0.42.0&submodules=1";
      # url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
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
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    agenix,
    stylix,
    ...
  } @ inputs: let
    inherit (nixpkgs.lib) nixosSystem;
    supportedSystems = ["x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"];

    # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    # Nixpkgs instantiated for supported system types.
    nixpkgsFor = forAllSystems (system: import nixpkgs {inherit system;});

    # Function to create a nixosConfiguration with a dynamic username
    createNixosConfiguration = {
      system,
      username,
      homeDirectory,
      hostname ? null,
      modules ? [],
      includeHomeManager ? true,
    }:
      nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs username homeDirectory hostname;
        };
        modules =
          [./hosts/${hostname} {networking.hostName = hostname;}]
          ++ (
            if includeHomeManager
            then [
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useUserPackages = true;
                  useGlobalPkgs = false;
                  extraSpecialArgs = {inherit inputs system username homeDirectory;};
                  users."${username}" = import ./home/${hostname}/home.nix {
                    inputs = inputs;
                    pkgs = nixpkgsFor."${system}";
                    inherit username homeDirectory;
                  };
                  backupFileExtension = "bkp";
                };
              }
            ]
            else []
          )
          ++ modules;
      };
  in {
    nixosConfigurations = {
      masterace = createNixosConfiguration {
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
  };
}
