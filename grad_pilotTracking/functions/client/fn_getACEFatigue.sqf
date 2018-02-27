/*

  gives back ACE stamina in percent

*/


private _staminaBarContainer = uiNamespace getVariable ["ace_advanced_fatigue_staminaBarContainer", controlNull];

if (isNull _staminaBarContainer) exitWith { 100 };
private _posAndSize = ctrlPosition _staminaBarContainer;
private _staminaBarContainerWidth = 10 * (((safezoneW / safezoneH) min 1.2) / 40); // ace_advanced_fatigue_staminaBarWidth;
private _staminaInPercent = (_posAndSize select 2/_staminaBarContainerWidth) * 100;

_staminaInPercent