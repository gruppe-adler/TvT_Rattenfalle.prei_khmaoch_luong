params ["_isNerf"];

if (_isNerf) then {

	["staminaNerf", { 
	            0.2
	}] call ace_advanced_fatigue_fnc_addDutyFactor;

} else {
	
	["staminaNerf", { 
	            2.5
	}] call ace_advanced_fatigue_fnc_addDutyFactor;

};