/*
 * Author: BlackHawk
 *
 * Checks if given part of team has extracted to set area.
 * This function accounts for team starting in extraction area.
 *
 * Arguments:
 * 0: team name <string>
 * 1: extraction area marker <string>
 * 2: part of team that has to extract (0.8 - 80%, etc.) <number> (OPTIONAL)
 *
 * Return Value:
 * has team extracted <bool>
 *
 * Public: Yes
 */

params [["_team", "", [""]],
	["_marker", "", [""]],
	["_ratio", 1, [0]]
];
private _side = [_team, 1] call UO_FW_fnc_getTeamVariable;
private _count = {
	(side _x == _side) && (_x inArea _marker)
} count allUnits;

private _result = false;
if (_count >= _ratio * ([_team, 4] call UO_FW_fnc_getTeamVariable)) then {
	if (!isNil "UO_FW_hasDeparted" && {UO_FW_hasDeparted}) then {
		_result = true;
	};
} else {
	UO_FW_hasDeparted = true;
};
_result