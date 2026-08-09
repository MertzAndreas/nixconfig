{
  description = "A simple NixOS flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    herdr = {
      url = "github:ogulcancelik/herdr/v0.7.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tuicr = {
      url = "github:agavra/tuicr";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      dms,
      ...
    }@inputs:
    let
      mkMachine =
        machineModule:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            machineModule
            dms.nixosModules.greeter
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.mertz = import ./home;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.sharedModules = [
                dms.homeModules.dank-material-shell
              ];
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        desktop = mkMachine ./nixos/desktop.nix;
        laptop = mkMachine ./nixos/laptop.nix;
      };
    };
}
