{
  config,
  pkgs,
  lib,
  ...
}: {
  services.privoxy = {
    enable = true;
    #inspectHttps = true;
    enableTor = true;
    settings.forward-socks5 = lib.mkDefault ".onion localhost:9050 .";
  };
}
