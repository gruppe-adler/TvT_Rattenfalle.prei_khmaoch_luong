#include "\z\ace\addons\main\script_component.hpp"

private _hint = format ["Putting pressure on wound. Bleeding temporarily stopped."];
[_hint] call EFUNC(common,displayTextStructured);


// pressing wound drains ACE fatigue
["GRAD_pilotTracking_pressingWound", { 
            2
}] call ace_advanced_fatigue_fnc_addDutyFactor;


[{
    params ["_args", "_handle"];

    private _staminaInPercent = call GRAD_pilotTracking_fnc_getFatigue;

    if (_staminaInPercent < 10 || !GRAD_WOUND_FORCE_CLOSE) exitWith {
          [_handle] call CBA_fnc_removePerFrameHandler;

          // remove ACE fatigue penalty
          ["GRAD_pilotTracking_pressingWound"] call ace_advanced_fatigue_fnc_removeDutyFactor;

          GRAD_WOUND_FORCE_CLOSE = false;
          publicVariable "GRAD_WOUND_FORCE_CLOSE";

          private _hint = format ["Releasing pressure on wound."];
          [_hint] call EFUNC(common,displayTextStructured);
    };

    private _hint = format ["Putting pressure on wound. Bleeding temporarily stopped."];
    [_hint] call EFUNC(common,displayTextStructured);

}, 1, []] call CBA_fnc_addPerFrameHandler;