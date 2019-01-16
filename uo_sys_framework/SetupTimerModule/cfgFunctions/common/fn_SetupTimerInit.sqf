#include "\A3\ui_f\hpp\defineResinclDesign.inc"

params ["_display"];

[{!(displayNull isEqualto _this)}, {
	private _SetupTimerPFHhandle = [{
		params ["_argNested", "_idPFH"];
		_argNested params ["_endTime","_nextBeep","_colorSet","_display"];
		private _ctrlTime = _display displayCtrl 1003;
		private _timeLeft = (_endTime - CBA_missionTime);

		if (_timeLeft <= 0) exitWith {
			_ctrlTime ctrlSetText "00:00.000";
			["UO_FW_SetupTimerEnded"] call BIS_fnc_showNotification;
			[_idPFH] call CBA_fnc_removePerFrameHandler;
			[{
				params ["_display"];
				_display closeDisplay 1;
			}, [_display], 3] call CBA_fnc_waitAndExecute;
		};

		if (CBA_missionTime >= _nextBeep) then {
			playSound "Beep_Target";
			_nextBeep = (_nextBeep + 1);
			_argNested set [1,_nextBeep];
		};

		if (_timeLeft <= 30) then {
			if (_timeLeft <= 10) then {
				_argNested set [2,["IGUI","ERROR_RGB"]];
			} else {
				_argNested set [2,["IGUI","WARNING_RGB"]];
			}
		};

		private _color = _colorSet call bis_fnc_displaycolorget;
		_ctrlTime ctrlSetTextColor _color;
		_ctrlTime ctrlSetText ([_timeLeft,"MM:SS.MS"] call bis_fnc_secondsToString);

	}, 0, [(CBA_missionTime + (missionNamespace getVariable ["UO_FW_SetupTimer_WaitTime", 30])),((CBA_missionTime + _endTime) - 10),["IGUI","TEXT_RGB"],_this]] call CBA_fnc_addPerFrameHandler;
}, _display] call CBA_fnc_waitUntilAndExecute;
