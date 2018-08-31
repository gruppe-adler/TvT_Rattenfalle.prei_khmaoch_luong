params ["_position"];

// delay
sleep 60;
private _exactTime = [daytime, "HH:MM:SS:MM"] call BIS_fnc_timeToString;
private _minuteTime = [daytime,"HH:MM"] call BIS_fnc_timeToString; 
private _name = format ["mrk_pilotFlare_%1", _exactTime];

private _mrk = createMarkerLocal [_name, _position];
_mrk setMarkerShapeLocal "ICON";
_mrk setMarkerTypeLocal "hd_join";
_mrk setMarkerColorLocal "ColorYellow";
_mrk setMarkerAlphaLocal 1;
_mrk setMarkerTextLocal (" " + _minuteTime);
