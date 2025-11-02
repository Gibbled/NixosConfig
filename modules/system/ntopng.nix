{ pkgs,  ...}:

{

services.ntopng = {
  enable = true;
};

services.redis = {
  enable = true;
};

}
