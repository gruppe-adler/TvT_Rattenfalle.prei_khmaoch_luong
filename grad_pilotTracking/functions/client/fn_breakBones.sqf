params ["_unit"];
// _unit is usually player, but abstract here for testing with AI

_unit setVariable ["GRAD_pilotTracking_bonesBroken", true, true];
_unit setVariable ["GRAD_pilotTracking_isBleeding", true];

_unit setHit ["legs", 0.5];
_unit sideChat "Ouch, my leg is broken.";

[_unit, "GRAD_pilotTrackingBreakBones"] remoteExec ["say3D", [0,-2] select isDedicated];

_unit playmovenow "amovppnemstpsnonwnondnon";

_unit addEventHandler ["AnimDone", {
	(_this select 0) switchMove "Acts_CivilInjuredLegs_1";
	(_this select 0) removeAllEventHandlers "AnimDone";

	(_this select 0) addEventHandler ["AnimDone", {
		(_this select 0) switchmove "ApanPpneMstpSnonWnonDnon_ApanPercMstpSnonWnonDnon";
		(_this select 0) removeAllEventHandlers "AnimDone";

		(_this select 0) addEventHandler ["AnimDone", {
			(_this select 0) switchmove "";
			(_this select 0) removeAllEventHandlers "AnimDone";
		}];
	}];
}];