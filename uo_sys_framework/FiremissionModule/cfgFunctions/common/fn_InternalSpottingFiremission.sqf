#include "..\..\Global\defs.hpp"
private _unit = _this select 0;
    private _target = _this select 1;
    private _roundClassName = _this select 2;
    sleep((_unit call UO_FW_fnc_GetArtyAimTime));
    private _dis = 1000;
    private _tempAcc = (_unit getVariable [VAR_SART_ARTSPOTACCURACY,MEANSPOTTINGACCURACY]) + 1;
    while{(_dis >_minSpottedDistance && SPOTTINGROUNDSREQUIRED  )} do {
                _randomPos = [[[_target, _tempAcc]],[]] call BIS_fnc_randomPos;
                _dis = _randomPos distance2D _target;
                    _eta = [_unit,_randomPos, _roundClassName] call UO_FW_fnc_GetArtyEta;
                _unit commandArtilleryFire [_randomPos,  _roundClassName, 1];
                _waitTime = (_fireRate * (_unit getVariable [VAR_SART_ARTFIRERATE,MEANFIRERATE])) max _eta;
                sleep(_waitTime max ((_unit getVariable [VAR_SART_ARTAIMSPEED,MEANAIMTIME]) + 1));
                _tempAcc = [_dis,_tempAcc] call UO_FW_fnc_GetNewAccuracy;

    };