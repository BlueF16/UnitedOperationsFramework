#include "x\UO_FW\addons\main\FiremissionModule\Global\defs.hpp"

private _value = _this select 0;
private _errorText = _this select 1;
private _ret = true;
if(_value isEqualTo objNull) then
{
	hint _errorText;
	_ret = false;
};
_ret
