checkObjectives = true;

_bluforWinsListener = {
  if (!BLUFOR_WINS) exitWith {};
  checkObjectives = false;
  if (playerside == west || playerside == independent) then {
      ["US troops safely brought their pilot home.",true,true] call BIS_fnc_endMission;
  } else {
      ["US troops safely brought their pilot home.",false,true] call BIS_fnc_endMission;
  };
};

_opforWinsListener = {
  if (!OPFOR_WINS) exitWith {};
  checkObjectives = false;
  if (playerside == west || playerside == independent) then {
      ["Taliban captured the pilot.",false,true] call BIS_fnc_endMission;
  } else {
      ["Taliban captured the pilot.",true,true] call BIS_fnc_endMission;
  };  
};


"BLUFOR_WINS" addPublicVariableEventHandler _bluforWinsListener;
"OPFOR_WINS" addPublicVariableEventHandler _opforWinsListener;

if (!isMultiplayer) then {
    [{BLUFOR_WINS || OPFOR_WINS}, {

    if (BLUFOR_WINS) then {
        checkObjectives = false;
        diag_log format ["singleplayer: BLUFOR wins"];

        if (playerside == west || playerside == independent) then {
          ["US troops safely brought their pilot home.",true,true] call BIS_fnc_endMission;
        } else {
          ["US troops safely brought their pilot home.",false,true] call BIS_fnc_endMission;
        };

    } else {
      checkObjectives = false;
      diag_log format ["singleplayer: OPFOR wins"];

        if (playerside == west || playerside == independent) then {
          ["Taliban captured the pilot.",false,true] call BIS_fnc_endMission;
        } else {
          ["Taliban captured the pilot.",true,true] call BIS_fnc_endMission;
        }; 

    };

    }, [], 0, {}] call CBA_fnc_waitUntilAndExecute;
};