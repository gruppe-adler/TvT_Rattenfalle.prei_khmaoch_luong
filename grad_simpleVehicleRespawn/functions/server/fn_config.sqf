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
};


// add new respawn loop
[_veh] call GRAD_simpleVehicleRespawn_fnc_add;
