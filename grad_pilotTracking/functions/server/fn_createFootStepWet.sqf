params ["_unit"];

private _position = AGLtoASL (_unit modelToWorldVisual (selectRandom [[0,0.2,0],[0.2,0,0]]));

private _step = createSimpleObject [selectRandom 
	[
	"blud_cords\blud_minipytt_01.p3d", 
	"blud_cords\blud_minipytt_02.p3d",
	"blud_cords\blud_minipytt_03.p3d", 
	"blud_cords\blud_minipytt_04.p3d"
	], _position
];

_step setDir (getDir _unit);

private _helper = "Sign_Sphere10cm_F" createVehicle [0,0,0];

_helper setPos (_step modelToWorldVisual [0,0,-0.11]);
_helper setObjectTextureGlobal [0,"#(argb,8,8,3)color(0,0,0,0)"];

[_helper] call GRAD_pilotTracking_fnc_addTimeStamp;