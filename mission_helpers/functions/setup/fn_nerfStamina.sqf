params ["_isNerf"];

if (_isNerf) then {

	["staminaNerf", { 
	            0.1
	}] call ace_advanced_fatigue_fnc_addDutyFactor;

} else {
	
	["staminaNerf", { 
	            1.25
	}] call ace_advanced_fatigue_fnc_addDutyFactor;

};