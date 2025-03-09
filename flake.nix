{
  description = "Samos's Flake";

  inputs = {
    # Overlays
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland.git";
      rev = "3b99e906df8b439d65e740301940e57efc057012";
      submodules = true;
      # url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wezterm = {
      url = "github:wez/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:samos667/nivis";
  };

  outputs = {
    self,
    nixpkgs,
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
      vars,
      hostname ? null,
      modules ? [],
      includeHomeManager ? true,
    }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs username homeDirectory hostname system vars;};
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
                  extraSpecialArgs = {inherit inputs username homeDirectory hostname system vars;};
                  users.${username} = import ./home/${hostname}/home.nix {
                    inherit inputs username homeDirectory;
                    pkgs = nixpkgsFor.${system};
                  };
                  backupFileExtension = "oldd";
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
        vars = {
          cpu = "intel";
          gpu = "amd";
          de = "rational_pulsion";
        };
        modules = [
          stylix.nixosModules.stylix
          agenix.nixosModules.default
        ];
      };
      loulou = createNixosConfiguration {
        system = "aarch64-linux";
        username = "sam";
        homeDirectory = "/home/sam";
        hostname = "loulou";
        vars = {
          soc = "nanopi5";
        };
        modules = [
          # agenix.nixosModules.default
        ];
      };
    };
  };
}
