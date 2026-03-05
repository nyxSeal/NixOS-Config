{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  options = {
    kde.enable = lib.mkEnableOption "enable kde plasma";
  };

  config = lib.mkIf config.kde.enable {
    services.desktopManager.plasma6.enable = true;
    users.users."${config.mainUser}".packages = [pkgs.kdePackages.ksshaskpass];
    environment.variables.SSH_ASKPASS_REQUIRE = "prefer";
  };
}
