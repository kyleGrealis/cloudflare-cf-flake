{
  description = "Nix flake for Cloudflare's new unified agentic CLI (cf)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = {
          cf = pkgs.callPackage ./package.nix { };
          default = self.packages.${system}.cf;
        };

        apps = {
          cf = flake-utils.lib.mkApp { drv = self.packages.${system}.cf; name = "cf"; };
          cloudflare = flake-utils.lib.mkApp { drv = self.packages.${system}.cf; name = "cloudflare"; };
          default = self.apps.${system}.cf;
        };

        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.nodejs_22
            pkgs.npm-check-updates
          ];
        };
      }
    ) // {
      overlays.default = final: prev: {
        cloudflare-cf = final.callPackage ./package.nix { };
      };
    };
}
