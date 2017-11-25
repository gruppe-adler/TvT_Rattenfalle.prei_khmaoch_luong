private ["_bar"];

params ["_bar", "_value"];

disableSerialization;
/* diag_log format ["bar is %1, value is %2", _bar, _value];*/
_bar progressSetPosition _value;
_bar ctrlCommit 0;