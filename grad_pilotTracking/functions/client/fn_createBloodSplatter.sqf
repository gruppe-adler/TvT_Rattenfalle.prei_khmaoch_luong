params ["_type", "_posASL", "_dir", "_bandagePosASL", "_bandageBool", "_bandageDir"];

private _blood = objNull;

if (player getVariable ["GRAD_pilotTracking_isHunter", false]) then {
	_blood = createSimpleObject [_type select 0, _posASL];
} else {
	_blood = createSimpleObject [_type select 1, _posASL];
};

_blood setDir (selectRandom [_dir, _dir-180]);
_blood setVectorUp (surfaceNormal _posASL);

_blood setVariable ["GRAD_pilotTracking_bloodDropTimestamp", CBA_missionTime];

if (_bandageBool) then {
	private _bandage = createSimpleObject ["MedicalGarbage_01_Bandage_F", _bandagePosASL];
	_bandage setDir _bandageDir;
};

hint "dropping blood";
