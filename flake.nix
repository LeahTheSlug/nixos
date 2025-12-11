# flake.nix
{
	description = "Nixos config flake";
	
	inputs = {
		nixpkgs.url= "github:nixos/nixpkgs/nixos-unstable";
		
		noctalia = {
      		url = "github:noctalia-dev/noctalia-shell";
      		inputs.nixpkgs.follows = "nixpkgs";
    		};

		# home-manager = {
		#	url = "github:nix-community/home-manager";
		#	inputs.nixpkgs.follows = "nixpkgs";
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
				./noctalia.nix
				#./niri.nix
				#inputs.home-manager.nixosModules.default
				];
			};
		};
}
