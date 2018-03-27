/*
	
	makes AA valid targets, adds marker to them, changes marker if destroyed
	tracks incoming air vessels and reveals them to AI

	
	[3, "mrk_noFlyZone", 2500, [
		antiAir_01, 
		antiAir_02,
		antiAir_03,
		antiAir_04,
		antiAir_05,
		antiAir_06,
		antiAir_07,
		antiAir_08
	], "Air"] call grad_antiAirArea_fnc_create;
*/

params [["_accuracy", 3], "_marker", "_radius", "_arrayOfAntiAirs", "_triggerType"];

private _position = getMarkerPos _marker;
// private _antiAirMarkerArray = [];

{
	private _positionOfMarker = getPos _x;
	private _markerName = format["antiAirMarker_%1",_positionOfMarker];
	private _antiAirMarker = createMarker [_markerName, _positionOfMarker];
	_antiAirMarker setMarkerShape "ICON";
	_antiAirMarker setMarkerType "o_antiAir";
	_antiAirMarker setMarkerColor "ColorOpfor";
	_antiAirMarker setMarkerText " AA";


	((crew _x) select 0) setVariable ["grad_antiAirArea_marker", _markerName];

	((crew _x) select 0) addEventHandler ["Killed", {
		params ["_unit", "_killer"];
		private _marker = _unit getVariable ["grad_antiAirArea_marker", objNull];
		private _pos = getMarkerPos _marker;

		["AntiAir destroyed."] remoteExec ["hintSilent"];

		private _antiAirMarkerDestroyed = createMarker [format["antiAirMarkerDestroyed_%1",_pos],_pos];
		_antiAirMarkerDestroyed setMarkerShape "ICON";
		_antiAirMarkerDestroyed setMarkerType "hd_destroy";
		_antiAirMarkerDestroyed setMarkerColor "ColorOpfor";
		_antiAirMarkerDestroyed setMarkerText " AA destroyed";
	}];

	// _antiAirMarkerArray append [_antiAirMarker];

} forEach _arrayOfAntiAirs;



[{
	params ["_args", "_handle"];
	_args params ["_position", "_radius", "_arrayOfAntiAirs", "_triggerType"];

	private _unitsInArea = _position nearObjects [_triggerType, _radius];

	{
		private _detectedUnit  = _x;

	  	{
	  		if (alive _detectedUnit) then {
	  			_x reveal _detectedUnit;
	  		};
	  		// hintSilent format ["detected %1", _detectedUnit];
	  	} forEach _arrayOfAntiAirs;

	} forEach _unitsInArea;
	
}, _accuracy, [_position, _radius, _arrayOfAntiAirs, _triggerType]] call CBA_fnc_addPerFrameHandler;