if (!isServer) exitWith {};

private ["_unit","_type","_amt"];

_unit 	= _this select 0;	//Vehicle to add a medic bag to
_type 	= _this select 1;	//Class of backpack to add
_amt 	= _this select 2;	//Number of bags to add

[{
    (_this select 0) addBackpackCargoGlobal [(_this select 1),(_this select 2)];
    {
        if (typeOf _x == (_this select 1)) then {
            clearBackpackCargoGlobal _x;
            clearItemCargoGlobal _x;
            clearMagazineCargoGlobal _x;
            clearWeaponCargoGlobal _x;

            _x addItemCargoGlobal ["ACE_salineIV",5];
            _x addItemCargoGlobal ["ACE_salineIV_500",6];

            _x addItemCargoGlobal ["ACE_adenosine",10];
            _x addItemCargoGlobal ["ACE_morphine",10];
            _x addItemCargoGlobal ["ACE_epinephrine",10];

            _x addItemCargoGlobal ["ACE_quikclot",16];
            _x addItemCargoGlobal ["ACE_packingBandage",16];
            _x addItemCargoGlobal ["ACE_fieldDressing",16];
            _x addItemCargoGlobal ["ACE_elasticBandage",20];

            _x addItemCargoGlobal ["ACE_tourniquet",5];

            _x addItemCargoGlobal ["ACE_surgicalKit",1];
        };
    } forEach everyBackpack (_this select 0);
}, [_unit,_type,_amt], 1] call CBA_fnc_waitAndExecute;
