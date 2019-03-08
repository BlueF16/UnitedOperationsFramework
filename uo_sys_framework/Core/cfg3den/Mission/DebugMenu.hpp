class EGVAR(Core,DebugSettings) {
    displayName = "Debug Settings";
    collapsed = 0;
    class Attributes {
        class EGVAR(Core,Debug_Enabled) {
            property = QEGVAR(Core,Debug_Enabled);
            displayName = "Debug Enabled";
            tooltip = "Toggle debug mode.";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Core,Debug_Detailed_Enabled) {
            property = QEGVAR(Core,Debug_Detailed_Enabled);
            displayName = "Detailed Debug Enabled";
            tooltip = "Toggle detailed debug mode.";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Core,Debug_Logs) {
            property = QEGVAR(Core,Debug_Logs);
            displayName = "Log all debug messages";
            tooltip = "Log all debug messages.";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Core,ForceTerrain_Enabled) {
            property = QEGVAR(Core,ForceTerrain_Enabled);
            displayName = "Force TerrainGrid";
            tooltip = "Force terrain grid to prevent far away objects from appearing as floating.";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
    };
};
