{
  description = "Samos NixOS Flake inspired by https://github.com/ryan4yin/nix-config";

  inputs = {
    # Official NixOS package source, using nixos-23.11 branch here
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    # home-manager, used for managing user configuration
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    astronvim = {
      url = "github:AstroNvim/AstroNvim/v3.42.0";
      flake = false;
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
    nixosConfigurations = {

      "ctemplate" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/ctemplate
	        home-manager.nixosModules.home-manager
	        {
	          home-manager.useGlobalPkgs = true;
	          home-manager.useUserPackages = true;
	          home-manager.extraSpecialArgs = inputs;
	          home-manager.users.sam = import ./home/ctemplate/home.nix;
	        }
        ];
      };
      "workstation" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/workstation
	        home-manager.nixosModules.home-manager
	        {
	          home-manager.useGlobalPkgs = true;
	          home-manager.useUserPackages = true;
	          home-manager.extraSpecialArgs = inputs;
	          home-manager.users.sam = import ./home/workstation/home.nix;
	        }
        ];
      };
      "k3sm1" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/k3s
	        home-manager.nixosModules.home-manager
	        {
	          home-manager.useGlobalPkgs = true;
	          home-manager.useUserPackages = true;
	          home-manager.extraSpecialArgs = inputs;
	          home-manager.users.sam = import ./home/k3s/home.nix;
	        }
        ];

      };
      "mc" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/mc
	        home-manager.nixosModules.home-manager
	        {
	          home-manager.useGlobalPkgs = true;
	          home-manager.useUserPackages = true;
	          home-manager.extraSpecialArgs = inputs;
	          home-manager.users.sam = import ./home/ctemplate/home.nix;
	        }
        ];

      };
    };
  };
}
