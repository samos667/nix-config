{
  description = "Samos NixOS Flake";

  inputs = {
    # Official NixOS package source, using nixos-23.11 branch here
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    # home-manager, used for managing user configuration
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nvimdots.url = "github:ayamir/nvimdots";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
    nixosConfigurations = {

      "workstation" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/workstation
	  home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;

	    home-manager.extraSpecialArgs = inputs;
	    home-manager.users.sam = import ./home;

	  }
        ];
      };
    };
  };
}
