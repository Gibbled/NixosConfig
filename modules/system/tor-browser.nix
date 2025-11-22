{
  config,
  pkgs,
  ...
}: {
  services.tor = {
    enable = true;
    openFirewall = true;
  };
}
