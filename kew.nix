{ pkgs, inputs, ... }:
{
	#install package
	environment.systemPackages = with pkgs; [
		inputs.kew.packages.${pks.stdenv.hostPlatform.system}.default
	];
}

