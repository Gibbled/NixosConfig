{ config, pkgs, ... }:

{


services.ollama = {

enable = true;
acceleration = "rocm";
environmentVariables = {
  HCC_AMDGPU_TARGET = "gfx1102";
};
rocmOverrideGfx = "11.0.2";

};

services.open-webui = {

#enable = true;
#Its broken at the moment, so disabled 20250415
enable = false;


environment = {
  ANONYMIZED_TELEMETRY = "False";
  DO_NOT_TRACK = "True";
  SCARF_NO_ANALYTICS = "True";
};

#host = "0.0.0.0";
host = "127.0.0.1";

openFirewall = true;

port = 8080;


};


}
