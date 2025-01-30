{
    description = "System NixOS flake";

    inputs = {
        # NixOS official package source, using the unstable branch here
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        # Optional, if you intend to follow nvf's obsidian-nvim input
        # you must also add it as a flake input.
        # obsidian-nvim.url = "github:epwalsh/obsidian.nvim";

        nvf = {
            url = "github:notashelf/nvf";
            # You can override the input nixpkgs to follow your system's instance of nixpkgs.
            # This is safe to do as nvf does not depend on a binary cache.
            inputs.nixpkgs.follows = "nixpkgs";
            # Optionally, you can also override individual plugins, for example:
            # This will use the obsidian-nvim from your inputs
            # inputs.obsidian-nvim.follows = "obsidian-nvim";
        };

    };

    outputs = { self, nixpkgs, home-manager, nvf, ... }@inputs: {
        # Your hostname here
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                # Import the original configuration file
                ./configuration.nix

                # This imports the NixOS module that provides the options
                nvf.nixosModules.default

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
