params ["_unit"];

_bloodTrailStatic = [
  ["BloodSplatter_01_Medium_New_F", "BloodSplatter_01_Medium_Old_F"],
  ["BloodSplatter_01_Small_New_F", "BloodSplatter_01_Small_Old_F"],
  ["BloodSpray_01_New_F", "BloodSpray_01_Old_F"]
];
_bloodTrailMoving = [
  "BloodTrail_01_New_F", 
  "BloodTrail_01_Old_F"
];


[{
    params ["_args", "_handle"];
    _args params ["_unit", "_bloodTrailStatic", "_bloodTrailMoving"];

    private _posASL = getPosASL _unit;
    private _inWater = surfaceIsWater (_posASL);
   	private _randomPosAroundPlayer = [[[_posASL, 1]],[]] call BIS_fnc_randomPos;
   	private _speed = speed _unit;
   	private _type = _bloodTrailMoving;

    private _nearObjects = nearestObjects [_unit, [], 2]; // 5m must be enough
    private _placeOccupied = false;

    
    // TODO DOESNT WORK
    {
        if (  
              typeOf _x isEqualTo "Sign_Sphere10cm_F"
            ) exitWith {
            _placeOccupied = true;
            // hint "place occupied";
        };
    } forEach _nearObjects;

   	if (_speed < 1) then {
   		_type = selectRandom _bloodTrailStatic;
   	};

    private _isBleeding = (_unit getVariable ["ace_medical_isBleeding", false] || _unit getVariable ["GRAD_pilotTracking_isBleeding", false]);

    diag_log format ["%1, %2", _nearObjects, _placeOccupied];

    // WET AND DRY FOOTSTEPS
      private _wetness = _unit getVariable ["GRAD_pilotTracking_wetFeet", 0];
      
      if (_inWater) then {
           _unit setVariable ["GRAD_pilotTracking_wetFeet", _wetness + 1];
      };

	  if (isNull objectParent _unit && _isBleeding && !_placeOccupied && !(surfaceIsWater position _unit)) then {
     
      if (_wetness > 0) then {
          _unit setVariable ["GRAD_pilotTracking_wetFeet", _wetness - 1]; 
          [_unit] remoteExec ["GRAD_pilotTracking_fnc_createFootStepWet", [0,-2] select isDedicated];
      } else {
          [_unit] remoteExec ["GRAD_pilotTracking_fnc_createFootStepDry", [0,-2] select isDedicated];
      };
        

      if (random 1 > 0.3) then {
     		[
          _type, getPosASL _unit,
          getDir _unit,
          _randomPosAroundPlayer,
          selectRandom [true, false, false, false, false],
          floor (random 360)
        ] remoteExec ["GRAD_pilotTracking_fnc_createBloodSplatter", [0,-2] select isDedicated, true]; // check performance for JIP
      };
	  };

   	if (!alive _unit) then {
   		[_handle] call CBA_fnc_removePerFrameHandler;
   	};

},1,[_unit, _bloodTrailStatic, _bloodTrailMoving]] call CBA_fnc_addPerFrameHandler;
