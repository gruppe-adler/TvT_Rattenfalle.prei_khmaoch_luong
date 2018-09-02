params ["_obj","_dir","_ang","_pit"];

private ["_vecdx","_vecdy","_vecdz","_vecux","_vecuy","_vecuz"];

_vecdx = sin(_dir) * cos(_ang);
_vecdy = cos(_dir) * cos(_ang);
_vecdz = sin(_ang);

_vecux = cos(_dir) * cos(_ang) * sin(_pit);
_vecuy = sin(_dir) * cos(_ang) * sin(_pit);
_vecuz = cos(_ang) * cos(_pit);

[[_vecdx,_vecdy,_vecdz],[_vecux,_vecuy,_vecuz]]