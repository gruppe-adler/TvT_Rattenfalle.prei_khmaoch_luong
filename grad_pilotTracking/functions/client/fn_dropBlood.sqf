params ["_unit"];

private _posASL = getPosASL _unit;
private _inWater = surfaceIsWater (_posASL);
private _speed = speed _unit;
private _type = ["BloodSpray_01_New_F", "BloodSpray_01_Old_F"];
private _nearObjects = _unit nearObjects 1; // 1m must be enough
private _placeOccupied = false;

{
    if (  
          _x isKindOf "Helper_Base_F"
        ) exitWith {
        _placeOccupied = true;
    };
} forEach _nearObjects;

// diag_log format ["%1", _nearObjects];


private _isBleeding = (_unit getVariable ["ace_medical_isBleeding", false] || _unit getVariable ["GRAD_pilotTracking_isBleeding", false]);

if (_isBleeding && !_placeOccupied && !(surfaceIsWater position _unit)) then {

      // sprint
      if (_speed >= 18) then {
        _type = ["BloodTrail_01_New_F", "BloodTrail_01_Old_F"];
      } else {
          // run
          if (_speed >= 13 && _speed < 18) then {
              _type = ["BloodTrail_01_New_F", "BloodTrail_01_Old_F"];
          } else {
              // walk full fatigue
              if (_speed >= 5 && _speed < 13) then {
                  _type = ["BloodPool_01_Medium_New_F", "BloodPool_01_Medium_Old_F"];
              } else {
                  // slow walk, painful walk
                  if (_speed > 0 && _speed < 5) then {
                      _type = ["BloodSplatter_01_Small_New_F", "BloodSplatter_01_Small_Old_F"];
                  } else {
                      // static blood pool
                      _type = ["BloodPool_01_Large_New_F", "BloodPool_01_Large_Old_F"];
                  };
              };
          };
      };
 
   		[
        _type, 
        _posASL,
        getDir _unit
      ] call GRAD_pilotTracking_fnc_createBloodSplatter;
};