{
  description = "Samos's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Overlays
    agenix.url = "github:ryantm/agenix";
    nixvim.url = "github:samos667/nixvim-config";
    hyprland.url = "github:hyprwm/Hyprland/v0.40.0";
    anyrun.url = "github:Kirottu/anyrun";
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, agenix, stylix, ... }@inputs:
    let
      inherit (nixpkgs.lib) nixosSystem;
      supportedSystems =
        [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Nixpkgs instantiated for supported system types.
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });

      # Function to create a nixosConfiguration with a dynamic username
      createNixosConfiguration = { system, username, homeDirectory
        , hostname ? null, modules ? [ ], includeHomeManager ? true, }:
        nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit username homeDirectory hostname;
          };
          modules = [ ./hosts/${hostname} { networking.hostName = hostname; } ]
            ++ (if includeHomeManager then [
              stylix.nixosModules.stylix
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useUserPackages = true;
                  useGlobalPkgs = false;
                  extraSpecialArgs = { inherit inputs; };
                  users."${username}" = import ./home/${hostname}/home.nix {
                    inputs = inputs;
                    pkgs = nixpkgsFor."${system}";
                    inherit username homeDirectory;
                  };
                  backupFileExtension = "backup";
                };
              }
            ] else
              [ ]) ++ modules;
        };
    in {
      nixosConfigurations = {
        masterace = createNixosConfiguration {
          system = "x86_64-linux";
          username = "sam";
          homeDirectory = "/home/sam";
          hostname = "masterace";
          modules = [ agenix.nixosModules.default ];
        };
      };
    };
}
