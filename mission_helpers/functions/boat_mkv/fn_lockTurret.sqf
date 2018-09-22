if (!(isServer)) exitWith {};

params ["_vehicle"];

// locks MK19
_vehicle lockTurret [[0], true];
_vehicle setObjectTextureGlobal [2, ""];