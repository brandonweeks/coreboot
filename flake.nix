{
  nixConfig.bash-prompt = "[nix(coreboot)] ";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs =
    { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;
      devShells.x86_64-linux.default = pkgs.mkShellNoCC {
        buildInputs = with pkgs; [
          bison
          flex
          glibc_multi.dev
          gnat
          gnum4
          go
          intel-gpu-tools
          imagemagick
          libuuid
          nasm
          ncurses
          nss
          pciutils
          perl
          python3
          openssl
          zlib
        ];
        nativeBuildInputs = with pkgs; [ pkg-config ];
      };
    };
}
