{
  services.smartd = {
    enable = true;
    devices = [
      {
        device = "/dev/disk/by-id/nvme-CT2000P3PSSD8_2411E89EA68C"; 
      }
    ];
  };
}
