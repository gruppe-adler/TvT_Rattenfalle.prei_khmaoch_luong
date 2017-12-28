params ["_object", "_dir"];

_object setVariable ["GRAD_pilotTracking_bloodDropTimestamp", CBA_missionTime, true];
_object setVariable ["GRAD_pilotTracking_bloodDropDirection", _dir];