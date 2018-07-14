#include "..\..\Global\defs.hpp"
_handle = _this spawn
	{
		private _unit = _this select 0;
		private _startPoint = _this select 1;
		private _endPoint = _this select 2;
		private	_burstCount = _this select 3;
		private	_burstSize = _this select 4;
		private	_burstWait = _this select 5;
		private	_minSpottedDistance = _this select 6;
		private	_roundType = _this select 7;
		private	_fireRate = _unit call UO_FW_FNC_ArtGetFireRate;
		private _roundClassName = ((_unit call UO_FW_FNC_GetArtyAmmo) select _roundType) select 0 ;

		[_unit , true] call UO_FW_FNC_SetArtyReadyStatus;
		_unit setVariable [VAR_SART_ARTFMTEXT,_this call UO_FW_FNC_GetPointFiremissionText,true];
		[_unit, 0,_burstCount * _burstSize] call UO_FW_FNC_SetArtyFiremissionRoundsRequired;
		[_unit,_startPoint,_roundClassName ] call UO_FW_FNC_InternalSpottingFiremission;
		//spotting rounds finished
		sleep( (_unit getVariable [VAR_SART_ARTCALCSPEED,MEANCALCULATIONTIME]) + 1);
		private	_dir = _endPoint vectorDiff  _startPoint;
		_dir = _dir vectorMultiply (1 /_burstCount);
		private _isForward = true;
		for "_i" from 0 to _burstCount do
		{
			if(_isForward) then
			{
					[_unit,_startPoint vectorAdd (_dir vectorMultiply (_i / 2)),0,_burstSize,_roundClassName] call UO_FW_FNC_InternalFiremission;
					[_unit, ((_unit getVariable [VAR_SART_ARTROUNDSFIRED,[0,0]]) select 0) + _burstSize,_burstCount * _burstSize] call UO_FW_FNC_SetArtyFiremissionRoundsRequired;
					_isForward = false;
			}
			else
			{

					[_unit,_startPoint vectorAdd (_dir vectorMultiply ((_burstCount - _i) / 2)),0,_burstSize,_roundClassName] call UO_FW_FNC_InternalFiremission;
					[_unit, ((_unit getVariable [VAR_SART_ARTROUNDSFIRED,[0,0]]) select 0) + _burstSize,_burstCount * _burstSize] call UO_FW_FNC_SetArtyFiremissionRoundsRequired;
					_isForward = true;
			};

					sleep(((_fireRate * (_unit getVariable [VAR_SART_ARTFIRERATE,MEANFIRERATE]) ) * _burstSize) max _burstWait);
		};
		[_unit,objNULL] call UO_FW_FNC_SetArtyCaller;
		[_unit, false] call UO_FW_FNC_SetArtyReadyStatus;
		[_unit, 0,0] call UO_FW_FNC_SetArtyFiremissionRoundsRequired;
	};
	(_this select 0) setVariable [VAR_SART_FMHANDLE,_handle,true];