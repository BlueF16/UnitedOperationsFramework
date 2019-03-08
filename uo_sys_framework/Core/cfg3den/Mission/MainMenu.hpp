class EGVAR(Core,MainSettings) {
    displayName = "Main Settings";
    collapsed = 0;
    class Attributes {
        class EGVAR(Core,Enabled) {
            property = QEGVAR(Core,Enabled);
            displayName = "Enable UO Framework";
            tooltip = "Enable UO Framework";
            control = "UO_FW_FrameworkCheckbox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Core,MissionType) {
            property = QEGVAR(Core,MissionType);
            displayName = "Mission Type";
            tooltip = "Determines Mission Type";
            control = "MissionType";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
    };
};
