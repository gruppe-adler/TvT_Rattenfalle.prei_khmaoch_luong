/*

  gives back ACE stamina in percent

*/

private _staminaBarContainer = uiNamespace getVariable ["ace_advanced_fatigue_staminaBarContainer", controlNull];
private _posAndSize = ctrlPosition _staminaBarContainer;
private _staminaBarContainerWidth = ace_advanced_fatigue_staminaBarWidth;
private _staminaInPercent = (_posAndSize select 2/_staminaBarContainerWidth) * 100;


_staminaInPercent
