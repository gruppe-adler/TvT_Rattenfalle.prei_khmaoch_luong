params ["_unit", "_blood"];

private _timestamp = _blood getVariable ["GRAD_pilotTracking_bloodDropTimestamp",-1];
private _delta = CBA_missionTime - _timestamp;

if (_timestamp < 0) exitWith { hint "can't read this blood"; };

if (_delta > 30*60) then {
    hint "This trace is really old. More than 30 mins."
} else {
  if (_delta <= 30*60 && _delta > 20*60) then {
      hint "This trace is between 20 and 30 mins old."
  } else {
    if (_delta <= 20*60 && _delta > 15*60) then {
        hint "This trace is between 15 and 20 mins old."
    } else {
      if (_delta <= 15*60 && _delta > 10*60) then {
          hint "This trace is between 10 and 15 mins old."
      } else {
        if (_delta <= 10*60 && _delta > 5*60) then {
            hint "This trace is between 5 and 10 mins old."
        } else {
          if (_delta <= 5*60 && _delta > 2*60) then {
              hint "This trace is between 2 and 5 mins old."
          } else {
              hint "This trace is really fresh, less than 2 mins."
          };
        };
      };
    };
  };
};
