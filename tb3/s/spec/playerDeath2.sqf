_has_spec = false;
_message = "You are dead.\nEntering spectator mode...";
sleep 2;

if (!local player) exitWith {};

while {true} do
{
	while {alive player} do {sleep 0.2};
		
	titleText [_message, "BLACK", 0.2];
	sleep 1;
	titleText [_message, "BLACK FADED", 10];
    
    if (!_has_spec) then { [player] join grpNull; };
	
 	while {!alive player} do {sleep 0.2};
	
	player setPos (getpos specpen);
        if (!_has_spec) then { 
			[] execVM "tb3\s\spec\spectator.sqf"; 
			_has_spec = true; 
		} else { 
			titleText [_message, "BLACK IN", 0.2]; 
		};
   
	//Casualty monitor stuff.
	/*
	if (side player == WEST) then { [-1, {WCasArr = WCasArr + _this;},[player]] call CBA_fnc_globalExecute;};
	if (side player == EAST) then { [-1, {ECasArr = ECasArr + _this;},[player]] call CBA_fnc_globalExecute;};
	if (side player == RESISTANCE) then { [-1, {RCasArr = RCasArr + _this;},[player]] call CBA_fnc_globalExecute;};
	if (side player == CIVILIAN) then { [-1, {CCasArr = CCasArr + _this;},[player]] call CBA_fnc_globalExecute;}; 
	*/
	
	[[[player],"tb3\s\spec\casArr.sqf"],"BIS_fnc_execVM",false] spawn BIS_fnc_MP;
	
	player setCaptive true;
	player addEventHandler ["HandleDamage", {false}];
	{player removeMagazine _x} forEach magazines player;
	removeAllWeapons player;
	removeAllItems player;
};
//if (true) exitWith {};

