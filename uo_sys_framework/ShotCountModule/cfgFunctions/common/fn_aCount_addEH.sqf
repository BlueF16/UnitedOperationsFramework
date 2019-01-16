/*	Description: Adds Shot Count EH
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		TinfoilHate & PiZZADOX
 */

#define COMPONENT ShotCount
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

if !(UO_FW_Server_ShotCountModule_Allowed) exitwith {};
if (!(missionNamespace getVariable ["UO_FW_ShotCount_Enabled",false])) exitwith {};
["Shot Count", "Count shots fired by units", "Beta, TinfoilHate, PiZZADOX and Sacher"] call UO_FW_fnc_RegisterModule;

params ["_obj"];

if !((_obj getVariable ["UO_FW_aCount_firedEh", ""]) isEqualto "") exitWith {};
_obj setVariable ["UO_FW_aCount_originalSide",side _obj];

if (_obj isKindOf "Man") then {
	private _firedEHhandle = _obj addEventHandler ["fired", {
		if ((isPlayer (_this select 0)) && {MissionNamespace getvariable ["UO_FW_ND_Active",false]}) then {
			if (((_this select 0) getvariable ["UO_FW_ND_EHid",""]) isEqualto "DISABLED") then {
				["UO_FW_ShotCount_EH_Event", [side (_this select 0),(_this select 5)]] call CBA_fnc_serverEvent;
			} else {
				false;
			};
		} else {
			["UO_FW_ShotCount_EH_Event", [side (_this select 0),(_this select 5)]] call CBA_fnc_serverEvent;
		};
	}];
	_obj setVariable ["UO_FW_aCount_firedEh", _firedEHhandle];
} else {
	private _firedEHhandle = _obj addEventHandler ["fired",  {
		["UO_FW_ShotCount_EH_Event", [side (_this select 0),(_this select 5)]] call CBA_fnc_serverEvent;
	}];
	if !(count crew _obj isEqualto 0) then {
		{
			_x setVariable ["UO_FW_aCount_firedEh", _firedEHhandle];
			_x setVariable ["UO_FW_aCount_originalSide",(side _obj)];
		} forEach crew _obj;
	};
	_obj setVariable ["UO_FW_aCount_firedEh", _firedEHhandle];
};