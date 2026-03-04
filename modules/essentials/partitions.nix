{pkgs, config, lib, ... }: {

  options = {
    swapspace.enable = lib.mkEnableOption "enables swapspace for dynamic swap";
    zswap.enable = lib.mkEnableOption "enables zswap on ram";
    systemd-boot.enable = lib.mkEnableOption "enables systemd-boot as bootloader";
  };


  config = lib.mkMerge [


    {
      boot = {
        kernelPackages = pkgs.linuxPackages_latest;
        loader = {
          efi.canTouchEfiVariables = true;
          timeout = 10;
        };
      };
    }


    (lib.mkIf config.swapspace.enable {
      services.swapspace.enable = true;
    })


    (lib.mkIf config.zswap.enable {
      boot.kernelParams = [
        "zswap.enabled=1" # enables zswap
        "zswap.compressor=lz4" #compression algorithm
        "zswap.max_pool_percent=20" #maximum percentage of RAM that zswap is allowed to use
        "zswap.shrinker.enabled=1" # whether to shrink the pool proactively on high memory pressure
      ];
      boot.initrd.systemd.enable = true; # required if using lz4 algorithm for zswap
    })

    (lib.mkIf config.systemd-boot.enable {
      boot.loader.systemd-boot.enable = true;
    })


  ];
}
