player setVariable ["GRAD_pilotTracking_bonesBroken", true, true];
player setVariable ["GRAD_pilotTracking_isBleeding", true];

player setHit ["legs", 0.5];
player sideChat "Ouch, my leg is broken.";