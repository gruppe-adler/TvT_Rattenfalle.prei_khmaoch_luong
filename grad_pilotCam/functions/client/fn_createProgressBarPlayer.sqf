/*
#include "..\..\rscpip\defines.hpp"

disableSerialization;

// progressBar in PiP
private _progressBar = findDisplay 46 ctrlCreate ["RscProgress",-1];
_progressBar ctrlSetPosition [
	PIP_X+PIP_W/40,
	PIP_Y + PIP_H-PIP_H/15,
	PIP_W/40*37,
	PIP_H/30
];
_progressBar ctrlSetTextColor [1,0,0,1];
_progressBar progressSetPosition 0;
_progressBar ctrlCommit 0;

_progressBar

*/