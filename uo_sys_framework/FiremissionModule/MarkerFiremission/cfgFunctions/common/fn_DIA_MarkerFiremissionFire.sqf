#include "..\..\..\Global\defs.hpp"
_guns = player getVariable [VAR_SART_OBSGUNS,[]];
_usableGuns = [];
{
    if (_x call UO_FW_fnc_IsArtyAviable) then {
        _usableGuns pushBack _x;
    };
} forEach _guns;
private _selectedUnit = objNull;
    if ((count _usableGuns) > 0) then { _selectedUnit = (_usableGuns select (lbCurSel MFM_DIA_IDC_GUNSELECT));};
private _selectedAmmo = lbCurSel MFM_DIA_IDC_SHELLSELECT;
private _name = ctrlText MFM_DIA_IDC_NAME;
private _dispersion = (ctrlText MFM_DIA_IDC_DISPERSION) call BIS_fnc_parseNumber;
private _salvoNumber = (ctrlText MFM_DIA_IDC_BURSTNUMBER) call BIS_fnc_parseNumber;
private _salvoRounds = (ctrlText MFM_DIA_IDC_BURSTROUNDS) call BIS_fnc_parseNumber;
private _salvoDelay = (ctrlText MFM_DIA_IDC_BURSTDELAY) call BIS_fnc_parseNumber;
private _spotting =  (ctrlText MFM_DIA_IDC_SPOTTING) call BIS_fnc_parseNumber;

_inputIsCorrect = true;
_inputIsCorrect = _inputIsCorrect && [_selectedUnit,"No Arty selected/aviable"] call UO_FW_fnc_InputIsUnit;
_inputIsCorrect = _inputIsCorrect && [_dispersion,"Dispersion is not a number"] call UO_FW_fnc_InputIsNumber;
_inputIsCorrect = _inputIsCorrect && [_salvoNumber,"Salvo number is not a number"] call UO_FW_fnc_InputIsNumber;
_inputIsCorrect = _inputIsCorrect && [_salvoRounds,"Salvo rounds is not a number"] call UO_FW_fnc_InputIsNumber;
_inputIsCorrect = _inputIsCorrect && [_salvoDelay,"Salvo delay is not a number"] call UO_FW_fnc_InputIsNumber;
_inputIsCorrect = _inputIsCorrect && [_spotting,"Spotting distance is not a number"] call UO_FW_fnc_InputIsNumber;
private _marker = _name call UO_FW_fnc_FindMarkerOnMap;
if (_marker == "") then { _inputIsCorrect = false;hint "marker does not exist";    };
if (_inputIsCorrect) then {

                        private _round =  ((_selectedUnit call UO_FW_fnc_GetArtyAmmo) select _selectedAmmo) select 0;

                        hint (([_selectedUnit,_name,_dispersion,_salvoNumber,_salvoRounds,_salvoDelay,_spotting,_selectedAmmo] call UO_FW_fnc_GetMarkerFiremissionText)
                            + "Requested by:" + (name player)
                            + "\nETA: " + str (round ((_selectedUnit call UO_FW_fnc_GetArtyAimTime) + ([_selectedUnit,getMarkerPos (_marker),_round] call UO_FW_fnc_GetArtyEta))) + " s");
                        ["CallMarkerFiremission",  [player,_selectedUnit,_name,_dispersion,_salvoNumber,_salvoRounds,_salvoDelay,_spotting,_selectedAmmo]] call CBA_fnc_serverEvent;
                        [] call UO_FW_fnc_DIA_MarkerFiremissionCloseDialog;

};