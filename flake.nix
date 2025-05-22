{
    description = "System NixOS flake";

    inputs = {
        home-manager = {
            inputs.nixpkgs.follows = "nixpkgs";
            url = "github:nix-community/home-manager";
        };

        # NixOS official package source, using the unstable branch here
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: {
        # Your hostname here
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            modules = [
                # Import the original configuration file
                ./configuration.nix

                home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.dara = import ./home.nix;
                    };
                }
            ];
            system = "x86_64-linux";
        };
    };
}
