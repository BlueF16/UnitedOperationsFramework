/*
 * Author: Olsen
 *
 * Counts units on set side in area of set diameter around object.
 *
 * Arguments:
 * 0: side <side>
 * 1: radious <number>
 * 2: center of area <object>
 *
 * Return Value:
 * amount of units in area <number>
 *
 * Public: Yes
 */

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params [["_side", sideUnknown, [sideUnknown]],["_radius", 0, [0]],["_logic", objNull, [objNull]],["_noUntracked", false]];
private _count = 0;

{
    if ((side _x isEqualto _side) && {(!(_x getVariable ["UO_FW_DontTrack", false]) || !_noUntracked)} && {((_x distance _logic) < _radius)} && {(_x call UO_FW_fnc_Alive)}) then {
        _count = _count + 1;
    };
} forEach allUnits;

_count
