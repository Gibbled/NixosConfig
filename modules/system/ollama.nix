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

}
