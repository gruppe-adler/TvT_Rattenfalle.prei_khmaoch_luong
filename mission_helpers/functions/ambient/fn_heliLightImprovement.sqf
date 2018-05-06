/*
	
	disables heli light blinking

	input: array of helilights (optional)
	
	run on server
*/

params [["_helilights",[]]];


if (!isServer) exitWith {};

// default all lights on map are taken
if (typeName _helilights isEqualTo "STRING") then {
	_helilights = nearestobjects [[worldSize/2, worldSize/2],[
		"Land_PortableHelipadLight_01_F",
		"PortableHelipadLight_01_yellow_F",
		"PortableHelipadLight_01_red_F",
		"PortableHelipadLight_01_blue_F",
		"PortableHelipadLight_01_green_F",
		"PortableHelipadLight_01_white_F"
	], 20000];

	// diag_log format ["_helilights is %1", _helilights];
};


{
	[{ (_this select 0) animationPhase "light_1_blinking" isEqualTo 1
		}, 
	{
		if (!isMultiplayer) then {
				(_this select 0) enableSimulation false;
			} else {
				(_this select 0) enableSimulationGlobal false;
		};
	}, [_x]] call CBA_fnc_waitUntilAndExecute;

} forEach _helilights;