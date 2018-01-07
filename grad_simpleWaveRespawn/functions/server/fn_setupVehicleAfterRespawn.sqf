params ["_veh"];

private _type = typeOf _veh;

clearWeaponCargoGlobal _veh;
clearItemCargoGlobal _veh;
clearMagazineCargoGlobal _veh; 
clearBackpackCargoGlobal _veh;

if (_type isEqualTo "rhsgref_BRDM2UM_vmf" || _type isEqualTo "") then {
	_veh setVariable ["GRAD_rattrap_isMedicalVehicle", true, true];
};

_veh setVariable ["RHS_Decal_Enabled", false, true];

if (_type isEqualTo "rhsgref_BRDM2UM_vmf") then {
	_veh setObjectTextureGlobal [0, "pic\brdm2_medic_co.paa"]; 
};