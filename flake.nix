# flake.nix
# https://www.youtube.com/watch?v=yQwW8dkuHqw
{
  description = "test";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.x86_64-linux.default =
        pkgs.mkShell
          {
            nativeBuildInputs = with pkgs; [
              python312
              python312Packages.pyaudio
              python312Packages.numpy
            ];

            # shellHook = ''
            # zsh
            # '';

          };
    };
}