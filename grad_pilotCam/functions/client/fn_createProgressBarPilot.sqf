disableSerialization;
private _progressBar = findDisplay 46 ctrlCreate ["RscProgress",-1];
_progressBar ctrlSetPosition [
	safeZoneX+safeZoneW/40,
	safezoneY + safeZoneH-safeZoneH/15,
	safeZoneW/40*37,
	safeZoneH/30
];
_progressBar ctrlSetTextColor [1,0,0,1];
_progressBar progressSetPosition 0;
_progressBar ctrlCommit 0;

_progressBar
