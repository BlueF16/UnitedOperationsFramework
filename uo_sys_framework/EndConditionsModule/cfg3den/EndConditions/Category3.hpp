class UO_FW_EndConditions_MainSettings_Category3 {
    displayName = "Category Settings";
    collapsed = 0;
    class Attributes {
		class UO_FW_EndCondition_Enabled_3 {
            property = "UO_FW_EndCondition_Enabled_3";
            displayName = "Enable Category";
            tooltip = "Toggle Activation of the End Condition Category";
			control = "CheckBoxState";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
        };
        class UO_FW_EndCondition_Mode_3 {
            property = "UO_FW_EndCondition_Mode_3";
            displayName = "Category Mode";
            tooltip = "Whether or not the condition fires if any condition is true, or if all conditions are true. Extract condition must be true in both cases.";
			control = "UO_FW_EndConditions_ModeAttribute";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
			validate = "number";
            defaultValue = "0";
        };
		class UO_FW_EndCondition_Message_3 {
            property = "UO_FW_EndCondition_Message_3";
            displayName = "Category Message";
            tooltip = "Message displayed when end condition category is triggered";
            control = "Edit";
			validate = "string";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "'End condition 3 fired!'";
        };
	};
};

class UO_FW_EndConditions_CasualtySettings_Category3 {
    displayName = "Casualty Settings";
    collapsed = 0;
    class Attributes {
		class UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_3 {
            property = "UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_3";
            displayName = "BLUFOR Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_BLUFOR_Percentage_3 {
            property = "UO_FW_EndCondition_CasualtyCount_BLUFOR_Percentage_3";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
			validate = "number";
            defaultValue = "75";
        };
		class UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_3 {
            property = "UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_3";
            displayName = "OPFOR Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_OPFOR_Percentage_3 {
            property = "UO_FW_EndCondition_CasualtyCount_OPFOR_Percentage_3";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
			validate = "number";
            defaultValue = "75";
        };
		class UO_FW_EndCondition_CasualtyCount_RESISTANCE_Enabled_3 {
            property = "UO_FW_EndCondition_CasualtyCount_RESISTANCE_Enabled_3";
            displayName = "INDFOR Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_RESISTANCE_Percentage_3 {
            property = "UO_FW_EndCondition_CasualtyCount_RESISTANCE_Percentage_3";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
			validate = "number";
            defaultValue = "75";
        };
		class UO_FW_EndCondition_CasualtyCount_CIVILIAN_Enabled_3 {
            property = "UO_FW_EndCondition_CasualtyCount_CIVILIAN_Enabled_3";
            displayName = "CIVILIAN Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_CIVILIAN_Percentage_3 {
            property = "UO_FW_EndCondition_CasualtyCount_CIVILIAN_Percentage_3";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
			validate = "number";
            defaultValue = "75";
        };
    };
};

class UO_FW_EndConditions_EntitySettings_Category3 {
    displayName = "Entity Settings";
    collapsed = 0;
    class Attributes {
		class UO_FW_EndCondition_EntitiesAlive_Array_3 {
            property = "UO_FW_EndCondition_EntitiesAlive_Array_3";
            displayName = "Alive Entities";
            tooltip = "Array of entities checked for alive status. Leave blank to disable";
			control = "EditArray";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "[]";
        };
		class UO_FW_EndCondition_EntitiesDead_Array_3 {
            property = "UO_FW_EndCondition_EntitiesDead_Array_3";
            displayName = "Dead Entities";
            tooltip = "Array of entities checked for dead status. Leave blank to disable";
			control = "EditArray";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "[]";
        };
		class UO_FW_EndCondition_EntitiesDamaged_Array_3 {
            property = "UO_FW_EndCondition_EntitiesDamaged_Array_3";
            displayName = "Damaged Entities";
            tooltip = "Array of entities checked for over 50 percent damage or immobilized status. Includes dead state. Leave blank to disable";
			control = "EditArray";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "[]";
        };
	};
};

class UO_FW_EndConditions_HostageSettings_Category3 {
    displayName = "Hostage Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_EndCondition_HostageRescued_Array_3 {
            property = "UO_FW_EndCondition_HostageRescued_Array_3";
            displayName = "Hostage(s) Rescued";
            tooltip = "Array of hostages that must be rescued for the end condition to fire. leave blank to disable.";
            control = "EditArray";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "[]";
        };
    };
};

class UO_FW_EndConditions_VariableSettings_Category3 {
    displayName = "Custom Variable Settings";
    collapsed = 0;
    class Attributes {
		class UO_FW_EndCondition_CustomVariables_Array_3 {
            property = "UO_FW_EndCondition_CustomVariables_Array_3";
            displayName = "Custom Variables";
            tooltip = "Array of variables to check for true status. Leave blank to disable";
			control = "EditArray";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "[]";
        };
	};
};

class UO_FW_EndConditions_ExtractionSettings_Category3 {
    displayName = "Extraction Settings";
    collapsed = 0;
    class Attributes {
		class UO_FW_EndCondition_ExtractionEnabled_3 {
            property = "UO_FW_EndCondition_ExtractionEnabled_3";
            displayName = "Require Extraction";
            tooltip = "Require Extraction in addition to end conditions for this category.";
			control = "CheckBoxState";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
        };
		class UO_FW_EndCondition_ExtractionTeam_3 {
            property = "UO_FW_EndCondition_ExtractionTeam_3";
            displayName = "Team";
            tooltip = "Team required to be in extract area.";
			control = "UO_FW_EndConditions_ExtractTeam";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
			defaultValue = "0";
        };
		class UO_FW_EndCondition_ExtractionMarker_3 {
            property = "UO_FW_EndCondition_ExtractionMarker_3";
            displayName = "Extraction Marker";
            tooltip = "Marker name of extraction area.";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_EndCondition_ExtractionRatio_3 {
            property = "UO_FW_EndCondition_ExtractionRatio_3";
            displayName = "Ratio";
            tooltip = "Percentage of alive personnel inside the marker to be considered extracted. Default 75";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            validate = "number";
			defaultValue = "75";
        };
	};
};

class UO_FW_EndConditions_CaptureZoneSettings_Category3 {
    displayName = "CaptureZone Settings";
    collapsed = 0;
    class Attributes {
		class UO_FW_EndCondition_CaptureZoneCaptured_Array_3 {
        	property = "UO_FW_EndCondition_CaptureZoneCaptured_Array_3";
        	displayName = "CaptureZone Names";
        	tooltip = "List of CaptureZones names that must be captured for the end condition to fire. Leave empty to disable.";
			control = "EditArray";
        	expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
			defaultValue = "[]";
    	};
		class UO_FW_EndCondition_CaptureZoneCaptured_Team_3 {
        	property = "UO_FW_EndCondition_CaptureZoneCaptured_Team_3";
        	displayName = "CaptureZone Team";
        	tooltip = "Team that must activate the CaptureZones for the condition to fire.";
			control = "UO_FW_EndConditions_CaptureZoneTeam";
        	expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
        	defaultValue = "1";
    	};
	};
};