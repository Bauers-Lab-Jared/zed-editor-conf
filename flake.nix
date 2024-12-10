{
  description = "Bauer's Lab - Composable Zed Editor Configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;

      snowfall = {
        root = ./nix;

        namespace = "bl-zed-editor";

        meta = {
          name = "bauers-lab-zed-editor";

          title = "Bauer's Lab Zed Editor";
        };
      };
    };
}
