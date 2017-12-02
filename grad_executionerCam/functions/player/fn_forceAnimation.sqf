params ["_unit"];

_unit playMoveNow "Acts_ExecutionVictim_Loop";

_unit addEventHandler ["AnimDone", {
	(_this select 0) playMoveNow (_this select 1);
}];