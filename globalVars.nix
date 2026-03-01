{pkgs, config, lib, ... }: {


  options = {
   mainUser.option = lib.mkOption "name of the primary system user"; 
   hostName.option = lib.mkOption "host name of the system";
   gitUsername.option = lib.mkOption "github username for version control";
   gitEmail.option = lib.mkOption "github email for version control";
   pathToDirectory.option = lib.mkOption "path (after path to home directory) to config location";
   allowedSSHUser.option = lib.mkOption "user allowed to connect to current system";


  };


}
