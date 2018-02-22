// side is array
// _side = [west,east,independent];
params ["_position"];

_position = [_position select 0, _position select 1];

_inner_marker_icon = createMarkerLocal [format["pilotmarker_icon_%1",_position],_position];
_inner_marker_icon setMarkerShapeLocal "ICON";
_inner_marker_icon setMarkerTypeLocal "hd_destroy";
_inner_marker_icon setMarkerColorLocal "ColorIndependent";
_inner_marker_icon setMarkerTextLocal " Crash Site";
