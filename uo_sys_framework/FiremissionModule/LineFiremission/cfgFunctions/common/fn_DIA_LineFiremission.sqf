#include "..\..\..\Global\defs.hpp"
if (isServer) then {_id = ["CallLineFiremission", {_this call UO_FW_FNC_DIA_LineFiremissionFireServer;}] call CBA_fnc_addEventHandler;};