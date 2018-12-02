"" spawn
{
	#include "\x\UO_FW\addons\main\script_macros.hpp"
	//waitUntil{!(isNil "UO_FW_ENABLED")};

	

	//Module functions
	if(UO_FW_Enabled) then
	{
		if(!UO_FW_SERVER_FRAMEWORK_ALLOWED) exitWith 
		{
			["","Framework is disabled by the Server."] call UO_FW_fnc_DebugMessageDetailed;
		};
		//if(!UO_FW_Enabled) exitWith {};
		"" call UO_FW_FNC_SetDefaults;
		["","Starting Framework"] call UO_FW_fnc_DebugMessageDetailed;
		_this call UO_FW_FNC_init;
		if(UO_FW_SERVER_ACREMODULE_ALLOWED) then {_this call UO_FW_FNC_AcreInit;};
		if(UO_FW_SERVER_GEARMODULE_ALLOWED) then {_this call UO_FW_FNC_GearInit;};
		if(UO_FW_SERVER_ACREMODULE_ALLOWED) then {_this call UO_FW_FNC_addRadiosInit;};
		//_this call UO_FW_FNC_debugInit
		if(UO_FW_SERVER_BRIEFING_ALLOWED) then {_this call UO_FW_FNC_initBriefings;};
		if(UO_FW_SERVER_ANTINDMODULE_ALLOWED) then {_this call UO_FW_FNC_antiNDInit;};
		if(UO_FW_SERVER_AOLIMIT_ALLOWED) then {_this call UO_FW_FNC_AOLimitInit;};
		if(UO_FW_SERVER_ENDCONDITIONMODULE_ALLOWED) then {_this call UO_FW_FNC_EndConditionsInit;};
		if(UO_FW_SERVER_AILINK_ALLOWED) then {_this call UO_FW_FNC_AILinkInit;};
		if(UO_FW_SERVER_AUTOTRACKASSETMODULE_ALLOWED) then {_this call UO_FW_FNC_AutoTrackAssetInit;};
		if(UO_FW_SERVER_DISCONNECTMODULE_ALLOWED) then {_this call UO_FW_FNC_DisconnectControlInit;};
		
		if(UO_FW_SERVER_MARKERCONTROLMODULE_ALLOWED) then {_this call UO_FW_FNC_MarkerControlInit;};
		if(UO_FW_SERVER_STARTTEXTMODULE_ALLOWED) then {_this call UO_FW_FNC_StartTextInit;};
		if(UO_FW_SERVER_JIPMODULE_ALLOWED) then {_this call UO_FW_FNC_jipInit;};
		if(UO_FW_SERVER_SAFESTARTMODULE_ALLOWED) then {_this call UO_FW_FNC_safeStartInit;};
		if(UO_FW_SERVER_SELFACTIONSMODULE_ALLOWED) then {_this call UO_FW_FNC_selfActionsInit;};
		if(UO_FW_SERVER_SHOTCOUNTMODULE_ALLOWED) then {_this call UO_FW_FNC_shotCountInit;};
		if(UO_FW_SERVER_SOFTAOMODULE_ALLOWED) then {_this call UO_FW_FNC_SoftAOLimitInit;};
	};


	//Unit Attribute Functions
	//Allways called because of the module design choice and keeping a standard with normal unit attributes
	//and to give stuff to people making missions with olsen framework
	if(UO_FW_SERVER_ACREMODULE_ALLOWED) then {_this call UO_FW_FNC_radioEarChannelInit;};
	if(UO_FW_SERVER_FIREMISSIONMODULE_ALLOWED) then {_this call UO_FW_FNC_FiremissionModuleInit;};
	if(UO_FW_SERVER_AIDRIVERSMODULE_ALLOWED) then {_this call UO_FW_FNC_aiDriversVehInit;};
	if(UO_FW_SERVER_HOSTAGEMODULE_ALLOWED) then {_this call UO_FW_FNC_HostageInit;};
	if(UO_FW_SERVER_REMOVERMODULE_ALLOWED) then {_this call UO_FW_FNC_MapCompassRemoverInit;};
	if(UO_FW_SERVER_STARTINPARACHUTEMODULE_ALLOWED) then {_this call UO_FW_FNC_StartInParachuteInit;};
	if(UO_FW_SERVER_TEAMCOLOURMODULE_ALLOWED) then {_this call UO_FW_FNC_teamColourInit;};

	["","Finished Initializing Framework"] call UO_FW_fnc_DebugMessageDetailed;
};
