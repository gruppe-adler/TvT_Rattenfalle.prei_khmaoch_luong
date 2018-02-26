#include "\z\ace\addons\main\script_component.hpp"

OXYGEN = 0.2; // reduce original OXYGEN level from ace, default 0.9

private _hint = format ["Putting pressure on wound. Bleeding temporarily stopped."];
[_hint] call EFUNC(common,displayTextStructured);

[{
    params ["_args", "_handle"];

    private _staminaInPercent = call GRAD_pilotTracking_fnc_getACEFatigue;

    if (_staminaInPercent < 10 || !GRAD_WOUND_FORCE_CLOSE) exitWith {
          [_handle] call CBA_fnc_removePerFrameHandler;

          GRAD_WOUND_FORCE_CLOSE = false;
          publicVariable "GRAD_WOUND_FORCE_CLOSE";
          OXYGEN = 0.9;

          private _hint = format ["Releasing pressure on wound."];
          [_hint] call EFUNC(common,displayTextStructured);
    };



}, 1, []] call CBA_fnc_addPerFrameHandler;
