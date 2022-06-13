{
    description = "toastloop's nixos configuration"
    inputs = {

        # Standard Nix Packages
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        # Home Manager Packages
        home-manager = {                                
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # Nix User Repository Packages
        nurpkgs = {
            url = "github:nix-community/NUR";
        };

        # MacOS
        darwin = {
            url = "github:lnl7/nix-darwin/master";
            inputs.nixpkgs.follows = "nixpkgs";
        }

    }
    outputs = inputs @ {self, nixpkgs, home-manager, nurpkgs, ...}:

        let
            user = "matt";
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};

        in
        {

            nixosConfigurations = {
                import ./hosts {
                    inherit (nixpkgs) lib;
                    inherit inputs nixpkgs home-manager nur user;
                }
            }

            darwinConfigurations = {
                import ./darwin {
                    inherit (nixpkgs) lib;
                    inherit inputss nixpkgs home-manager darwin user;
                }
            }

            homeConfigurations = {
                import ./nix {
                    inherit (nixpkgs) lib;
                    inherit inputs nixpkgs home-manager nixgl user;
                }
            }

        }

}