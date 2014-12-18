	/////////////////////////////////////////////////////////////////////
	//  This script will initialize all major functions of the mk4/TB3 mission template  //
	//														     //
	//						DO NOT MODIFY       SORRY MIKE!                                   //
	/////////////////////////////////////////////////////////////////////

	
if (!isNil "TB3_INIT" ) exitWith {};
TB3_INIT = false;

	
// Place a mission info header in the RPT
diag_log text ""; 
diag_log text format["|=============================  %1 @ %2 =============================|", missionName, worldName]; 
diag_log text "";
diag_log text " tb3 template 0.80";
diag_log text format[" init method: %1", _this select 0];
diag_log text "";
diag_log text "|======================================================================================|"; 
diag_log text "";


// Initialize important variables 
TB3_ACRE = isClass(configFile >> "CfgPatches" >> "ACRE_Main");
TB3_ACE = isClass(configFile >> "CfgPatches" >> "ACE_Main");
TB3_Settings = (missionConfigFile >> "TB3_Settings");
TB3_missionFilePathLength = (count(toArray(__FILE__)) - 18); 
TB3_adminendex = false;


TB3_requireVersion = 8; // the required version of the description.ext
WCasRate = 0; WCasNum = 0; WStartNum = 0; WCasArr = [];
ECasRate = 0; ECasNum = 0; EStartNum = 0; ECasArr = [];
RCasRate = 0; RCasNum = 0; RStartNum = 0; RCasArr = [];
CCasRate = 0; CCasNum = 0; CStartNum = 0; CCasArr = [];


// Discover what this node is
[] spawn compile (preprocessFileLineNumbers "tb3\s\nodeDiscovery.sqf");

// Initialize all functions
call compile (preprocessFileLineNumbers "tb3\f\init.sqf");

// Run the user defined pre_init
call compile (preprocessFileLineNumbers "preinit.sqf");


/////////////////////////////////////////////////////////
// Start going through the settings and start the chosen scripts //
/////////////////////////////////////////////////////////


// check if the description.ext version is supported by this version of the template 
if ( TB3_requireVersion != getNumber(TB3_Settings >> "General" >> "version") ) then
{
	[] spawn { 
		waitUntil { time > 0 }; 
		hintC format["Your description.ext version is incompatible with the current version of the template. 
					\n\nYour version: %1
					\nRequired version: %2", getNumber(TB3_Settings >> "General" >> "version"), TB3_requireVersion];
	};
};

// run the code field in the parameters
if ( getNumber(TB3_Settings >> "General" >> "processParams") == 1 ) then { 
	call compile (preprocessFileLineNumbers "tb3\s\processParams.sqf"); diag_log "TB3 Init: processParams check";
};

// Disable saving in the MP editor?
if ( (getNumber(TB3_Settings >> "General" >> "enableSaving") == 0) && !isDedicated ) then { 
	enableSaving [false, false]; diag_log "TB3 Init: enableSaving check";
};

// Enable mission monitor?
if ( (getNumber(TB3_Settings >> "General" >> "missionMonitor") == 1) && isServer ) then {
	[] execVM "tb3\s\monitor.sqf"; diag_log "TB3 Init: missionMonitor check";
};

// grab mission endings and monitor their conditions
if ( isServer ) then {
	[] execVM "tb3\s\processEndings.sqf"; diag_log "TB3 Init: processEndings check";
};

// Start dynamic View Distance?
if ( getNumber(TB3_Settings >> "General" >>  "dynamicViewDistance") == 1 ) then 
{
	[] execVM "tb3\s\dynamicViewDistance.sqf"; diag_log "TB3 Init: dynamicViewDistance check";
};

// Start name tag script (by TinfoilHate, modified by toadball)
if ( getNumber(TB3_Settings >> "General" >> "enableNameTags") == 1 ) then 
{
	if(!(isClass(configFile >> "CfgPatches" >> "uo_a3_nametags"))) then {
		tb3_nameTags = true;
		[] execVM "tb3\s\nametags.sqf";
	} else {
		uo_a3_nameHUD_active = true;
	}; diag_log "TB3 Init: enableNameTags check";
};

//Setup fleximenu stuff
if ( getNumber(TB3_Settings >> "General" >> "enableFlexiMenu") == 1 ) then 
{
	[] execVM "tb3\s\interaction\setupInteraction.sqf"; diag_log "TB3 Init: enableFlexiMenu check";
};

// Start spectator handling
if ( getNumber(TB3_Settings >> "General" >>  "spectator") > 0 ) then 
{
	tb3_activateSpec = false; //used to activate spec on respawn dynamically
	[] spawn {  waitUntil {!isNull player}; [] execVM "tb3\s\spec\playerDeath.sqf";  diag_log "TB3 Init: spectator check"; };
};

// Start AI hearing
if ( getNumber(TB3_Settings >> "General" >>  "aiHearTalk") == 1 ) then 
{
	[] execVM "tb3\s\ai\aiHearTalk.sqf";  diag_log "TB3 Init: aiHearTalk check";
};

////////////////////
// ACRE2 settings //
////////////////////

if ( (!isDedicated) && {TB3_ACRE && (getNumber(TB3_Settings >> "ACRE2" >>  "babelEnabled") == 1)} ) then 
{
	if (getNumber(TB3_Settings >> "ACRE2" >>  "babelEnabled") == 1) then {TB3_babelEnabled = true} else {TB3_babelEnabled = false};
	TB3_babelLanguages = getArray(TB3_Settings >> "ACRE2" >>  "babelLanguages");
	if (count TB3_babelLanguages > 0) then	{{ _x call acre_api_fnc_babelAddLanguageType; } forEach TB3_babelLanguages;};	
};


///////////////////
// ACE settings //
//////////////////
/*
ace_sys_tracking_markers_enabled = if ( getNumber(MK4_Settings >> "ACE" >> "tracking") == 1 ) then { true } else { false };
ace_sys_tracking_enabled = if ( getNumber(MK4_Settings >> "ACE" >> "tracking") == 1 ) then { true } else { false };
ace_sys_spectator_playable_only = if ( getNumber(MK4_Settings >> "ACE" >> "spectatePlayable") == 1 ) then { true } else { false };
ace_sys_spectator_no_butterfly_mode = if ( getNumber(MK4_Settings >> "ACE" >> "spectateNoButterfly") == 1 ) then { true } else { false };
ACE_NoStaminaEffects = if ( getNumber(MK4_Settings >> "ACE" >> "noStaminaEffects") == 1 ) then { true } else { false };
ACE_NO_RECOGNIZE = if ( getNumber(MK4_Settings >> "ACE" >> "noRecognize") == 1 ) then { true } else { false };
*/



// Select primary muzzle and put the unit in a safe stance and some other stuff
[] spawn {
	waitUntil { TB3_INIT };
	player setVariable ["tb3_unitSide", side player, true];
	[player] call TB3_fSelectPrimaryMuzzle;
};


