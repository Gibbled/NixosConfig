{
  config,
  pkgs,
  ...
}: {
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    environmentVariables = {
      #HCC_AMDGPU_TARGET = "gfx1102";
      HCC_AMDGPU_TARGET = "gfx1103";
    };
    #rocmOverrideGfx = "11.0.2";
    rocmOverrideGfx = "11.0.3";
    loadModels = [
      "dolphin3"
      "gemma3"
      "gemma3:4b"
      "gemma4:4b"
      "deepseek-r1:latest"
      "deepseek-r1:1.5b"
      "mistral:latest"
      "mistral:7b"
      "qwen3"
    ];
    syncModels = true;
  };

  environment.systemPackages = with pkgs; [
    python313Packages.rapidocr-onnxruntime
    oterm
  ];

  services.open-webui = {
    enable = true;

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
