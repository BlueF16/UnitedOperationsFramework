#define COMPONENT CaptureZone
#include "\x\UO_FW\addons\Main\script_macros.hpp"
3DEN_CHECK;

LOG("CaptueZoneAttribute Save started");

private _control = (_this controlsGroupCtrl 100);
private _config = _control getvariable [QMGVAR(parentcontrolcfg),""];
private _attProperty = getText (_config >> "property");
private _value = (_control lbData lbCurSel _control);
missionNamespace setvariable [_attProperty,_value];
_value
