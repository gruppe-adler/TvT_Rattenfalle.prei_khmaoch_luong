if (!(isServer)) exitWith {};

params ["_veh"];

private _type = typeOf _veh;

clearWeaponCargoGlobal _veh;
clearItemCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearBackpackCargoGlobal _veh;

if (_type isEqualTo "rhsgref_BRDM2UM_vmf" || _type isEqualTo "rhsusf_m113_usarmy_medical") then {
	_veh setVariable ["GRAD_rattrap_isMedicalVehicle", true, true];
};

if (_type isEqualTo "rhsgref_BRDM2UM_vmf") then {
	_veh setObjectTextureGlobal [0, "pic\brdm2_medic_co.paa"];
};

if (_type isEqualTo "RHS_UH1Y_UNARMED_d") then {
	[_veh] call ace_fastroping_fnc_equipFRIES;
	_veh setHitPointDamage ["HitGlass1", 1];
	_veh setHitPointDamage ["HitGlass2", 1];
	_veh disableTIEquipment true;

	[_veh, ["<t color='#66aa66'>Searchlight On", "[_target, _this, true] remoteExec ['grad_mission_helpers_fnc_toggleHeliLight', _target];", 
	"", 1, false, false, "", "_this in _target && _target turretLocal [0] && !(isLightOn _target)"]] remoteExec ["addAction", [0,-2] select isDedicated, true];

	[_veh, ["<t color='#8f1167'>Searchlight Off", "[_target, _this, false] remoteExec ['grad_mission_helpers_fnc_toggleHeliLight', _target];", 
	"", 1, false, false, "", "_this in _target && _target turretLocal [0] && (isLightOn _target)"]] remoteExec ["addAction", [0,-2] select isDedicated, true];
};

// add new respawn loop
[_veh] call GRAD_simpleVehicleRespawn_fnc_add;
