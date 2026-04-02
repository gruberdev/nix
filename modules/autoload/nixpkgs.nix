{
  pkgs,
  inputs, # Add inputs to the function arguments
  ...
}: {
  nix.package = pkgs.nix;
  nixpkgs.config = {
    allowUnfree = true;
    overlays = [inputs.nvidia-patch.overlay];
  };
}
