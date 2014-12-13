//Written by beta
//Unit interaction setup


#include "\a3\editor_f\Data\Scripts\dikCodes.h"

private ["_menuDef", "_target", "_params", "_menuName", "_menuRsc", "_menus"];

// _this==[_target, _menuNameOrParams]
_target = _this select 0;
_params = _this select 1;

if ((_target distance player) > 2.5) exitWith {}; // TODO: Menu range is way to big, should not be > 2.5 - 3 m ! // Menu title still becomes shown though


_menuName = "";
_menuRsc = "popup";

if (typeName _params == typeName []) then {
	if (count _params < 1) exitWith {diag_log format["Error: Invalid params: %1, %2", _this, __FILE__]};
	_menuName = _params select 0;
	_menuRsc = if (count _params > 1) then {_params select 1} else {_menuRsc};
} else {
	_menuName = _params;
};

//-----------------------------------------------------------------------------

_menus = [
	[
		["tb3_main", "Person:", _menuRsc],
		[
			[
			format["Join %1's group", name cursorTarget],
			"[cursorTarget] execVM 'scripts\groups\joinGroup.sqf'",
			"", "", "", -1, 1, (alive cursorTarget)
			]
		]
	]
];

//-----------------------------------------------------------------------------

_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2", str _menuName, if (_menuName == "") then {_params} else {""}];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _params, __FILE__];
};

_menuDef // return value
