/* by mcdiod */

_this spawn {
    params ["_target",["_timeout",10],["_radius",50],["_angle",180],["_altitude",15],["_dir",0],["_commitTime",0.1],["_showCinemaBorder",false]];
 
    cutText ["", "PLAIN", 3];

    mcd_rotateCamRunning = true;

    [
        [
            ["CRASH SITE","<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t align = 'center'  color='#59ffffff' shadow = '0' size = '1.5' font='EtelkaNarrowMediumPro'>%1</t><br/>",25],
            ["before dawn","<t align = 'center' color='#33ffffff' shadow = '0' size = '0.5'>%1</t>",50]
        ]
    ] spawn BIS_fnc_typeText;
    
 
    _coords = _target getPos [_radius,_angle];
    _targetPos = if (_target isEqualType []) then {_target} else {getPos _target};
    _heightASL = (getTerrainHeightASL _targetPos) + _altitude;
 
    _coords set [2, _altitude];
    _camera = "camera" camCreate _coords;
    _camera cameraEffect ["Internal","BACK"];
    showCinemaBorder _showCinemaBorder;
    _camera camPrepareFOV 0.700;
    _camera camPrepareTarget _target;
    _camera camCommitPrepared 0;

    [_timeout] spawn {
        params ["_timeout"];
        [{mcd_rotateCamRunning = false;}, [], _timeout] call CBA_fnc_waitAndExecute;
    };
 
    while {mcd_rotateCamRunning} do {
        _coords = _target getPos [_radius,_angle];
        _coords set [2, _heightASL];
        _coords = ASLToATL _coords;
 
        _camera camPreparePos _coords;
        _camera camCommitPrepared _commitTime;

        waitUntil {camCommitted _camera || !(mcd_rotateCamRunning)};
 
        _angle = if (_dir == 0) then {_angle - 1} else {_angle + 1};
    };

    _camera cameraEffect ["terminate","back"];
    camDestroy _camera;

    1 fadesound 1;

    cutRsc ["RscStatic", "PLAIN" , 3];

    [
        [
            ["YOUR BASE","<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t align = 'center'  color='#59ffffff' shadow = '0' size = '1.5' font='EtelkaNarrowMediumPro'>%1</t><br/>",25],
            ["setup and go","<t align = 'center' color='#33ffffff' shadow = '0' size = '0.5'>%1</t>",50]
        ]
    ] spawn BIS_fnc_typeText;

};