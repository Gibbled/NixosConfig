{
  config,
  pkgs,
  ...
}: {
  services.hyprsunset = {
    enable = true;
    package = pkgs.hyprsunset;
#    transitions = {
      #sunrise = {
        #calendar = "*-*-* 06:00:00";
        #requests = [
          #["temperature" "6500"]
          #["gamma 100"]
        #];
      #};
      #sunset = {
        #calendar = "*-*-* 18:00:00";
        #requests = [
          #["temperature" "3000"]
        #];
      #};
    #};
    settings = {
    profile = [
       {
      time = "7:30";
      identity = true;
    }
    {
      time = "18:00";
      temperature = 5000;
      gamma = 0.8;
    }



    ];
    };

  };
}
