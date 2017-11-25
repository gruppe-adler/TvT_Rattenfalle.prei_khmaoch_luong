params ["_trigger"];

_result = false;
_saveVariable = str _trigger + "_triggerTime";

_isAlivePilot = missionNamespace getVariable ["GRAD_pilotTracking_bodyBag", objNull] isEqualTo objNull;

if (_isAlivePilot) then {
	{
		
		if (_x in list _trigger) then {
			/* diag_log format ["guy %2 compared to list is %1", list _trigger, _x];*/

			_inTriggerSince = _x getVariable [_saveVariable, 0];

			if (_inTriggerSince > TRIGGER_ACTIVATION_TIME) then {
				_result = true;
			} else {
				_x setVariable [_saveVariable,(_inTriggerSince + 1)];
				/*diag_log format ["trigger time %1", _inTriggerSince];
				hintSilent format ["trigger time %1", _inTriggerSince];*/
			};
		} else {
			_x setVariable [_saveVariable, 0];
			/*
			diag_log format ["trigger time %1", 0];
			hintSilent format ["trigger time %1", 0];*/
		};

	} forEach CRASH_PILOTS;
} else {
	_bodyBag = missionNamespace getVariable ["GRAD_pilotTracking_bodyBag", objNull];
	
	if (_bodyBag in list _trigger) then {
		diag_log format ["bodybag %2 compared to list of  is %1", list _trigger, _bodyBag];

		_inTriggerSince = _bodyBag getVariable [_saveVariable, 0];

		if (_inTriggerSince > TRIGGER_ACTIVATION_TIME) then {
			_result = true;
		} else {
			_bodyBag setVariable [_saveVariable,_inTriggerSince + 1];
			/* diag_log format ["trigger time %1", _inTriggerSince];
			hintSilent format ["trigger time %1", _inTriggerSince];*/
		};
	} else {
		_bodyBag setVariable [_saveVariable, 0];
		/*diag_log format ["trigger time %1", 0];
		hintSilent format ["trigger time %1", 0];*/
	};
};

_result