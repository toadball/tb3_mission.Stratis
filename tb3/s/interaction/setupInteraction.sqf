waitUntil { TB3_INIT };
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

//sleep 5;  //wait for start

//Self interaction
//["player", [DIK_APPS], -10, ["tb3\s\interaction\selfInteraction.sqf", "main"]] call CBA_ui_fnc_add;

//Interaction with others
//["CAManBase", [DIK_LWIN], 15, ["tb3\s\interaction\unitInteraction.sqf", "main"]] call CBA_ui_fnc_add;


	//Primary Radial Stuff
	//[displayName STRING, condition CODE, icon STRING, onPressed CODE, toolTip STRING]
	//Custom Menu
	_entries = [
		[
			"Admin: END",
			{isAdmin},
			(CSE_ICON_PATH + "icon_backpack_radio.paa"),
			{["Test"] call lynx_fnc_radialSub_adminEnd},
			"END MISSION"
		],
		[
			"Teleport",
			{(getNumber(TB3_Settings >> "General" >> "jipTeleport") == 1) && isJIP && (player getVariable ["tb3_canTeleport",true])},
			(CSE_ICON_PATH + "icon_movement.paa"),
			{[player] execVM 'tb3\s\jipTeleport.sqf'},
			"Teleport to SL"
		]
	];
	["ActionMenu","custom_actions", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;

	//Equipment Menu
	_entries = [
		[
			"Helmet",
			{(vehicleVarName player == "PLT2_MM" || vehicleVarName player == "PLT2_PL") && (headgear player == "rhs_fieldcap_helm" || headgear player == "rhs_6b27m")},
			(CSE_ICON_PATH + "icon_movement.paa"),
			{[player] execVM 'tb3\f\lynx\scripts\utilSwapcap.sqf'},
			"Swap Helmet/Field Cap"
		],
		[
			"Radio",
			{(lynx_objFriendly && !lynx_objEnemy)},
			(CSE_ICON_PATH + "icon_backpack_radio.paa"),
			{[player] execVM 'tb3\s\radio\radioMessage_1.sqf'},
			"Radio: Objective Secure"
		]
	];
	["ActionMenu","equipment", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;

	//[TITLE, ICONPATCH, CODE, true, TOOLTIP]
	//Admin End Confirmation
	lynx_fnc_radialSub_adminEnd = {
		_subMenus = [
			["CONFIRM", (CSE_ICON_PATH + "icon_interact.paa"), {closeDialog 0; [] execVM 'tb3\s\interaction\endAction.sqf'}, true, "Confirm Mission End"],
			["CANCEL", (CSE_ICON_PATH + "icon_return.paa"), {closeDialog 0}, true, "Cancel Mission End"]
		];
		["ActionMenu", _subMenus, player, CSE_SELECTED_RADIAL_OPTION_N_GUI, true] call cse_fnc_openRadialSecondRing_GUI;
	};