# flake.nix
{
	description = "Nixos config flake";
	
	inputs = {
		nixpkgs.url= "github:nixos/nixpkgs/nixos-unstable";
		
		#kew = {
      		#url = "codeburg:ravachol/kew";
      		#inputs.nixpkgs.follows = "nixpkgs";
    		#};

		};

	outputs = { self, nixpkgs, ...}@inputs:
		let
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
		in
		{

			nixosConfigurations.default = nixpkgs.lib.nixosSystem {
				specialArgs = {inherit inputs;};
				modules = [
				./configuration.nix
				#inputs.home-manager.nixosModules.default
				];
			};
		};
}
