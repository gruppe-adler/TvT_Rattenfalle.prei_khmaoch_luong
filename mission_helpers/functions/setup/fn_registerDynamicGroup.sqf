/*
[this, 'Command'] call mission_helpers_fnc_registerDynamicGroup;
*/

params ["_unit", "_groupCallsign"];

if (isServer) then {

    private _group  = group _unit;
    private _leader = leader _group;
    _data   = [nil, _groupCallsign, false]; // [<Insignia>, <Group Name>, <Private>]

    [{
        !(isNil "BIS_dg_ini")
    },
    {
        params ["_group", "_leader", "_data"];
        ["RegisterGroup", [_group, _leader, _data]] call BIS_fnc_dynamicGroups;
    },
    [_group, _leader, _data]] call CBA_fnc_waitUntilAndExecute;
};
