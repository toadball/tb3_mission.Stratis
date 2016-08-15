	// Radio Setup
	
	["ACRE_PRC152", "default", "tb3_blu1"] call acre_api_fnc_copyPreset;
	["ACRE_PRC117F", "default", "tb3_blu1"] call acre_api_fnc_copyPreset;

	["ACRE_PRC152", "deth", 1, "name", "A1 PLTNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC152", "deth", 2, "name", "A1 VICNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC152", "deth", 3, "name", "A1 SPRNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC152", "deth", 4, "name", "A2 PLTNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC152", "deth", 5, "name", "A2 VICNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC152", "deth", 6, "name", "A2 SPRNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC152", "deth", 7, "name", "A3 PLTNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC152", "deth", 8, "name", "A3 VICNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC152", "deth", 9, "name", "A3 SPRNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC152", "deth", 10, "name", "A COYNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC152", "deth", 41, "name", "BATTALION"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC152", "deth", 42, "name", "BATT FIRES"] call acre_api_fnc_setPresetChannelField;
	
	["ACRE_PRC117F", "deth", 1, "name", "A1 PLTNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "deth", 2, "name", "A1 VICNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "deth", 3, "name", "A1 SPRNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "deth", 4, "name", "A2 PLTNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "deth", 5, "name", "A2 VICNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "deth", 6, "name", "A2 SPRNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "deth", 7, "name", "A3 PLTNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "deth", 8, "name", "A3 VICNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "deth", 9, "name", "A3 SPRNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "deth", 10, "name", "A COYNET"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "deth", 41, "name", "BATTALION"] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "deth", 42, "name", "BATT FIRES"] call acre_api_fnc_setPresetChannelField;
	
	["ACRE_PRC117F", "deth"] call acre_api_fnc_setPreset;
	["ACRE_PRC152", "deth"] call acre_api_fnc_setPreset;