#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

LOG("Respawned_Event called");
[QGVAR(RespawnedEvent), _this] call CBA_fnc_serverEvent;
