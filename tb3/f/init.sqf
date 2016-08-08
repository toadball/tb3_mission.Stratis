// Briefing Functions
tb3_fCreateNote				= compile (preprocessFileLineNumbers "tb3\f\fCreateNote.sqf");
      
// Array Functions
tb3_fInMixedArray				= compile (preprocessFileLineNumbers "tb3\f\array\fInMixedArray.sqf");
tb3_fEnumMixedArray				= compile (preprocessFileLineNumbers "tb3\f\array\fEnumMixedArray.sqf");
//tb3_fArrayCountOccurrences			= compile (preprocessFileLineNumbers "tb3\f\array\fArrayCountOccurrences.sqf");

// Loadout Functions
tb3_fLoadout 				= compile (preprocessFileLineNumbers "tb3\f\loadout\fLoadout.sqf"); //runs sub functions for addition and removal of equipment
tb3_fSelectPrimaryMuzzle	= compile (preprocessFileLineNumbers "tb3\f\loadout\fSelectPrimaryMuzzle.sqf");

tb3_fSetItems				= compile (preprocessFileLineNumbers "tb3\f\loadout\fSetItems.sqf");
tb3_fSetLinkedItems				= compile (preprocessFileLineNumbers "tb3\f\loadout\fSetLinkedItems.sqf");
tb3_fsetMRE					= compile (preprocessFileLineNumbers "tb3\f\loadout\fSetMRE.sqf");


tb3_fSetUniform				= compile (preprocessFileLineNumbers "tb3\f\loadout\fSetUniform.sqf");
tb3_fSetVest				= compile (preprocessFileLineNumbers "tb3\f\loadout\fSetVest.sqf");
tb3_fSetHeadgear				= compile (preprocessFileLineNumbers "tb3\f\loadout\fSetHeadgear.sqf");
tb3_fSetGoggles				= compile (preprocessFileLineNumbers "tb3\f\loadout\fSetGoggles.sqf");
tb3_fSetBackpack				= compile (preprocessFileLineNumbers "tb3\f\loadout\fSetBackpack.sqf");

tb3_fSetWeapons				= compile (preprocessFileLineNumbers "tb3\f\loadout\fSetWeapons.sqf");
tb3_fSetMagazines				= compile (preprocessFileLineNumbers "tb3\f\loadout\fSetMagazines.sqf");
tb3_fSetLanguages				= compile (preprocessFileLineNumbers "tb3\f\loadout\fSetLanguages.sqf");
	//container specific gear
	tb3_fSetRuckContents		= compile (preprocessFileLineNumbers "tb3\f\loadout\containers\fSetRuckContents.sqf");
	tb3_fSetVestContents		= compile (preprocessFileLineNumbers "tb3\f\loadout\containers\fSetVestContents.sqf");
	tb3_fSetUniformContents		= compile (preprocessFileLineNumbers "tb3\f\loadout\containers\fSetUniformContents.sqf");
	
	
tb3_fSetVehCargoMagazines			= compile (preprocessFileLineNumbers "tb3\f\loadout\vehicleCargo\fSetVehCargoMagazines.sqf");
tb3_fSetVehCargoWeapons				= compile (preprocessFileLineNumbers "tb3\f\loadout\vehicleCargo\fSetVehCargoWeapons.sqf");
tb3_fSetVehCargoItems				= compile (preprocessFileLineNumbers "tb3\f\loadout\vehicleCargo\fSetVehCargoItems.sqf");
tb3_fSetVehCargoBackpacks				= compile (preprocessFileLineNumbers "tb3\f\loadout\vehicleCargo\fSetVehCargoRucks.sqf");

// Radio check (by beta, modified for A3) - Non functional with ACRE2 build 501
//tb3_freqCheck = compile preprocessFileLineNumbers "tb3\f\freqCheck.sqf";

// Debugger & Admin Tools
tb3_fSetCaptive = compile preprocessFileLineNumbers "tb3\f\debug\fSetCaptive.sqf";
tb3_fRecompileFunctions = compile preprocessFileLineNumbers "tb3\f\debug\fSetCaptive.sqf";
tb3_fMapTeleport = compile preprocessFileLineNumbers "tb3\f\debug\fMapTeleport.sqf";
//tb3_fGodMode = compile preprocessFileLineNumbers "tb3\f\debug\fGodMode.sqf";