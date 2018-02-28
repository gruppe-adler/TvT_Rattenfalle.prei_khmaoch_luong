/*

  gives back stamina in percent

*/

#define AN_MAXRESERVE 2300

private _staminaInPercent = (ace_advanced_fatigue_anReserve / AN_MAXRESERVE) * 100;

_staminaInPercent