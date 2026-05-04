{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    signing.format = "openpgp";
    settings.user.name = "Gibbled";
    settings.user.email = "lucksack@gmail.com";
  };
}
