class UO_FW_Hostage_Attributes {
    displayName = "Hostage Options";
    collapsed = 1;
    class Attributes {
        class UO_FW_Hostage_State {
            displayName = "Hostage State";
            tooltip = "Makes this unit a hostage that starts bound/captive and must be rescued via player action.";
            property = "UO_FW_Hostage_State";
            control = "CheckboxState";
            expression= "_this setVariable ['%s', _value,true]; if (_value) then {[{CBA_missionTime > 1},{[_this] call UO_FW_FNC_HostageSet;},_this] call CBA_fnc_WaitUntilAndExecute;};";
			condition = "objectControllable ";
            defaultValue = "false";
        };
        class UO_FW_Hostage_Rescue_Location {
            displayName = "Hostage Rescue Zone";
            tooltip = "Marker that determines the hostage rescue zone. (Default: 'hostage_rescue' marker)";
            property = "UO_FW_Hostage_Rescue_Location";
            control = "Edit";
            expression = "if !(is3DEN) then {_propertyName = '%s'; [_this, _propertyName, _value, false] call UO_FW_fnc_setInitVar;};";
            condition = "objectControllable ";
            defaultValue = "'hostage_rescue'";
        };
         class UO_FW_Hostage_Freed_JoinSquad {
            displayName = "Hostage Joins Squad";
            tooltip = "Determine if the hostage will join the squad of the player who frees them. (Default: true)";
            property = "UO_FW_Hostage_Freed_JoinSquad";
            control = "Checkbox";
            expression = "if !(is3DEN) then {_propertyName = '%s'; [_this, _propertyName, _value, false] call UO_FW_fnc_setInitVar;};";
            condition = "objectControllable ";
            defaultValue = "true";
        };
        class UO_FW_Hostage_Freed_Modifier {
            displayName = "Hostage Freed Modifiers";
            tooltip = "Enable modifiers for hostage's behavior when they are freed. (False by default.)";
            property = "UO_FW_Hostage_Freed_Modifier";
            control = "Checkbox";
            expression = "if !(is3DEN) then {_propertyName = '%s'; [_this, _propertyName, _value, false] call UO_FW_fnc_setInitVar;};";
            condition = "objectControllable ";
            defaultValue = "false";
        };
        class UO_FW_Hostage_Freed_Behavior {
            displayName = "Hostage Freed Behavior";
            tooltip = "Determine the hostages behavior when freed by the player.\nWill not function unless 'Hostage Freed Modifiers' is enabled. (Default: CARELESS)";
            property = "UO_FW_Hostage_Freed_Behavior";
            control = "Edit";
            expression = "if !(is3DEN) then {_propertyName = '%s'; [_this, _propertyName, _value, false] call UO_FW_fnc_setInitVar;};";
            condition = "objectControllable ";
            defaultValue = "'CARELESS'";
        };
    };
};