{
  fetchFromGitHub,
  buildNpmPackage,
  nodejs_24,
  lib,
  pkg-config,
  systemd,
  ...
}:

# stdenv.mkDerivation rec {
buildNpmPackage {
  pname = "SparkyFitness";
  version = "0.16.4.8";
  src = fetchFromGitHub {
    owner = "CodeWithCJ";
    repo = "SparkyFitness";
    rev = "v0.16.4.8";
    hash = "sha256-gcmvCdLtWW09XWw+VTAvtnSZyse0SFJ3b92bxJnhVsI=";
  };

  npmDepsHash = "sha256-KXeMDEZtkX1khrL9Fvg7cSCXncjM8g3B88CuKNMeneI=";

  nativeBuildInputs = [
    nodejs_24
    pkg-config
  ];

  buildInputs = [
    systemd
  ];

  meta = {
    description = "";
    homepage = "";
    license = lib.licenses.lgpl3Only;
  };

}
