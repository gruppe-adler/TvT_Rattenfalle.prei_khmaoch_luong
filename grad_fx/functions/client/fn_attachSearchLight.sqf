params ["_vehicle"];

private _searchLight = createSimpleObject ["A3\data_f\VolumeLight_searchLight.p3d", position _vehicle]; 

private _gunBeg = "gun_begin"; // getText (configfile >> "CfgVehicles" >> (typeOf _vehicle) >> "Turrets" >> "CopilotTurret" >> "gun_begin");
private _gunEnd = "gun_end"; // getText (configfile >> "CfgVehicles" >> (typeOf _vehicle) >> "Turrets" >> "CopilotTurret" >> "gun_end");

_searchLight attachTo [_vehicle, [0,0,-0.1], _gunBeg];

[{
    params ["_args", "_handle"];
    _args params ["_vehicle", "_searchLight", "_gunBeg", "_gunEnd"];

    // only execute global commands when necessary
    if (!(isLightOn _vehicle)) then {
        if (!(isObjectHidden _searchLight)) then {
            _searchLight hideObjectGlobal true;
        };
    } else {
        if (isObjectHidden _searchLight) then {
            _searchLight hideObjectGlobal false;
        };
    };
    private _posBeg = _vehicle selectionPosition _gunBeg;
    private _posEnd = _vehicle selectionPosition _gunEnd;
    private _dirVector = [_posBeg, _posEnd] call BIS_fnc_vectorFromXToY;

    systemChat format ["%1 , %2 , %3", _posBeg, _posEnd, _dirVector];
    // hintSilent format ["%1",_dirVector];
    private _ele = asin (_dirVector select 2);
    private _dir = (_dirVector select 0) atan2 (_dirVector select 1);
    private _upVector = [0, (_dirVector select 2), -1 * (((cos _dir) * (_dirVector select 1)) + ((sin _dir) * (_dirVector select 0)))];

    
    //[_searchLightectToAttach,_dirVector select 0] call rotateObjectZ;
    private _newValue = ([_searchLight,_dir+180,-_ele,0] call GRAD_fx_fnc_convertVectorToDir);

    if (!(_newValue isEqualTo (_searchLight getVariable ["SearchLightRotationValue", []]))) then {
        _searchLight setVectorDirAndUp _newValue;
        _searchLight setVariable ["SearchLightRotationValue", _newValue];
        // systemChat "Drehung";
    } else {
        // systemChat "KEINE Drehung";
    };

 }, 0, [_vehicle,_searchLight,_gunBeg,_gunEnd]] call CBA_fnc_addPerFrameHandler;