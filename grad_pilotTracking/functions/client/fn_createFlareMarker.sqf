params ["_position"];

if (player getVariable ["GRAD_pilotTracking_isPilot", false]) exitWith {};

// delay
sleep 80;
private _exactTime = [daytime, "HH:MM:SS:MM"] call BIS_fnc_timeToString;
private _minuteTime = [daytime,"HH:MM"] call BIS_fnc_timeToString; 
private _name = format ["mrk_pilotFlare_%1", _exactTime];

private _mrk = createMarkerLocal [_name, _position];
_mrk setMarkerShapeLocal "ICON";
_mrk setMarkerTypeLocal "hd_join";
_mrk setMarkerColorLocal "ColorYellow";
_mrk setMarkerAlphaLocal 1;
_mrk setMarkerTextLocal (" " + _minuteTime);

["flareMarker",["","Flare sighted, check your map"]] call BIS_fnc_showNotification;