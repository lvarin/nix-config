{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:

  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {

     xixon = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./nixos/xixon/configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.alvaro = import ./home-manager/home.nix;
        }
      ];
    };
    vm = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
       ./nixos/vm/configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.alvaro = import ./home-manager/home.nix;
        }
      ];
     };
   };
  };
}
