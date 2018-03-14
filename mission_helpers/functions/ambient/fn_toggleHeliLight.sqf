params ["_heli", "_caller", "_state"];

if (!isServer) then {
	player action ['LightOn', _heli];
} else {
	_caller action ['LightOn', _heli];
};