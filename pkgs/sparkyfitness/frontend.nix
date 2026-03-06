{
  fetchFromGitHub,
  buildNpmPackage,
  lib,
  pkgs,
  importNpmLock,
  ...
}:

# stdenv.mkDerivation rec {
buildNpmPackage rec {
  pname = "SparkyFitness";
  version = "0.16.4.8";
  src = fetchFromGitHub {
    owner = "CodeWithCJ";
    repo = "SparkyFitness";
    rev = "v0.16.4.8";
    hash = "sha256-Y1znYdZ7e1vnrduhdxmQeYUIP7N8AlIohg9LynbTx+8=";
  };

  npmDeps = importNpmLock {
    package = lib.importJSON "${src}/SparkyFitnessFrontend/package.json";
    packageLock = lib.importJSON "${src}/SparkyFitnessFrontend/package-lock.json";
  };

  sourceRoot = "source/SparkyFitnessFrontend";

  npmConfigHook = pkgs.importNpmLock.npmConfigHook;

  nativeBuildInputs = [
    pkgs.nodejs_24
    pkgs.nodePackages.pnpm
  ];

  installPhase = ''
    runHook preInstall

    cp -r dist $out

    runHook postInstall
  '';

  meta = {
    description = "";
    homepage = "";
    license = lib.licenses.lgpl3Only;
  };

}
