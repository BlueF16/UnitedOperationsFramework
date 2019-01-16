/*
 * Author: PiZZADOX
 *
 * Checks and adds debug message
 *
 * Arguments:
 * 0: message <string>
 *
 * Return Value:
 * nothing
 *
 * Public: No
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"

if (!UO_FW_Server_Framework_Allowed || !UO_FW_Server_DEBUG_Allowed) exitWith {};
private _message = _this;

if (isNil "UO_FW_DebugMessages") then {UO_FW_DebugMessages = [];};

if (missionNamespace getvariable ["UO_FW_Debug_Logs",false]) then {
	diag_log _message;
};

if (!(_message in UO_FW_DebugMessages)) then {
	UO_FW_DebugMessages pushback _message;
};

if (isNull (uiNamespace getVariable ["UO_FW_Debug_Control",displaynull])) then {
	[_message] spawn {
		params ["_message"];
		sleep 0.1;
		100 cutRsc ["UO_FW_DIA_DEBUG", "PLAIN"];
		waituntil {!(isNull (uiNamespace getVariable ["UO_FW_Debug_Control",displaynull]))};
		[] call UO_FW_fnc_refreshDebug;
		sleep 30;
		UO_FW_DebugMessages = UO_FW_DebugMessages - [_message];
		sleep 0.1;
		[] call UO_FW_fnc_refreshDebug;
	};
} else {
	[_message] spawn {
		params ["_message"];
		sleep 0.1;
		[] call UO_FW_fnc_refreshDebug;
		sleep 30;
		UO_FW_DebugMessages = UO_FW_DebugMessages - [_message];
		sleep 0.1;
		[] call UO_FW_fnc_refreshDebug;
	};
};