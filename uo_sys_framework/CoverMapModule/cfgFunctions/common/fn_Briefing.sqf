#define COMPONENT CoverMap
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(CLIENT);
//Covers Map outside marker and centers map on marker center in briefing map

if ((CBA_missionTime > 0 || getClientState isEqualTo "Briefing READ")) exitwith {};
//params ["_area",["_centered",true],["_zoomlevel",0.4],"_name",["_AOName",1]];
params ["_AONameCalled"];
private ["_areaCalled","_logicCalled","_zoomlevelCalled","_index"];

_AONameCalled = toLower(_AONameCalled);
private _found = false;
{
    _x params ["_AOName","_area","_AOZoom","_logic"];
    if (_AONameCalled isEqualto _AOName) then {
        _areaCalled = _area;
        _logicCalled = _logic;
        _zoomlevelCalled = _AOZoom;
        _index = _forEachIndex;
        _found = true;
    };
} foreach GVAR(AOArray);

if !(_found) exitwith {
    ERROR_1("Default CoverMap area: %1 not found in array!",_AONameCalled);
};

if (isNil QGVAR(MarkerArray)) then {GVAR(MarkerArray) = [];};
//for self interact options and logging
GVAR(currentAO) = _AONameCalled;

_areaCalled params ["_pos","_radiusX","_radiusY","_dir"];
private ["_radiusXo","_radiusYo","_MainS","_MainBS"];

_pos params ["_posx","_posy"];
_radiusXo = _radiusX;
_radiusYo = _radiusY;
_MainS = 20000;
_MainBS = 50;

if ((_dir > 0 && _dir <= 90) || (_dir > 180 && _dir <= 270)) then {
    private _temp = _radiusX;
    _radiusX = _radiusY;
    _radiusY = _temp;
};

private _colorForest = "colorKhaki";
private _colors = ["colorBlack","colorBlack",_colorForest,"colorGreen",_colorForest,/**/"colorBlack"/**/,_colorForest,_colorForest];

{
    _x params ["_dir"];
    private _i = _forEachIndex;

    _dir = _dir mod 360;
    if (_dir < 0) then {_dir = _dir + 360};

    private _s = _radiusX;
    private _w = 2 * _MainS +_radiusY;
    private _bw = _radiusY + _MainBS;
    if !((_dir > 0 && _dir <= 90) || (_dir > 180 && _dir <= 270)) then {
        _s = _radiusY;
        _w = _radiusX + 2 * _MainBS;
        _bw = _radiusX + _MainBS;
    };
    private _posos_x = _posx + (sin _dir) * (_MainS + _s + _MainBS);
    private _posos_y = _posy + (cos _dir) * (_MainS + _s + _MainBS);

    {
        _x params ["_color"];

        private _markername1 = format ["##PREFIX##_CoverMap_Marker_C_%1_%2",_i,_forEachIndex];
        private _marker1 = createMarkerLocal [_markername1,[_posos_x, _posos_y]];
        GVAR(MarkerArray) pushBack _marker1;

        _marker1 setMarkerSizeLocal [_w,_MainS];
        _marker1 setMarkerDirLocal _dir;
        _marker1 setMarkerShapeLocal "rectangle";
        _marker1 setMarkerBrushLocal "solid";
        _marker1 setMarkerColorLocal _color;

        if (_forEachIndex isEqualto 5) then {
            _marker1 setMarkerBrushLocal "grid";
        };

    } forEach _colors;

    private _posos_x = _posx + (sin _dir) * (_MainBS / 2 + _s);
    private _posos_y = _posy + (cos _dir) * (_MainBS / 2 + _s);

    for "_m" from 0 to 7 do {
        private _markername2 = format ["##PREFIX##_CoverMap_Marker_W_%1_%2",_i,_m];
        private _marker2 = createMarkerLocal [_markername2,[_posos_x, _posos_y]];
        GVAR(MarkerArray) pushBack _marker2;

        _marker2 setMarkerSizeLocal [_bw, _MainBS / 2];
        _marker2 setMarkerDirLocal _dir;
        _marker2 setMarkerShapeLocal "rectangle";
        _marker2 setMarkerBrushLocal "solid";
        _marker2 setMarkerColorLocal "colorwhite";

    };

} forEach [_dir, (_dir + 90), (_dir + 180), (_dir + 270)];

private _markername3 = format ["##PREFIX##_CoverMap_Marker_b1_%1",_index];
private _marker3 = createMarkerLocal [_markername3,[_posx, _posy]];
GVAR(MarkerArray) pushBack _marker3;

_marker3 setMarkerSizeLocal [_radiusXo, _radiusYo];
_marker3 setMarkerDirLocal _dir;
_marker3 setMarkerShapeLocal "rectangle";
_marker3 setMarkerBrushLocal "border";
_marker3 setMarkerColorLocal "colorBlack";

private _markername4 = format ["##PREFIX##_CoverMap_Marker_b2_%1",_index];
private _marker4 = createMarkerLocal [_markername4,[_posx, _posy]];
GVAR(MarkerArray) pushBack _marker4;

_marker4 setMarkerSizeLocal [_radiusXo+_MainBS, _radiusYo+_MainBS];
_marker4 setMarkerDirLocal _dir;
_marker4 setMarkerShapeLocal "rectangle";
_marker4 setMarkerBrushLocal "border";
_marker4 setMarkerColorLocal "colorBlack";

((uiNamespace getVariable "RscDiary") displayCtrl 51) ctrlMapAnimAdd [0, _zoomlevelCalled, _pos];
ctrlMapAnimCommit ((uiNamespace getVariable "RscDiary") displayCtrl 51);
