#include "x\UO_FW\addons\main\FiremissionModule\Global\defs.hpp"
if (isServer) then
	{
		_handle = _this spawn
		{
			private _unit = _this select 0;
			private	_target = _this select 1;
			private	_innerRadius = _this select 2;
			private	_outerRadius = _this select 3;
			private	_burstCount = _this select 4;
			private	_burstSize = _this select 5;
			private	_burstWait = _this select 6;
			private	_minSpottedDistance = _this select 7;
			private	_roundType = _this select 8;
			private _roundClassName = ((_unit call UO_FW_FNC_GetArtyAmmo) select _roundType) select 0 ;
			private	_fireRate = _unit call UO_FW_FNC_ArtGetFireRate;

			[_unit , true] call UO_FW_FNC_SetArtyReadyStatus;
			_unit setVariable [VAR_SART_ARTFMTEXT,_this call UO_FW_FNC_GetDonutFiremissionText,true];
			[_unit, 0,_burstCount * _burstSize] call UO_FW_FNC_SetArtyFiremissionRoundsRequired;
			[_unit,_target,_roundClassName ] call UO_FW_FNC_InternalSpottingFiremission;
				//spotting rounds finished
				sleep( (_unit getVariable [VAR_SART_ARTCALCSPEED,MEANCALCULATIONTIME]) + 1);
				for "_i" from 0 to _burstCount do
				{


						_randomPos = [[[_target, _outerRadius]],[[_target, _innerRadius]]] call BIS_fnc_randomPos;
						[_unit,_randomPos,0,_burstSize,_roundClassName] call UO_FW_FNC_InternalFiremission;
						[_unit, ((_unit getVariable [VAR_SART_ARTROUNDSFIRED,[0,0]]) select 0) + _burstSize,_burstCount * _burstSize] call UO_FW_FNC_SetArtyFiremissionRoundsRequired;
						sleep(((_fireRate * (_unit getVariable [VAR_SART_ARTFIRERATE,MEANFIRERATE]) ) * _burstSize) max _burstWait);
				};
				[_unit,objNULL] call UO_FW_FNC_SetArtyCaller;
				[_unit, false] call UO_FW_FNC_SetArtyReadyStatus;
				[_unit, 0,0] call UO_FW_FNC_SetArtyFiremissionRoundsRequired;
		};

		(_this select 0) setVariable [VAR_SART_FMHANDLE,_handle,true];
	};