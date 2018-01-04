/* creates local light point */

params ["_pos", 
	["_obj", objNull], 
	["_brightness", 0.9], 
	["_color", [255,70,0]], 
	["_ambient",[255,70,0]], 
	["_intensity",10],
	["_condition", {false}]
];

_light = "#lightpoint" createVehiclelocal _pos;

if (!isNull _obj) then {
	_light lightAttachObject [_obj,[0,0,0]];
};

_light setLightDayLight true;
_light setlightbrightness _brightness;
_light setlightcolor _color;
_light setlightambient _ambient;
_light setlightintensity _intensity;

[{
	params ["_args", "_handle"];
    _args params ["_light", "_intensity"];
	_light setlightintensity (_intensity + (random (_intensity/5)));
}, 1, [_light, _intensity]] call CBA_fnc_addPerFrameHandler;

[{_condition}, {

    deleteVehicle _light;

}, [], 0, {}] call CBA_fnc_waitUntilAndExecute;