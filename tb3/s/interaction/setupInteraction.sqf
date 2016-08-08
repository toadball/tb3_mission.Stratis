waitUntil { TB3_INIT };
sleep 5;

	//TB3 Mission Actions
	_mission_main = ["tb3_mission_main", "TB3 Mission Actions", "a3\ui_f\data\map\Diary\Icons\playervirtual_ca.paa", {}, {true}] call ace_interact_menu_fnc_createAction;	
	_mission_radioAction = ["tb3_mission_obj1", "Report: Objective 1 Completion", "a3\ui_f\data\map\Diary\signal_ca.paa", {hint "FART"; tb3 globalChat "FART";}, { [player, 'ACRE_PRC117F'] call acre_api_fnc_hasKindOfRadio}] call ace_interact_menu_fnc_createAction;
	_mission_jipAction = ["tb3_mission_jtele", "JIP Teleport to SL", "a3\ui_f\data\map\Markers\Military\end_ca.paa", {[player] execVM 'tb3\s\jipTeleport.sqf'}, {(getNumber(TB3_Settings >> 'General' >> 'jipTeleport') == 1) && (isJip) && (player getVariable ['tb3_canTeleport',true])}] call ace_interact_menu_fnc_createAction;

	[player, 1, ["ACE_SelfActions"], _mission_main ] call ace_interact_menu_fnc_addActionToObject;	
	[player, 1, ["ACE_SelfActions","tb3_mission_main"], _mission_radioAction ] call ace_interact_menu_fnc_addActionToObject ;
	[player, 1, ["ACE_SelfActions", "tb3_mission_main"], _mission_jipAction ] call ace_interact_menu_fnc_addActionToObject;	
	
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