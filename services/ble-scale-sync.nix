{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib)
    mkEnableOption
    mkIf
    mkOption
    ;

  cfg = config.services.ble-scale-sync;

in
{

  options.services.ble-scale-sync =
    let
      inherit (lib) types;
    in
    {
      enable = mkEnableOption "BLE-SCALE-Sync Daemon";

      home = mkOption {
        type = types.str;
        default = "/var/lib/ble-scale-sync";
        example = "/var/lib/ble-scale-sync";
        description = "Home directory for ble-scale-sync";
      };

      config = mkIf cfg.enable {

        systemd.servics.ble-scale-sync = {
          wantedBy = [ "multi-user.target" ];
          serviceConfig = {

          };
        };

        users.users.blescalesync = {
          isSystemUser = true;
          home = cfg.home;
          createHome = true;
          group = "blescalesync";
        };

      };

    };

}
