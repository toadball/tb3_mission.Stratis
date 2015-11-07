waitUntil { TB3_INIT };
sleep 5;

	// End the Mission
	_radioAction = ["obj_taken", "Report: Objective Completion", "a3\ui_f\data\map\Diary\signal_ca.paa", {hint "FART"; tb3 globalChat "FART";}, { [player, 'ACRE_PRC117F'] call acre_api_fnc_hasKindOfRadio}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions","ACE_Equipment"], _radioAction] call ace_interact_menu_fnc_addActionToObject ;
	
	// JIP Tele
	_jipAction = ["jtele", "Teleport to SL", "a3\ui_f\data\map\Markers\Military\end_ca.paa", {[player] execVM 'tb3\s\jipTeleport.sqf'}, {(getNumber(TB3_Settings >> 'General' >> 'jipTeleport') == 1) && (player getVariable ['tb3_canTeleport',false])}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions","ACE_Equipment"], _jipAction] call ace_interact_menu_fnc_addActionToObject ;
	
	//TB3 Admin Menu
	_admin_main = ["tb3_admin_main", "TB3 Admin Tools", "a3\ui_f\data\map\Diary\Icons\playervirtual_ca.paa", {}, {isAdmin}] call ace_interact_menu_fnc_createAction;
	_admin_end = ["tb3_admin_end", "End Mission", "a3\ui_f\data\map\Markers\Military\warning_ca.paa", {}, {isAdmin}] call ace_interact_menu_fnc_createAction;
	_admin_end_confirm = ["tb3_admin_end_confirm", "Confirm: End Mission?", "a3\ui_f\data\map\Markers\Military\warning_ca.paa", {[] execVM 'tb3\s\interaction\endAction.sqf'}, {isAdmin}] call ace_interact_menu_fnc_createAction;
	_admin_teleport = ["tb3_admin_teleport", "Map Teleport", "a3\ui_f\data\map\Markers\Military\end_ca.paa", {[] call tb3_fMapTeleport}, {isAdmin}] call ace_interact_menu_fnc_createAction;
	_admin_captive = ["tb3_admin_captive", "Captive On/Off", "a3\ui_f\data\map\VehicleIcons\iconman_ca.paa", {[player] call tb3_fSetCaptive}, {isAdmin}] call ace_interact_menu_fnc_createAction;
	
	[player, 1, ["ACE_SelfActions"], _admin_main] call ace_interact_menu_fnc_addActionToObject ;	
	    [player, 1, ["ACE_SelfActions","tb3_admin_main"], _admin_end] call ace_interact_menu_fnc_addActionToObject ;
	    [player, 1, ["ACE_SelfActions","tb3_admin_main","tb3_admin_end"], _admin_end_confirm] call ace_interact_menu_fnc_addActionToObject ;
		    [player, 1, ["ACE_SelfActions","tb3_admin_main"], _admin_teleport] call ace_interact_menu_fnc_addActionToObject ;
	    [player, 1, ["ACE_SelfActions","tb3_admin_main"], _admin_captive] call ace_interact_menu_fnc_addActionToObject ;