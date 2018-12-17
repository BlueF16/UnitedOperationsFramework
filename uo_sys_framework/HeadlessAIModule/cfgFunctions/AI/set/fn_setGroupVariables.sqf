/*	Description: Set group variables on GROUP.
 * 	Arguments:
		SIDE	- 0 - Side,
		ARRAY	- 1 - Position,
		STRING	- 2 - Behavior,
		STRING	- 3 - CombatMode,
		STRING	- 4 - Speed,
		STRING	- 5 - Formation,
		STRING	- 6 - GroupStance,
		STRING	- 7 - GroupInit,
		NUMBER 	- 8 - CreateRadius,
		NUMBER 	- 9 - TaskRadius,
		NUMBER 	- 10 - WayppointWait,
		BOOL	- 11 - StartBuilding,
		NUMBER 	- 12 - Task,
		NUMBER 	- 13 - TaskTimer,
		NUMBER 	- 14 - Multiplier,
		NUMBER 	- 15 - OccupyOption
		BOOL	- 16 - VehAssigned
		ARRAY	- 17 - Waypoints
		BOOL	- 18 - OnWater
		ARRAY	- 19 - Task Modules
		BOOL	- 20 - aeForceLights
		BOOL	- 21 - aeSurrender
		BOOL	- 22 - aeTracker
		BOOL	- 23 - ParaEnable
		NUMBER 	- 24 - ParaHeight
		NUMBER 	- 25 - ParaDirection
		NUMBER 	- 26 - ParaColMaxLength
		NUMBER 	- 27 - ParaSpacing
		NUMBER 	- 28 - ParaSpread
		BOOL	- 29 - ParaSmoke
		BOOL	- 30 - ParaRealism
 * 	Return Value:
 * 		BOOL 	- True
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params ["_grp","_gpos",["_grpSet",[],[[]]]];
_grpSet params [
	/*0*/	"_side",
	/*1*/	"_pos",
	/*2*/	"_behave",
	/*3*/	"_combat",
	/*4*/	"_speed",
	/*5*/	"_formation",
	/*6*/	"_grpStance",
	/*7*/	"_grpInit",
	/*8*/	"_createRadius",
	/*9*/	"_taskRadius",
	/*10*/	"_wait",
	/*11*/	"_startBld",
	/*12*/	"_task",
	/*13*/	"_taskTimer",
	/*14*/	"_multi",
	/*15*/	"_occupyOption",
	/*16*/	"_vehAssigned",
	/*17*/	"_waypoints",
	/*18*/	"_onWater",
	/*19*/	"_tasks",
	/*20*/	"_fl",
	/*21*/	"_surrender",
	/*22*/	"_tracker"
	];
	_grp setVariable ['aeGroupPos',_gpos];
	_grp setVariable ['aeBehaviour',_behave];
	_grp setVariable ['aeCombatMode',_combat];
	_grp setVariable ['aeSpeed',_speed];
	_grp setVariable ['aeFormation',_formation];
	_grp setVariable ['aePatrolRadius',_taskRadius];
	_grp setVariable ['aeWaypointWait',_wait];
	_grp setVariable ['aeTask',_task];
	_grp setVariable ['aeTaskTimer',_taskTimer];
	_grp setVariable ['aeOccupyOption',_occupyOption];
	_grp setVariable ['aeWaypoints',_waypoints];
	_grp setVariable ['aeTasks',_tasks];
	_grp setVariable ['aeForceLights',_fl];
	_grp setVariable ['aeSurrender',_surrender];
	_grp setVariable ['aeTracker',_tracker];
	//_grp call UO_FW_AI_fnc_taskReset;
	[_grp,_behave,_combat,_speed,_formation] call UO_FW_AI_fnc_setGroupBehaviour;
	{
		_x setUnitPos _grpStance;
		if(!isNull(assignedVehicle _x)) then {[_x] orderGetIn true;};
	} forEach (units _grp);
	if(_fl) then {[_grp] call UO_FW_AI_fnc_setFlashlights;};
	if(_surrender) then {[_grp] call UO_FW_AI_fnc_setSurrender;};
	_grp spawn _grpinit;
	true
