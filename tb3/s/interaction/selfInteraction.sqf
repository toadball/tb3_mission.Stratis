//Written by beta
//Self interaction setup

#include "\a3\editor_f\Data\Scripts\dikCodes.h"

private ["_menuDef", "_target", "_params", "_menuName", "_menuRsc", "_menus"];

// _this==[_target, _menuNameOrParams]
_target = _this select 0;
_params = _this select 1;

_menuName = "";
_menuRsc = "buttonList";

if (typeName _params == typeName []) then {
	if (count _params < 1) exitWith {diag_log format["Error: Invalid params: %1, %2", _this, __FILE__]};
	_menuName = _params select 0;
	_menuRsc = if (count _params > 1) then {_params select 1} else {_menuRsc};
} else {
	_menuName = _params;
};

//-----------------------------------------------------------------------------

private ["_weaponArray", "_radioMsgArray"];

_weaponArray = [];

//-----------------------------------------------------------------------------
/*
			[
			"Admin: End Mission", "", "", "",
			["scripts\interaction\selfInteraction.sqf", "end", 1],
			-1, 1, ((getPlayerUID player) in UO_admins)
			],
*/
_menus =
[
	[
		["main", "Main Menu", _menuRsc],
		[
			//[
			//"Radio: Objective Secure",
			//"[player] execVM 'tb3\s\radio\radioMessage_1.sqf'",
			//"","","", -1, 1, ([51.850] call tb3_freqCheck)
			//],
			
			
			
			//Framework specific Flexi menu entries, deactivate via description.ext settings
			[
			"Nametags", "", "", "",
			["tb3\s\interaction\selfInteraction.sqf", "", 1],
			-1, 1, ((getNumber(TB3_Settings >> "General" >> "enableNameTags") == 1) && (!uo_a3_nameHUD_active))
			],
			[
			"Teleport to SL",
			"[player] execVM 'tb3\s\jipTeleport.sqf'",
			"","","", -1, 1, ((getNumber(TB3_Settings >> "General" >> "jipTeleport") == 1) && isJIP && (player getVariable ["tb3_canTeleport",true]))	
			],			
			[
			"Admin: End Mission", "", "", "",
			["tb3\s\interaction\selfInteraction.sqf", "tb3_end", 1],
			-1, 1, (isAdmin)
			],
			[
			"Admin Controls", "", "", "",
			["tb3\s\interaction\selfInteraction.sqf", "tb3_admin", 1],
			-1, 1, (isAvailableAdmin)
			]
		]
	]
];

if (_menuName == "tb3_end") then {
	_menus set [count _menus,
		[
			["tb3_end", "Admin: End Mission", "popup", ""],
			[
				[
				"Confirm",
				"[] execVM 'tb3\s\interaction\endAction.sqf'",
				"", "", "", -1, true, true
				]
			]
		]
	];
};
if (_menuName == "tb3_tags") then {
	_menus set [count _menus,
		[
			["tb3_tags", "Nametags", "popup", ""],
			[
				[
				"Enable",
				"[1] execVM 'tb3\s\tagSwitch.sqf'",
				"", "", "", -1, true, ((!tb3_nameTags) && (!uo_a3_nameHUD_active))
				],
				[
				"Disable",
				"[0] execVM 'tb3\s\tagSwitch.sqf'",
				"", "", "", -1, true, ((tb3_nameTags) && (!uo_a3_nameHUD_active))
				]
			]
		]
	];
};
if (_menuName == "tb3_admin") then {
	_menus set [count _menus,
		[
			["tb3_admin", "Options", "popup", ""],
			[
				[
				"Captive On/Off",
				"[player] call tb3_fSetCaptive",
				"", "", "", -1, true, (isAdmin)
				],
				[
				"Map Teleport",
				"[] call tb3_fMapTeleport",
				"", "", "", -1, true, (isAdmin)
				]
			]
		]
	];
};
//-----------------------------------------------------------------------------

_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this} else {""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};

_menuDef // return value
