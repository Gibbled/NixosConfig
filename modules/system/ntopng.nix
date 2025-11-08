{ pkgs,  ...}:

{

services.ntopng = {
  enable = true;
};

services.redis.servers.redis = {
  enable = true;
};

}
