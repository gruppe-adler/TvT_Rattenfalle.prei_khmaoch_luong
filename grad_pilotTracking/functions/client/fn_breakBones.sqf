params ["_unit"];
// _unit is usually player, but abstract here for testing with AI

_unit setVariable ["GRAD_pilotTracking_bonesBroken", true, true];

_unit setHit ["legs", 0.5];
_unit sideChat "Ouch, my leg is broken.";

[_unit, "GRAD_pilotTrackingBreakBones"] remoteExec ["say3D", [0,-2] select isDedicated];

_unit playmovenow "amovppnemstpsnonwnondnon";

_unit addEventHandler ["AnimDone", {
	[(_this select 0), "Acts_CivilInjuredLegs_1"] remoteExec ["switchmove", [0, -2] select isDedicated];
	(_this select 0) removeAllEventHandlers "AnimDone";

	(_this select 0) addEventHandler ["AnimDone", {
		[(_this select 0), "ApanPpneMstpSnonWnonDnon_ApanPercMstpSnonWnonDnon"] remoteExec ["switchmove", [0, -2] select isDedicated];
		(_this select 0) removeAllEventHandlers "AnimDone";

		(_this select 0) addEventHandler ["AnimDone", {
			[(_this select 0), ""] remoteExec ["switchmove", [0, -2] select isDedicated];
			(_this select 0) removeAllEventHandlers "AnimDone";
		}];
	}];
}];