{ ... }:
{
  home-manager.users.thore = { suites, ... }: {
    imports = suites.base;
  };

  users.users.thore = {
    uid = 1000;
    isNormalUser = true;
    description = "Thore Strassburg";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
