/*

	NOT IN USE [performance]

*/


params ["_unit"];

private _select = selectRandom [0,1];
private _type = ["a3\characters_f\footstep_r.p3d", "a3\characters_f\footstep_l.p3d"] select _select;
private _where = [[0.2,0,0],[0,0.2,0]] select _select;
private _position = AGLtoASL (_unit modelToWorldVisual _where);

private _step = createSimpleObject [_type, _position];
private _direction = getDir _unit;

_step setDir _direction;

private _helper = "Sign_Sphere10cm_F" createVehicle [0,0,0];

_helper setPos (_step modelToWorldVisual [0,0,-0.11]);
_helper setObjectTextureGlobal [0,"#(argb,8,8,3)color(0,0,0,0)"];

[_helper, _direction] call GRAD_pilotTracking_fnc_addTimeStamp;