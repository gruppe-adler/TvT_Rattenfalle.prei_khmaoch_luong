/*

by nomisum

tracks dead pilot

*/

params ["_bodybag", "_marker"];


// diag_log format ["added cargo loaded events"];

[{
    params ["_args", "_handle"];
    _args params ["_bodybag", "_marker"];

    _cargoVehicle = missionNamespace getVariable ["GRAD_pilotTracking_bodyBagCargoVehicle", objNull];   

    if (!isNull _cargoVehicle) then {

        	// diag_log format ["is inside cargo of %1", _cargoVehicle];

        	if (!alive _cargoVehicle) then {

            	missionNamespace setVariable ["GRAD_pilotTracking_bodyBagCargoVehicle", objNull, true]; 

        	 		_newPos = [
                      position _cargoVehicle,
                      0,
                      40,
                      0.25,
                      0,
                      1,
                      1,
                      [],
                      []
                    ] call BIS_fnc_findSafePos;
              _newPos set [2,.1];
                    // diag_log format ["found new pos %1", _newPos];
                    
              _bodyBagReplacement = createVehicle ["Land_Bodybag_01_black_F", _newPos, [], 0, "NONE"];
              diag_log format ["new replacement bodybag %1", _bodyBagReplacement];

              // global cmd
              [_bodyBagReplacement, 1] call ace_cargo_fnc_setSize;
              // local cmd
              [_bodyBagReplacement, true, [0, 1.6, 0.26], 0] remoteExec ["ace_dragging_fnc_setDraggable", [0,-2] select isDedicated, true];
        			_bodyBagReplacement setVariable ["GRAD_pilotTracking_isCargoOf", objNull, true];
        			
              missionNamespace setVariable ["GRAD_pilotTracking_pilotTrackingObj",_bodyBagReplacement];
              missionNamespace setVariable ["GRAD_pilotTracking_bodyBag", _bodyBagReplacement, true];

              [_bodyBagReplacement, true] call grad_gpsTracker_fnc_setTarget;
              [_handle] call CBA_fnc_removePerFrameHandler;
              [_bodyBagReplacement, _marker] spawn GRAD_pilotTracking_fnc_serverLoopPilotDead;            
        };

        _marker setMarkerPos (getPos _cargoVehicle);
      } else {
        // _marker setMarkerPos (getPos _bodybag);
  };
},1,[_bodybag, _marker]] call CBA_fnc_addPerFrameHandler;