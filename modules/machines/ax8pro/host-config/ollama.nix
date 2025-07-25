{ config, pkgs, ... }:

{


services.ollama = {

enable = true;
acceleration = "rocm";
environmentVariables = {
  HCC_AMDGPU_TARGET = "gfx1103";
};
rocmOverrideGfx = "11.0.3";

};

services.open-webui = {

enable = true;
#enable = false;


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
