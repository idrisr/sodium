{
  inputs.nixpkgs.url = "nixpkgs";
  outputs = { nixpkgs, self }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in with pkgs; {
      devShells.${system} = rec {
        sodium = mkShell { buildInputs = [ java-language-server jdk maven ]; };
        default = sodium;
      };
    };
}
