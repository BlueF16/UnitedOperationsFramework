/*    Description: Exports UO_FW mission attributes to clipboard or profileNamespace
 *    Arguments:
 *         STRING - Setting preset name, not used if copying to clipboard
 *         BOOL - Clipboard mode, false saves profile name to profileNamespace
 *    Return Value:
 *         ARRAY
 *    Author
 *        R3vo & PiZZADOX
 */

#define COMPONENT 3DEN
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);
UO_FW_3DEN_CHECK;

//IGNORE_PRIVATE_WARNING ["_x"];

params [["_name",""],["_clipBoardMode",false]];

private _attributeValues = [];
private _sections = "!(((str(configname _x)) find 'UO_FW') isEqualto -1)" configClasses (Configfile >> "Cfg3DEN" >> "Mission");
{
    private _section = configName _x;
    private _children = [configfile >> "Cfg3DEN" >> "Mission" >> _section >> "AttributeCategories",2,false] call BIS_fnc_returnChildren;
    {
        private _attributeName = "";
        _attributeName = getText (_x >> "data");
        private _attributeValue = _section get3DENMissionAttribute _attributeName;
        if (isNil "_attributeValue") then {
            _attributeName = configName _x;
            _attributeValue = _section get3DENMissionAttribute _attributeName;
            if (isNil "_attributeValue") then {
                _attributeName = getText (_x >> "property");
                _attributeValue = _section get3DENMissionAttribute _attributeName;
            };
        } else {
            _attributeValues pushBack [_section,_attributeName,_attributeValue];
        };
    } foreach _children;
} foreach _sections;

if (_clipBoardMode) then {
    copytoClipboard (str _attributeValues);
    LOG("Mission settings copied to clipboard");
} else {
    private _profileArray = profileNamespace getvariable ["UO_FW_ProfileSettingsArray",[]];
    if (_profileArray isEqualto []) then {
        _profileArray pushback [_name,_attributeValues];
        profileNamespace setvariable ["UO_FW_ProfileSettingsArray",_profileArray];
        saveProfileNamespace;
    } else {
        private _findIfResult = _profileArray findif {((toLower (_x select 0)) isEqualto (toLower _name))};
        if (!((_findIfResult) isEqualto -1)) then {
            diag_log format ["preset _name: %1 already found in _profileArray!, setting option for overwrite",_name];
            [_profileArray,_name,_attributeValues,_findIfResult] spawn {
                params ["_profileArray","_name","_attributeValues","_findIfResult"];
                private _result = ["Setting Preset Name is already in profile, do you want to overwrite this preset?", "Overwrite Settings Preset", "Overwrite", true, (findDisplay 313)] call BIS_fnc_guiMessage;
                if (_result) then {
                    _profileArray set [_findIfResult,[_name,_attributeValues]];
                    profileNamespace setvariable ["UO_FW_ProfileSettingsArray",_profileArray];
                    saveProfileNamespace;
                };
            };
        } else {
            _profileArray pushback [_name,_attributeValues];
            profileNamespace setvariable ["UO_FW_ProfileSettingsArray",_profileArray];
            saveProfileNamespace;
        };
    };
};
