diag_log "TB3: playerdeath.sqf init";
if (!local player) exitWith {};
diag_log "TB3: playerdeath.sqf running";
_specMode = (getNumber(TB3_Settings >> "General" >>  "spectator") == 1);
if (isNil"tb3_activateSpec") then { tb3_activateSpec = false; };
_specActive = false;

//PP Effects
_layerNoise = "tb3_playerDeath_noise" call bis_fnc_rscLayer;
_layerInterlacing = "tb3_playerDeath_interlacing" call bis_fnc_rscLayer;
_layerStatic = "tb3_playerDeath_static" call bis_fnc_rscLayer;
		
while {!_specActive} do {
	while {alive player} do {sleep 0.2};
	//Static effect on death
	_layerStatic cutrsc ["RscStatic","plain"]; //RGB screen blip
	sleep 0.5;
	RscNoise_color = [1,1,1,0];
	_layerNoise cutrsc ["RscNoise","black"];
	_layerStatic cutrsc ["RscStatic","plain"];
	sleep 0.5;
	RscNoise_color = [1,1,1,1];
	_layerInterlacing cutrsc ["RscInterlacing","plain"];
	//End of static effect
	//Fade sound and display message.
	2.5 fadesound 0;
	2.5 fademusic 0;
	
	if ( _specMode || tb3_activateSpec ) then { 
		titleText ["You are dead.\nEntering spectator mode...", "Plain", 0.6];

		if (!_specActive) then { [player] join grpNull; };
		while {!alive player} do {sleep 0.2}; // wait until the player respawns
		player setPos (getpos specpen); // move player to spec pen on respawn
        if (!_specActive) then { 
			_acreSpec = [true] call acre_api_fnc_setSpectator;
			//ACRE_SPECTATOR_VOLUME = 1;
			//ACRE_MUTE_SPECTATORS = false;
			_prePos		= [(getPosATL specloc select 0),(getPosATL specloc select 1),5];
			_preDir		= 0;

			[_prePos,_preDir] execVM "tb3\s\spec\spectator.sqf";
			_specActive = true;
		};
		
		//Casualty monitor stuff.
		if (side player == WEST) then { [-1, {WCasArr pushBack _this;},[player]] call CBA_fnc_globalExecute;};
		if (side player == EAST) then { [-1, {ECasArr pushBack _this;},[player]] call CBA_fnc_globalExecute;};
		if (side player == RESISTANCE) then { [-1, {RCasArr pushBack _this;},[player]] call CBA_fnc_globalExecute;};
		if (side player == CIVILIAN) then { [-1, {CCasArr pushBack _this;},[player]] call CBA_fnc_globalExecute;}; 
		
		
		//[[[player],"tb3\s\spec\casArr.sqf"],"BIS_fnc_execVM",false] spawn BIS_fnc_MP;
		
		player setCaptive true;
		player addEventHandler ["HandleDamage", {false}];
		{player removeMagazine _x} forEach magazines player;
		removeAllWeapons player;
		removeAllItems player;		
	} else {
		titleText ["You are dead.\nPlease wait to respawn...", "Plain", 0.6];
		while {!alive player} do {sleep 0.2}; // wait until the player respawns
	}:
	sleep 0.5;
	
	2.5 fadesound 1;
	2.5 fademusic 1;

	RscNoise_color = [1,1,1,1];
	_layerInterlacing cutrsc ["RscInterlacing","BLACK IN"];		
	
	sleep 0.5;
	_layerStatic cutrsc ["RscStatic","Plain"];
	sleep 0.5;
	RscNoise_color = [1,1,1,0];
	_layerNoise cutrsc ["RscNoise","Plain"];			

};
//if (true) exitWith {};

