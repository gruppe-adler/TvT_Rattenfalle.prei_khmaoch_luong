disableSerialization;
private _progressBar = findDisplay 46 ctrlCreate ["RscProgress",-1];
_progressBar ctrlSetPosition [
	safezoneX,
	(safezoneX+safezoneW/40),
	safezoneY + safezoneH-(safezoneH/15),
	safezoneW/40*38,safezoneH/30
];
_progressBar ctrlSetTextColor [1,0,0,1];
_progressBar progressSetPosition 0;
_progressBar ctrlCommit 0;

_progressBar
