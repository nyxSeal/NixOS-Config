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
    kdePackages.ksshaskpass
    librewolf
    prismlauncher
    tealdeer
    vesktop
    wget
    vim
    vorta
    yt-dlp
    ytfzf
  ];





  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 10;
  };

  boot.kernelPackages = pkgs.linuxPackages_hardened; # Use latest (hardened) kernel

  networking.hostName = "nixy"; # Define your hostname.

  networking.networkmanager.enable = true; # Enables network configurations interactively with nmcli or nmtui

  time.timeZone = "America/New_York"; # Timezone

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  system.autoUpgrade = { # Automatic updating
    enable = true;
    dates = "weekly";
  };

  nix.gc = { # Automatic rollback version cleanup
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 10d";
  };
  nix.settings.auto-optimise-store = true;

  programs.git = {
    enable = true;
    config = {
      user.name = "nyxSeal";
      user.email = "litigate_putdown.zigzagged008@slmails.com";
      init.defaultBranch = "main";
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
      saveGit = "cd ~/NixOS-Config && bash gitSave.sh";
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
  
  # Define a user account
  users.users.nyxSeal = {
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

