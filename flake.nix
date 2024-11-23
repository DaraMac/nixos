{
    description = "System NixOS flake";

    inputs = {
        # NixOS official package source, using the unstable branch here
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs, ... }@inputs: {
        # Your hostname here
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                # Import the original configuration file
                ./configuration.nix
            ];
        };
    };
}
