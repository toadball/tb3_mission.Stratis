waitUntil { TB3_INIT };
waitUntil {!isNil "CSE_ICON_PATH"};
sleep 10;

	//Primary Radial Stuff
	//[displayName STRING, condition CODE, icon STRING, onPressed CODE, toolTip STRING]
	//Custom Menu
	_entries = [
		[
			"AdminTools",
			{((isAvailableAdmin) || (isAdmin))},
			(CSE_ICON_PATH + "icon_backpack_radio.paa"),
			{[] call tb3_radialSub_adminTools},
			"Admin: Tools"
		],	
		[
			"Admin: ENDEX",
			{isAdmin},
			(CSE_ICON_PATH + "icon_backpack_radio.paa"),
			{["Test"] call tb3_radialSub_adminEndex},
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
			"Radio",
			{(IND_obj1Flag1 && !IND_obj1Flag1)},
			(CSE_ICON_PATH + "icon_backpack_radio.paa"),
			{[player] execVM 'tb3\s\radio\radioMessage_1.sqf'},
			"Radio: Objective Secure"
		]
	];
	["ActionMenu","equipment", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;

	//[TITLE, ICONPATCH, CODE, true, TOOLTIP]
	//Admin End Confirmation
	tb3_radialSub_adminEndex = {
		_subMenus = [
			[
				"CONFIRM",
				(CSE_ICON_PATH + "icon_interact.paa"),
				{closeDialog 0; [] execVM 'tb3\s\interaction\endAction.sqf'},
				true,
				"Confirm Mission End"
			],
			[
				"CANCEL",
				(CSE_ICON_PATH + "icon_return.paa"),
				{closeDialog 0},
				true,
				"Cancel Mission End"]
		];
		["ActionMenu", _subMenus, player, CSE_SELECTED_RADIAL_OPTION_N_GUI, true] call cse_fnc_openRadialSecondRing_GUI;
	};
	//Admin tools
	tb3_radialSub_adminTools = {
		_subMenus = [
			[
				"Captive On/Off",
				(CSE_ICON_PATH + "icon_interact.paa"),
				{closeDialog 0; [player] call tb3_fSetCaptive},
				{(isAdmin)},
				"AdminSetCaptive"
			],
			[
				"Map Teleport",
				(CSE_ICON_PATH + "icon_interact.paa"), 
				{closeDialog 0; [] call tb3_fMapTeleport},
				{(isAdmin)}, 
				"AdminMapTeleport"
			]
		];
		["ActionMenu", _subMenus, player, CSE_SELECTED_RADIAL_OPTION_N_GUI, true] call cse_fnc_openRadialSecondRing_GUI;
	};