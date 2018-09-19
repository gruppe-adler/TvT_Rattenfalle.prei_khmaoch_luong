/*

    GRAD_DEATHCAM_RUNNING = true;
    [] spawn GRAD_deathcam_fnc_deathCam;
    waitUntil {!GRAD_DEATHCAM_RUNNING};

*/

#include "\z\ace\addons\main\script_component.hpp"

private _quotes = [
   ["STR_GRAD_DeathCam_Quote_J_Stalin","Joseph Stalin"],
   ["STR_GRAD_DeathCam_Quote_N_Reagan","Nancy Reagan"],
   ["STR_GRAD_DeathCam_Quote_G_Orwell","George Orwell"],
   ["STR_GRAD_DeathCam_Quote_A_Einstein","Albert Einstein"],
   ["STR_GRAD_DeathCam_Quote_G_Clemenceau","Georges Clemenceau"],
   ["STR_GRAD_DeathCam_Quote_G_Clemenceau_2","Georges Clemenceau"],
   ["STR_GRAD_DeathCam_Quote_B_Bush","Barbara Bush"],
   ["STR_GRAD_DeathCam_Quote_W_Churchill","Winston Churchill"],
   ["STR_GRAD_DeathCam_Quote_G_Washington","George Washington"],
   ["STR_GRAD_DeathCam_Quote_P_Floyd","Pink Floyd"],
   ["STR_GRAD_DeathCam_Quote_W_Somerset_Maugham","W. Somerset Maugham"],
   ["STR_GRAD_DeathCam_Quote_J_Tolkien","J.R.R. Tolkien"],
   ["STR_GRAD_DeathCam_Quote_J_Tolkien_2","J.R.R. Tolkien"],
   ["STR_GRAD_DeathCam_Quote_W_Whitman","Walt Whitman"],
   ["STR_GRAD_DeathCam_Quote_F_Meehan","Francis Meehan"],
   ["STR_GRAD_DeathCam_Quote_W_Allen","Woody Allen"],
   ["STR_GRAD_DeathCam_Quote_C_Lewis","C.S.Lewis"],
   ["STR_GRAD_DeathCam_Quote_T_Mann","Thomas Mann"],
   ["STR_GRAD_DeathCam_Quote_G_Chesterton","G. K. Chesterton"],
   ["STR_GRAD_DeathCam_Quote_M_King","Martin Luther King"],
   ["STR_GRAD_DeathCam_Quote_I_Sprichwort","Italienisches Sprichwort"],
   ["STR_GRAD_DeathCam_Quote_J_Jones","John Paul Jones"],
   ["STR_GRAD_DeathCam_Quote_J_Fitzgerald_Kennedy","John Fitzgerald Kennedy"],
   ["STR_GRAD_DeathCam_Quote_S_Dali","Salvador Dali"],
   ["STR_GRAD_DeathCam_Quote_B_Russell","Bertrand Russell"],
   ["STR_GRAD_DeathCam_Quote_E_Gibbon","Edward Gibbon"],
   ["STR_GRAD_DeathCam_Quote_D_Eisenhower","Dwight D. Eisenhower"],
   ["STR_GRAD_DeathCam_Quote_V_Sanders_Law","Vernon Sanders Law"],
   ["STR_GRAD_DeathCam_Quote_Sprichwort","Sprichwort"],
   ["STR_GRAD_DeathCam_Quote_J_Wayne","John Wayne"],
   ["STR_GRAD_DeathCam_Quote_A_Sachs","A.Sachs"],
   ["STR_GRAD_DeathCam_Quote_J_Gaultier","Jules de Gaultier"],
   ["STR_GRAD_DeathCam_Quote_W_Rogers","Will Rogers"],
   ["STR_GRAD_DeathCam_Quote_C_Sandburg","Carl Sandburg"],
   ["STR_GRAD_DeathCam_Quote_R_Lee","Robert E. Lee"],
   ["STR_GRAD_DeathCam_Quote_J_Rankin","Jeanette Rankin"],
   ["STR_GRAD_DeathCam_Quote_C_Richelieu","Cardinal Richelieu"],
   ["STR_GRAD_DeathCam_Quote_D_MacArthur","General Douglas MacArthur"],
   ["STR_GRAD_DeathCam_Quote_A_Russell","Anders Russell"],
   ["STR_GRAD_DeathCam_Quote_G_Patton","General G. C. Patton"],
   ["STR_GRAD_DeathCam_Quote_E_Harriman","Edward Harriman"],
   ["STR_GRAD_DeathCam_Quote_N_Hill","Napolean Hill"],
   ["STR_GRAD_DeathCam_Quote_L_Carroll","Lewis Carroll"],
   ["STR_GRAD_DeathCam_Quote_S_Clegane","Sandor 'The Hound' Clegane - George R.R. Martin"],
   ["STR_GRAD_DeathCam_Quote_T_Lanister","Tyrion Lannister - George R.R. Martin"],
   ["STR_GRAD_DeathCam_Quote_G_Martin","George R.R. Martin"],
   ["STR_GRAD_DeathCam_Quote_T_Lanister_2","Tyrion Lannister - George R.R. Martin"]
];


// CONFIGURE TEXTS
private _title = "<t color='#8f110a' size='3' align='center' shadow='0'>Du bist tot.</t>";
private _selectedQuote = selectRandom _quotes;
private _quote = "<t color='#f9f9f9' size='1.5' align='center' shadow='0'>" + (localize (_selectedQuote select 0)) + "</t>";
private _author = "<t color='#f9f9f9' size='1' align='right' shadow='0'>" + (_selectedQuote select 1) + "</t>";

// diag_log format ["death message is %1 from %2", _quote, _author];

// CREATE DISPLAYS FOR TEXT
createDialog "GRAD_DeathCamDisplay";
disableSerialization;
_display = uiNamespace getVariable ['GRAD_DeathCamDisplay', displayNull];
waitUntil {!isNull _display};
cutRsc ["RscStatic", "PLAIN" , 3];

private _ctrlHeadline = _display displayCtrl 7001;
_ctrlHeadline ctrlSetStructuredText parseText _title;
_ctrlHeadline ctrlSetFont "EtelkaNarrowMediumPro";
_ctrlHeadline ctrlCommit 0;

private _ctrlQuote = _display displayCtrl 7002;
_ctrlQuote ctrlSetStructuredText parseText _quote;
_ctrlQuote ctrlSetFont "EtelkaNarrowMediumPro";
_ctrlQuote ctrlCommit 0;

private _ctrlAuthor = _display displayCtrl 7003;
_ctrlAuthor ctrlSetStructuredText parseText _author;
_ctrlAuthor ctrlSetFont "EtelkaNarrowMediumPro";
_ctrlAuthor ctrlCommit 0;


// KILL MSG
private _unit = player;
private _shooter = _unit getVariable ["ACE_medical_lastDamageSource",_unit];

private _killedBy = format ["Killed by: %1", name _shooter];
systemChat _killedBy;
[_killedBy] call EFUNC(common,displayTextStructured);


// CAM STUFF
showCinemaBorder true;
playMusic "EventTrack03_F_Curator";

// GRAIN FX
private _filmgrain = ppEffectCreate ["FilmGrain",2000];
_filmgrain ppEffectEnable true;
_filmgrain ppEffectAdjust [0.3,0.3,0.12,0.12,0.12,true];
_filmgrain ppEffectCommit 0;

// CREATE CAM
_camera = "camera" camCreate (position _unit);
_camera cameraEffect ["internal","back"];
_camera camSetFov 0.4;
_camera camCommit 1;
_camera camSetTarget _unit; // target dead player
sleep 1;

_camera camSetPos [getpos _unit select 0, getpos _unit select 1,3];
_camera camSetFov 0.6;
_camera camCommit 1;
sleep 1;
_camera camSetTarget _shooter; // target killer
_camera camSetFov 0.2;
_camera camCommit 3;
sleep 5;
cutRsc ["RscStatic", "PLAIN" , 1];
sleep 1;

// END ALL EFFECTS
cutText ["", "BLACK OUT", 1];
_filmgrain ppEffectEnable false;
ppEffectDestroy _filmgrain;
_camera cameraEffect ["terminate","back"];
camDestroy _camera;
showCinemaBorder false;

GRAD_DEATHCAM_RUNNING = false;

// fade back in
sleep 1;
cutText ["", "BLACK IN", 1];
