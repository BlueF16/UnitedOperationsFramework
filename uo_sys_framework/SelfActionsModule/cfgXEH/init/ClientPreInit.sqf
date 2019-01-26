#define COMPONENT SelfActions
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

["UO_FW_SelfActions_ColourCheckInitEvent", {
    [{!isNull player}, {
        private _teamColorAction = ["colorCheck_class", "Check Team Color", "", {
            private ["_str"];
            switch (assignedTeam player) do {
                case "BLUE": {_str = "<t size='1.5'>You are in <br/><t color='#0000FF'>BLUE</t> team.</t> "};
                case "RED": {_str = "<t size='1.5'>You are in <br/><t color='#FF0000'>RED</t> team.</t> "};
                case "GREEN": {_str = "<t size='1.5'>You are in <br/><t color='#00FF00'>GREEN</t> team.</t> "};
                case "YELLOW": {_str = "<t size='1.5'>You are in <br/><t color='#FFFF00'>YELLOW</t> team.</t> "};
                default {_str = "<t size='1.5'>You are in <br/><t color='#FFFFFF'>WHITE</t> team.</t> "};
            };
            hint parseText _str;
        }, {!isNil {assignedTeam player}}] call ace_interact_menu_fnc_createAction;
        [player, 1, ["ACE_SelfActions","ACE_TeamManagement"], _teamColorAction] call ace_interact_menu_fnc_addActionToObject;
    }, []] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

//IGNORE_PRIVATE_WARNING ["_player","_target"];
["UO_FW_SelfActions_CheckMapInitEvent", {
    ["UO_FW_RegisterModuleEvent", ["Self Actions", "Allows players to check their own team color, view other's maps, launch paraflares, and cut grass.", "TinfoilHate and PiZZADOX"]] call CBA_fnc_globalEvent;
    [{!isNull player}, {
        private _shareMapAction = ["shareMap_class", "View Map", "", {
            params ["_target", "_player"];
            player linkItem "ItemMap";
            openMap true;
            [{!visibleMap || ((_this select 0) distance (_this select 1) > 3)}, {
                openMap false;
                player unlinkItem "ItemMap";
            },[_target,_player]] call CBA_fnc_waitUntilAndExecute;
        }, {
            (!("ItemMap" in assignedItems _player)) &&
            {("ItemMap" in assignedItems _target)} &&
            {(_target distance _player <= 3)} &&
            {((_player getFriend _target) > 0.6)}
        }] call ace_interact_menu_fnc_createAction;
        [player, 0, ["ACE_MainActions"], _shareMapAction, true] call ace_interact_menu_fnc_addActionToObject;
    }, []] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

//IGNORE_PRIVATE_WARNING ["_thisID"];
["UO_FW_SelfActions_CutGrassInitEvent", {
    [{!isNull player}, {
        private _macheteAction = ["machete_class", "Cut Grass", "", {
            [player, "AnimDone", {
                params ["_unit", "_anim"];
                if (_anim isEqualTo "AinvPknlMstpSlayWrflDnon_medic") then {
                    private _cutter = createVehicle ["ClutterCutter_small_EP1", [0,0,0], [], 0, "CAN_COLLIDE"];
                    _cutter setpos (_unit getPos [1, getDir _unit]);
                    _unit removeEventHandler ["AnimDone", _thisID];
                };
            }, []] call CBA_fnc_addBISEventHandler;
            player playMove "AinvPknlMstpSlayWrflDnon_medic";
        }, {(stance player isEqualTo "CROUCH") && !(toLower(animationState player) isEqualTo "ainvpknlmstpslaywrfldnon_medic")}] call ace_interact_menu_fnc_createAction;
        [player, 1, ["ACE_SelfActions","ACE_Equipment"], _macheteAction] call ace_interact_menu_fnc_addActionToObject;
    }, []] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

["UO_FW_SelfActions_ParaFlaresInitEvent", {
    [{!isNull player}, {
        private _paraFlareBaseMenu = ["SelfActions_ParaBaseClass", "Paraflares", "", {}, {true}] call ace_interact_menu_fnc_createAction;
        [player, 1, ["ACE_SelfActions","ACE_Equipment"], _paraFlareBaseMenu] call ace_interact_menu_fnc_addActionToObject;
        {
            _x params ["_name", "_magClass", "_colour", "_ammoType"];
            private _paraFlareActionTemp = [("SelfActions_LaunchParaFlare_" + _name), ("Launch " + _name + " Flare"), "", {
                (_this select 2) params ["_magClass", "_colour", "_ammoType"];
                private _pos = player modelToWorld [0, 1, 0];
                _pos = [_pos select 0, _pos select 1, (_pos select 2) + 1.5];
                private _vectorView = [(getCameraViewDirection player) select 0, (getCameraViewDirection player) select 1, ((getCameraViewDirection player) select 2) + 0.35];
                private _vectorDir = _vectorView vectorMultiply 55;
                player playActionNow "HandGunOn";
                [{
                    params ["_ammoType", "_pos", "_vectorDir", "_colour"];
                    [player,"SelfActions_flareFire"] remoteExec ["say3D"];
                    [{
                        params ["_ammoType", "_pos", "_vectorDir", "_colour"];
                        private _flare = _ammoType createVehicle _pos;
                        _flare setVelocity _vectorDir;
                        [_flare,"SelfActions_flareShot"] remoteExec ["say3D"];
                        [{!isNull (_this select 0)}, {
                            params ["_flare","_colour","_pos"];
                            ["UO_FW_SelfActions_ParaFlareCreateLightEvent", [_flare,_colour,_pos]] call CBA_fnc_globalEvent;
                        }, [_flare,_colour,_pos]] call CBA_fnc_waitUntilAndExecute;
                    }, [_ammoType,_pos,_vectorDir,_colour], 1] call CBA_fnc_waitAndExecute;
                }, [_ammoType,_pos,_vectorDir,_colour], 1.5] call CBA_fnc_waitAndExecute;
        	}, {
        		(vehicle player isEqualto player) && {((_this select 2 select 0) in magazines player)}
        	}, {}, [_magClass,_colour,_ammoType]] call ace_interact_menu_fnc_createAction;
        	[player, 1, ["ACE_SelfActions","ACE_Equipment","SelfActions_ParaBaseClass"], _paraFlareActionTemp] call ace_interact_menu_fnc_addActionToObject;
        } foreach [
            ["White","FlareWhite_F",[1,1,1],"F_20mm_White"],
            ["Green","FlareGreen_F",[0.25,0.5,0.25],"F_20mm_Green"],
            ["Yellow","FlareYellow_F",[0.5,0.5,0.25],"F_20mm_Yellow"],
            ["Red","FlareRed_F",[0.5,0.25,0.25],"F_20mm_Red"],
            ["Large White","UO_FW_ParaFlare_White",[1,1,1],"UO_FW_ParaFlare_Shot_White"],
            ["Large Green","UO_FW_ParaFlare_Green",[0.25,0.5,0.25],"UO_FW_ParaFlare_Shot_Green"],
            ["Large Yellow","UO_FW_ParaFlare_Yellow",[0.5,0.5,0.25],"UO_FW_ParaFlare_Shot_Yellow"],
            ["Large Red","UO_FW_ParaFlare_Red",[0.5,0.25,0.25],"UO_FW_ParaFlare_Shot_Red"]
        ];
    }, []] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

["UO_FW_SettingsLoaded", {
    if (!UO_FW_SelfActions_Enable) exitwith {};
    if (!UO_FW_Server_SelfActionsModule_Allowed) exitwith {};
    if (UO_FW_SelfActions_CheckColour_Enabled) then {
        ["UO_FW_SelfActions_ColourCheckInitEvent", []] call CBA_fnc_localEvent;
    };
    if (UO_FW_SelfActions_CheckMap_Enabled) then {
        ["UO_FW_SelfActions_CheckMapInitEvent", []] call CBA_fnc_localEvent;
    };
    if (UO_FW_SelfActions_CutGrass_Enabled) then {
        ["UO_FW_SelfActions_CutGrassInitEvent", []] call CBA_fnc_localEvent;
    };
    if (UO_FW_SelfActions_ParaFlares_Enabled) then {
        ["UO_FW_SelfActions_ParaFlaresInitEvent", []] call CBA_fnc_localEvent;
    };
    [{!isNull player},{
        ["UO_FW_RegisterModuleEvent", ["Self Actions", "Allows players to check their own team color, view other's maps, launch paraflares, and cut grass.", "TinfoilHate and PiZZADOX"]] call CBA_fnc_globalEvent;
    }, []] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;