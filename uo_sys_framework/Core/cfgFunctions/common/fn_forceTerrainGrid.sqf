/*
 * Author: BlackHawk
 *
 * Force terrain grid to prevent far away objects from appearing as floating.
 * Useful for mission with long engagement ranges.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Public: Yes
 */

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

FW_terrainGridPFH_handle = [{
    if (CBA_missionTime > 0 && {getTerrainGrid != 2}) then {
        setTerrainGrid 2;
    };
}, 1] call CBA_fnc_addPerFrameHandler;
