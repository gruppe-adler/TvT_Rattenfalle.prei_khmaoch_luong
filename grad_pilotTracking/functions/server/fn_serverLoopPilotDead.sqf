/*

by nomisum

tracks dead pilot

*/

params ["_bodybag", "_marker"];

private ["_serverLoop"];

_serverLoop = [{
    params ["_args", "_handle"];
    _args params ["_bodybag", "_marker"];

    _marker setMarkerPos (getPos _bodybag);
   
},1,[_bodybag, _marker]] call CBA_fnc_addPerFrameHandler;