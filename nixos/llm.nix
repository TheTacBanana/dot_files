{ config, pkgs, ... }:
{
  services.ollama = {
    enable = true;
    acceleration = "rocm";
    loadModels = [
      "llama3.2:3b"
      "gemma3:4b"
    ];
  };

  services.open-webui.enable = true;
}
