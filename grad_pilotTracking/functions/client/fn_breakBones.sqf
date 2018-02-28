params ["_unit"];
// _unit is usually player, but abstract here for testing with AI

_unit setVariable ["GRAD_pilotTracking_bonesBroken", true, true];
_unit setVariable ["GRAD_pilotTracking_isBleeding", true];

_unit setHit ["legs", 0.5];
_unit sideChat "Ouch, my leg is broken.";
["GRAD_pilotTrackingBreakBones"] remoteExec ["say3D", [0,-2] select isDedicated];