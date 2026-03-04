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
  pname = "ble-scale-sync";
  version = "1.6.2";
  src = fetchFromGitHub {
    owner = "KristianP26";
    repo = "ble-scale-sync";
    rev = "v1.6.2";
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
    description = "Cross-platform CLI for Linux, macOS & Windows. Read weight & impedance from 23 BLE smart scales and export to Garmin Connect, Strava, Home Assistant, InfluxDB, Webhooks, Ntfy & local files. No phone app needed.";
    homepage = "https://blescalesync.dev/";
    license = lib.licenses.lgpl3Only;
  };

}
