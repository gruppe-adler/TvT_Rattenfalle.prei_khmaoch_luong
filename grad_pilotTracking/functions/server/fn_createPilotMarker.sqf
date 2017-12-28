params ["_unit"];

_string = format ["mrk_pilot_%1", name _unit];

_marker = createMarker [_string, [0, 0, 0]];
_string setMarkerType "mil_circle";
_string setMarkerColor "ColorRed";
_string setMarkerAlpha 0;
_marker setMarkerText "Pilot (last transmit)";

_marker