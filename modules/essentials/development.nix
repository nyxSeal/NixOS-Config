{pkgs, config, lib, ... }: {

  options.development.enable = lib.mkEnableOption "enables a code development suite";

  config = lib.mkIf config.development.enable {
    environment.systemPackages = [
      pkgs.libgcc #c/c++ compiler 
    ];

  };

}
