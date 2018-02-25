// todo: implement force close wound

OXYGEN = 0.2; // reduce original OXYGEN level from ace, default 0.9
diag_log format ["putting pressure on wound, oxygen is %1", OXYGEN];


[{
    params ["_args", "_handle"];

    private _staminaInPercent = call GRAD_pilotTracking_fnc_getACEFatigue;

    if (_staminaInPercent < 10 || !GRAD_WOUND_FORCE_CLOSE) exitWith {
          [_handle] call CBA_fnc_removePerFrameHandler;

          GRAD_WOUND_FORCE_CLOSE = false;
          publicVariable "GRAD_WOUND_FORCE_CLOSE";
          OXYGEN = 0.9;
    };

}, 1, []] call CBA_fnc_addPerFrameHandler;
