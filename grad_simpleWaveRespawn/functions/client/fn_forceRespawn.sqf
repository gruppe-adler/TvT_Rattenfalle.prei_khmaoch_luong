if (!hasInterface) exitWith {};
if (player getVariable ["GRAD_simpleWaveRespawn_respawnCount", 0] > GRAD_SIMPLEWAVERESPAWN_COUNT_MAX) exitWith {
		diag_log format ["cant respawn, max respawns reached"];
};

player setVariable ["GRAD_simpleWaveRespawn_respawning", true];
setPlayerRespawnTime 0;
forceRespawn player;

[false] call ace_spectator_fnc_setSpectator;
[player, false] call TFAR_fnc_forceSpectator;
// 60 call TFAR_fnc_setVoiceVolume; // reset voice volume

[{
	alive player
}, {
	setPlayerRespawnTime 999999;
	private _count = player getVariable ["GRAD_simpleWaveRespawn_respawnCount", 0];
	player setVariable ["GRAD_simpleWaveRespawn_respawnCount", (_count + 1)];
	player setVariable ["GRAD_simpleWaveRespawn_respawning", false];
	player setVariable ["GRAD_pilotTracking_isWaitingForRespawn", false, true];

	if (player getVariable ["GRAD_pilotTracking_wasPilot", false]) then {
		player setPos getMarkerPos "mrk_spawn_blufor_1";

		diag_log format ["player respawning is pilot"];

		// wait a bit to workaround grad loadout triggering after this
		[] spawn {
			sleep 1;
			player setUnitLoadout [
				["rhs_weap_hk416d10_grip3","","acc_flashlight","rhsusf_acc_compm4",
				["30Rnd_556x45_Stanag_Tracer_Red",30],[],"rhsusf_acc_grip3"],[],["rhsusf_weap_glock17g4","rhsusf_acc_omega9k","","",
				["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["rhs_uniform_g3_blk",[["ACE_MapTools",1],["ACE_CableTie",2],
				["ACE_fieldDressing",10],["ACE_morphine",4],["ACE_epinephrine",1],["ACE_key_west",1],["ACE_Flashlight_MX991",1],
				["ACE_bodyBag",1],["ACE_acc_pointer_green",1],["rhsusf_mag_17Rnd_9x19_FMJ",1,17],
				["ACE_Chemlight_HiRed",2,1]]],[],["B_ViperLightHarness_blk_F",[["ACE_IR_Strobe_Item",1],
				["HandGrenade",2,1],["SmokeShell",2,1],["30Rnd_556x45_Stanag_Tracer_Red",10,30]]],"rhsusf_hgu56p_black","",
				["ACE_Vector","","","",[],[],""],
				["ItemMap","ItemGPS","tf_anprc152_2","ItemCompass","ACE_Altimeter","ACE_NVG_Wide"]
			]; // todo add loadout for blufor rifleman
		};
	};

}, []] call CBA_fnc_waitUntilAndExecute;