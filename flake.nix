{
    description = "System NixOS flake";

    inputs = {
        # NixOS official package source, using the unstable branch here
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	home-manager.url = "github:nix-community/home-manager";
	home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: {
        # Your hostname here
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                # Import the original configuration file
                ./configuration.nix
		home-manager.nixosModules.home-manager
		{
			home-manager.useGlobalPkgs = true;
			home-manager.useUserPackages = true;
			home-manager.users.dara = import ./home.nix;
		}
            ];
        };
    };
}
