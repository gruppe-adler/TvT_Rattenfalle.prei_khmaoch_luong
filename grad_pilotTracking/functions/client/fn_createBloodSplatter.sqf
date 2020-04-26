params ["_type", "_posASL", "_dir"];


// local, but on every client

private _blood = objNull;

_posASL set [2,0];

if (player getVariable ["GRAD_pilotTracking_isScout", false]) then {
	_blood = (_type select 0) createVehicleLocal _posASL;
	_blood setPos _posASL;
} else {
	_blood = (_type select 1) createVehicleLocal _posASL;
	_blood setPos _posASL;
};


_blood setDir _dir;
_blood setVectorUp (surfaceNormal _posASL);

_blood setVariable ["GRAD_pilotTracking_bloodDropTimestamp", CBA_missionTime];
_blood setVariable ["GRAD_pilotTracking_bloodDropDirection", _dir];

// hint "dropping blood";
