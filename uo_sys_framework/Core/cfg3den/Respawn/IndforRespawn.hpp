class EGVAR(TeamRespawnSettings,Indfor) {
    displayName = "Indfor Respawn Settings";
    collapsed = 0; //_respawnTypeArray = [['1 Life','ONELIFE'],['Unlimited','UNLIMITED'],['Individual Tickets','INDTICKETS'],['Team Tickets','TEAMTICKETS'],['Wave','WAVE'],['Triggered','TRIGGERED']];\
    class Attributes {
        class EGVAR(Respawn,Type_Indfor) {
            displayName = "Respawn System";
            tooltip = "Type of respawn system for Indfor. Place down a GameLogic object with name UO_FW_RESPAWN_Indfor to define respawn location.";
            control = "UO_FW_Respawn_Combo_Indfor";
            defaultValue = "0";
            property = QEGVAR(Respawn,Type_Indfor);
            expression = UO_FW_SCENARIO_EXPRESSION;
        };
        class EGVAR(Respawn,Templates_Indfor) {
            property = QEGVAR(Respawn,Templates_Indfor);
            displayName = "Respawn System Settings";
            tooltip = "";
            control = "UO_FW_RespawnTemplates_Indfor";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "['']";
        };
        class EGVAR(Respawn,NewTeam_Indfor) {
            property = QEGVAR(Respawn,NewTeam_Indfor);
            displayName = "Respawn Side";
            tooltip = "Determines what side the originally Indfor players will spawn on. Enabling this setting requires respawned players to join a new group.";
            respawnTypes[] = {1,2,3};
            control = "UO_FW_RespawnSide_Combo";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "2";
        };
        class EGVAR(Respawn,Delay_Indfor) {
            property = QEGVAR(Respawn,Delay_Indfor);
            displayName = "Respawn Delay";
            tooltip = "Delay in seconds between a player being killed and respawning. Must be more than 5 seconds.";
            respawnTypes[] = {1,2,3,4,5};
            control = QMGVAR(5To20Step1_Slider);
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "5";
            validate = "number";
        };
        class EGVAR(Respawn,IndTickets_Indfor) {
            property = QEGVAR(Respawn,IndTickets_Indfor);
            displayName = "Individual Respawn Tickets";
            tooltip = "Number of individual respawns.";
            respawnTypes[] = {2};
            control = QMGVAR(1To10Step1_Slider);
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "2";
            validate = "number";
        };
        class EGVAR(Respawn,TeamTickets_Indfor) {
            property = QEGVAR(Respawn,TeamTickets_Indfor);
            displayName = "Team Respawn Tickets";
            tooltip = "Number of team respawns.";
            respawnTypes[] = {3};
            control = QMGVAR(10To100Step1_Slider);
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "30";
            validate = "number";
        };
    };
};


class EGVAR(Spectator,Indfor) {
    displayName = "Indfor Spectate Settings";
    collapsed = 0;
    class Attributes {
        class EGVAR(Spectator,EnabledTeams_Indfor) {
            property = QEGVAR(Spectate,EnabledTeams);
            displayName = "Spectate Teams";
            tooltip = "Teams that this team can spectate.";
            control = "UO_FW_SpectateTeams_Attribute";
            defaultValue = "['BLUFOR','OPFOR','Indfor','CIVILIAN']";
            expression = UO_FW_SCENARIO_EXPRESSION;
        };
        class EGVAR(Spectator,KillCam_Indfor) {
            property = QEGVAR(Spectate,KillCam);
            displayName = "Killcam";
            tooltip = "This setting enables the specator killcam functionality.";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class EGVAR(Spectator,AIEnabled_Indfor) {
            property = QEGVAR(Spectate,AIEnabled_Indfor);
            displayName = "Spectate AI";
            tooltip = "Enable Spectating AI Entities.";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class EGVAR(Spectator,FreeCam_Indfor) {
            property = QEGVAR(Spectate,FreeCam);
            displayName = "Spectator Freecam";
            tooltip = "Enable Freecam Ability in Spectator.";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class EGVAR(Spectator,3rdPerson_Indfor) {
            property = QEGVAR(Spectate,3rdPerson);
            displayName = "Spectator Third Person";
            tooltip = "Enable Third Person Ability in Spectator.";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
    };
};

class EGVAR(TeamJIPSettings,Indfor) {
    displayName = "Indfor JiP Settings";
    collapsed = 0;
    class Attributes {
        class EGVAR(JIP,Type_Indfor) {
            property = QEGVAR(JIP,Type_Indfor);
            displayName = "JiP Type";
            tooltip = "TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport. DENY: Player is killed and put in spectator.";
            control = "UO_FW_JIPTypeAtt";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "0";
        };
        class EGVAR(JIP,Distance_Indfor) {
            property = QEGVAR(JIP,Distance_Indfor);
            displayName = "JiP Distance";
            tooltip = "If distance to group members upon spawn is greater than this you will be granted the defined JiP action";
            control = QMGVAR(50To200Step50_Slider);
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "200";
        };
        class EGVAR(JIP,SpawnDistance_Indfor) {
            property = QEGVAR(JIP,SpawnDistance_Indfor);
            displayName = "Spawn Radius";
            tooltip = "Exiting this radius will remove the JiP actions from the player.";
            control = QMGVAR(50To200Step50_Slider);
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "50";
        };
    };
};
