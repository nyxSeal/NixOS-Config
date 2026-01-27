# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];




  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    borgbackup
    btop
    fastfetch
    floorp-bin
    kdePackages.ksshaskpass
    kdePackages.filelight
    #librewolf
    prismlauncher
    tealdeer
    vesktop
    wget
    vim
    vorta
  ];

  



  # Use the systemd-boot EFI boot loader.
  boot = {
     
    loader = {
       systemd-boot.enable = true;
       efi.canTouchEfiVariables = true;
       timeout = 10;
     };
     
     kernelParams = [
       "zswap.enabled=1" # enables zswap
       "zswap.compressor=lz4" # compression algorithm
       "zswap.max_pool_percent=20" # maximum percentage of RAM that zswap is allowed to use
       "zswap.shrinker_enabled=1" # whether to shrink the pool proactively on high memory pressure
     ];
     
     initrd.systemd.enable = true; # required if using lz4 algorithm for zswap     
     kernelPackages = pkgs.linuxPackages_hardened; # Use latest (hardened) kernel
  };

  services.swapspace.enable = true; # dynamically creates swap when needed on SSD




  networking = {
    hostName = "nixy"; # Define your hostname.
    networkmanager.enable = true; # Enables network configurations interactively with nmcli or nmtui
  };




  time.timeZone = "America/New_York"; # Timezone




  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";




  system.autoUpgrade = { # Automatic updating
    enable = true;
    dates = "weekly";
  };

  nix = { 

    gc = { # Automatic rollback version cleanup
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };

  };




  programs.git = {
    enable = true;

    config = {
      user.name = "nyxSeal";
      user.email = "litigate_putdown.zigzagged008@slmails.com";
      pull.rebase = false;
      #commit.gpgsign = true;
    };

  };




  programs.bash = {
    enable = true;

    shellAliases = { # Bash aliases
      rewrite = "sudo nixos-rebuild switch"; 
      update = "sudo nix-channel --update";
      loadConfig = "sudo vim /etc/nixos/configuration.nix";
      saveGit = "bash ~/NixOS-Config/gitSave.sh";
    };

  };




  services.openssh = { # Enables OpenSSH
    enable = true;
    ports = [ 5000 22 ];

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };

  };
  programs.ssh = {
    startAgent = true;
    enableAskPassword = true;

    extraConfig = "
      Host backupServer
        Hostname 192.168.1.172
        Port 5000
        User scattergun
      Host github.com
        Hostname github.com
        Port 22
        User git
        IdentityFile ~/.ssh/id_ed25519_2
        IdentitiesOnly yes
    ";

  };




  environment.variables = {
    SSH_ASKPASS_REQUIRE = "prefer";
  };




  security = {
    unprivilegedUsernsClone = true; # Allows apps to be launched with hardened kernel
    apparmor.enable = true;
    #allowUserNamespaces = true; # Needed for sandboxing?
    sudo.execWheelOnly = true;
    protectKernelImage = true;
  };  




  services = {
    displayManager.ly.enable = true;
    desktopManager.plasma6.enable = true;
    printing.enable = true; # Enables CUPS

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

  };




  documentation.dev.enable = true; # Enables extra man pages



 
  nixpkgs.config.allowUnfree = true; # Allows unfree software to be installed



 
  programs.steam = { # Enables steam
    enable = true;
    remotePlay.openFirewall = false; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };



  
  users.users.nyxSeal = { # define a user account
    isNormalUser = true;
    extraGroups = [ "wheel" ".git" ]; # Enable ‘sudo’ for the user.

    packages = with pkgs; [
      tree
    ];

  };





  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  system.stateVersion = "25.11"; # DO NOT CHANGE

}

