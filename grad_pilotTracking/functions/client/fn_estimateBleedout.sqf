#include "\z\ace\addons\main\script_component.hpp"

params ["_unit"];

private _boneBroken = _unit getVariable ["GRAD_pilotTracking_bonesBroken", false];
private _estimatedBleedout = GRAD_pilotTracking_missionTime - GRAD_pilotTracking_progress;
private _legStatus = "not broken";
private _bleedoutStatus = "";

if (_boneBroken) then {
    _legStatus = "broken";
};

if (_estimatedBleedout > 0 && _boneBroken) then {
    _bleedoutStatus = format ["Will bleed out in %1 min.", floor (_estimatedBleedout/60)];
};

private _output = format ["%1s leg is %2. %3", _unit, _legStatus, _bleedoutStatus];
[_output] call EFUNC(common,displayTextStructured);
