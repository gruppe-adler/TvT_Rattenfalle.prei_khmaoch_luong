params ["_type", "_posASL", "_dir", "_bandagePosASL", "_bandageBool", "_bandageDir"];


private _blood = createSimpleObject [_type, _posASL];
_blood setDir (selectRandom [_dir, _dir-180]);
_blood setVectorUp (surfaceNormal _posASL);

if (_bandageBool) then {
	private _bandage = createSimpleObject ["MedicalGarbage_01_Bandage_F", _bandagePosASL];
	_bandage setDir _bandageDir;
};

hint "dropping blood";