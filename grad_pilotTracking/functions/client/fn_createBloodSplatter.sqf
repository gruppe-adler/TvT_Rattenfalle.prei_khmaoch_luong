params ["_type", "_posASL", "_dir", "_bandagePosASL", "_bandageBool", "_bandageDir"];

// local, but on every client

private _blood = objNull;

_posASL set [2,0];
_bandagePosASL set [2,0];

if (player getVariable ["GRAD_pilotTracking_isHunter", false]) then {
	_blood = (_type select 0) createVehicleLocal _posASL;
	_blood setPos _posASL;
} else {
	_blood = (_type select 1) createVehicleLocal _posASL;
	_blood setPos _posASL;
};

/*
_helperObject = createSimpleObject ["Sign_Sphere10cm_F", _posASL];
_helperObject setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,0)"];
_helperObject setVariable ["GRAD_pilotTracking_bloodDropTimestamp", CBA_missionTime];
*/

_blood setDir (selectRandom [_dir, _dir-180]);
_blood setVectorUp (surfaceNormal _posASL);

_blood setVariable ["GRAD_pilotTracking_bloodDropTimestamp", CBA_missionTime];

if (_bandageBool) then {
	private _bandage = "MedicalGarbage_01_Bandage_F" createVehicleLocal _bandagePosASL;
	_bandage setDir _bandageDir;
};


// hint "dropping blood";
