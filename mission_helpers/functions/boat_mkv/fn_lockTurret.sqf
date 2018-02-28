if (!(isServer)) exitWith {};

params ["_vehicle"];

// locks MK19
_vehicle lockTurret [[3], true];