{ pkgs, inputs, ... }:
{
  # install package
  environment.systemPackages = with pkgs; [
    inputs.project.url = "codeburg:ravachol/kew";
    # ... maybe other stuff
  ];
}

