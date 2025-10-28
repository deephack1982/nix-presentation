{
  description = "A Nix-flake-based C/C++ development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        # Here are all the packages we would like available
        devDeps = with pkgs; [
          clang
          cmake
          codespell
          conan
          cppcheck
          doxygen
          gtest
          lcov
          vcpkg
        ];

        # Additional packages for runtime use in the container
        containerDeps = with pkgs; [
          bashInteractive
          coreutils
          findutils
        ];

        hook = ''
          # This is where I'll add any additional auth needed
          echo "DevShell up!"
        '';
      in
      {
        # Dev shell
        devShells.default = pkgs.mkShell {
          buildInputs = devDeps;
          shellHook = hook;
        };

        # Container image
        packages.devContainer = pkgs.dockerTools.buildImage {
          name = "cpp-dev";
          tag = "latest";

          copyToRoot = pkgs.buildEnv {
            name = "image-root";
            paths = devDeps ++ containerDeps;
          };

          extraCommands = ''
            mkdir -p ./tmp
          '';

          config = {
            Cmd = [ "bash" ];
            Env = [
              "PATH=${pkgs.lib.makeBinPath devDeps}:${pkgs.lib.makeBinPath containerDeps}:$PATH"
            ];
            WorkingDir = "/workspace";
          };
        };

        # Nix package build instructions
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "Hello";
          version = "0.1";

          src = ./.;

          nativeBuildInputs = [ pkgs.clang ];

          buildPhase = ''
            clang main.c
          '';

          installPhase = ''
            mkdir -p $out/bin
            cp a.out $out/bin/hello
          '';
        };
      }
    );
}
