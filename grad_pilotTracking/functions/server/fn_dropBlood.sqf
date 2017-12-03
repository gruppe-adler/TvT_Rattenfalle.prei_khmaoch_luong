params ["_unit"];


[{
    params ["_args", "_handle"];
    _args params ["_unit"];
  
   	private _randomPosAroundPlayer = [[[getPosASL _unit, 1]],[]] call BIS_fnc_randomPos;
   	private _speed = speed _unit;
   	private _type = "BloodTrail_01_New_F";

   	if (_speed < 1) then {
   		_type = selectRandom [
	   		"BloodSplatter_01_Medium_New_F",
	   		"BloodSplatter_01_Small_New_F",
	   		"BloodSpray_01_New_F"
   		];
   	};

	if (vehicle _unit isEqualTo _unit) then {
   		[_type, getPosASL _unit, getDir _unit, _randomPosAroundPlayer, selectRandom [true, false], floor (random 360)] remoteExec ["GRAD_pilotTracking_fnc_createBloodSplatter", [0,-2] select isDedicated];
	};

   	if (!alive _unit) then {
   		[_handle] call CBA_fnc_removePerFrameHandler;
   	};
 
},1,[_unit]] call CBA_fnc_addPerFrameHandler;