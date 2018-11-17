/*	Description: Unit Patrols Building, nearest building if no building given.
 * 	Arguments:
 *		OBJECT 	- Unit 
 *	Optional:
 *		NUMBER 	- Wait time at building position
 *		OBJECT 	- Building
 *		ARRAY 	- Building Positions
 *		NUMBER	- Waypoint Wait Time
 *		ARRAY	- Unit Behaviours
 *		ARRAY	- Group Secondary Task If Occupy Building Ends [TASKID,POSITION]
 * 	Return Value:
 * 		BOOL	- True
 *	Author
 *		suits & PiZZADOX
 */
if (!isServer) exitWith {};
params ["_unit",["_bld",objNull,[objNull]],["_bldPos",[],[[]]],["_wpWait",5,[0]],["_uSet",[],[[]]],["_sec",[],[[]]],["_error",false,[false]],["_m",0,[0]],"_i"];
	_uSet params [["_behave","safe",[""]],["_combat","red",[""]],["_speed","limited",[""]],["_formation","wedge",[""]]];
	if(isNull _bld || count _bldPos == 0) then {
		if(isNull _bld) then {
			_bld = [(getposATL _unit),100,false] call UO_AI_fnc_getNearestBuilding;
		};
		_bldPos = _bld buildingPos -1;
	};
	if(isNull _bld) then {_error = true};	
	_unit enableAI "PATH";
	_unit setBehaviour _behave;
	_unit setCombatMode _combat;
	_unit setSpeedMode _speed;
	_unit setFormation _formation;
	_unit setvariable["aeOccupy",true];
	_unit setvariable["aeOccupiedBuilding",_bld];
	private _pos = _bldPos select (floor (random (count _bldPos)));
	private _stopped = false;	
	while {alive _unit && !_error && ((getPosATL _unit) distance _pos) > 2 && (_unit getvariable["aeOccupy",true]) && !_stopped && (_unit getvariable["aeOccupiedBuilding",objNull]) isEqualTo _bld} do { 
		_unit doMove _pos;			
		sleep 5;
		if((_unit getvariable["aeOccupy",true]) && !_stopped && (_unit getvariable["aeOccupiedBuilding",objNull]) isEqualTo _bld && ((getPosATL _unit) distance _pos) < 2) then {
			_stopped = true;
		};
	};
	doStop _unit;
	_unit disableAI "PATH";
	true