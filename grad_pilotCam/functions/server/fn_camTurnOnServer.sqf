params ["_player", "_camObj"];

private _area = _camObj getVariable ["GRAD_pilotCam_area", objNull];
private _relPos = _camObj getRelPos [0.3, _camObj getDir _area];
private _heightAboveGround = (getPosASL _camObj select 2) + 1.1;
_relPos set [2,_heightAboveGround];

private _aimPos = [getPos _area select 0, getPos _area select 1, _heightAboveGround]; // getRelPos [3000, _camObj getDir _area];
private _targetObject = "Sign_Pointer_Yellow_F" createVehicle [0,0,0];
_targetObject setPosASL [_aimPos select 0, _aimPos select 1, _heightAboveGround];

// private _ASLz = (getPosASL _camObj) select 2;
// _targetObject setPosASL [(getPosASL _targetObject) select 0, (getPosASL _targetObject) select 1, _ASLz];
_targetObject setObjectTextureGlobal [0,"#(argb,8,8,3)color(0,0,0,0)"];


// start pip cams for players and fullscreen for pilot
{
  if (_x getVariable ["GRAD_pilotTracking_isPilot",false]) then {
      [_camObj, _relPos, _targetObject, _area] remoteExec ["GRAD_pilotCam_fnc_camTurnOnPilot", _x, true];
  } else {
      [_camObj, _relPos, _targetObject, _area] remoteExec ["GRAD_pilotCam_fnc_camTurnOnPlayer", _x, true];
  };
} forEach allPlayers;



[{
	params ["_args", "_handle"];
	_args params ["_camObj", "_targetObject", "_area"];

  // check if pilot is available
  private _entities = (position _area) nearObjects 7; // 5m must be enough
  private _pilotInside = false;

  // diag_log format ["found in camArea: %1", _entities];

  // exit if no pilot is inside
  { if (_x isEqualTo (missionNamespace getVariable ["GRAD_pilotTracking_pilotTrackingObj",objNull])) exitWith {  _pilotInside = true; }; } forEach _entities;

  if (!(_camObj getVariable ["GRAD_pilotCam_camIsOn", false])) exitWith {
      [_handle] call CBA_fnc_removePerFrameHandler;

      missionNamespace setVariable ["GRAD_pilotCam_reasonForShutOff", "shutter", true];

      _camObj setVariable ["GRAD_pilotCam_camIsOn", false, true];
      deleteVehicle _targetObject;

      diag_log format ["server: aborting filming, camera shut off"];
      GRAD_pilotCam_RECORDING_DONE = 0;
  };

	if (!_pilotInside || GRAD_pilotCam_RECORDING_DONE > GRAD_pilotCam_RECORDING_DURATION) exitWith {

    [_handle] call CBA_fnc_removePerFrameHandler;

    _camObj setVariable ["GRAD_pilotCam_camIsOn", false, true];
    deleteVehicle _targetObject;

    if (_pilotInside) then {
      _winner = _area getVariable ["GRAD_pilotCam_winningSide", civilian];
      diag_log format ["server: successfully recorded pilot inside %1, winner is %2", _area, _winner];
      [format ["winner is %1", _winner]] remoteExec ["hint", 0];

      [_winner] call rattrap_objectives_fnc_endGame;

      missionNamespace setVariable ["GRAD_pilotCam_reasonForShutOff", "end", true];
    } else {
      diag_log format ["server: aborting filming, no pilot inside %1", _area];

      missionNamespace setVariable ["GRAD_pilotCam_reasonForShutOff", "left", true];
      GRAD_pilotCam_RECORDING_DONE = 0;
    };
	};

  // increment
	GRAD_pilotCam_RECORDING_DONE = GRAD_pilotCam_RECORDING_DONE + 1;
  publicVariable "GRAD_pilotCam_RECORDING_DONE";

}, 1, [_camObj, _targetObject, _area]] call CBA_fnc_addPerFrameHandler;
