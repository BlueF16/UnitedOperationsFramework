#include "x\UO_FW\addons\main\FiremissionModule\Global\defs.hpp"
	private _unit = _this select 0;
	private _pos = _this select 1;
	private _ammo = _this select 2;
	private _ret = _unit getArtilleryETA [_pos, _ammo];
	_ret