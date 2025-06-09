{
  config,
  pkgs,
  lib,
  ...
}:

{

services.udev.packages = [ pkgs.yubikey-personalization ];
services.pcscd.enable = true;
services.yubikey-agent.enable = true;


programs.gnupg.agent = {
  enable = true;
  enableSSHSupport = true;
};



security.pam.services = {
  login.u2fAuth = false;
  sudo.u2fAuth = true;
};

security.pam.yubico = {
   enable = true;
   debug = true;
   mode = "challenge-response";
   id = [ "4872437" 
          "4872881"
   ];

};

services.udev.extraRules = ''
      ACTION=="remove",\
       ENV{ID_BUS}=="usb",\
       ENV{ID_MODEL_ID}=="0116",\
       ENV{ID_VENDOR_ID}=="1050",\
       ENV{ID_VENDOR}=="Yubico",\
       RUN+="${pkgs.systemd}/bin/loginctl lock-sessions"
  '';



}
