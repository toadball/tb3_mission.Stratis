///////////////////////////////////////
// Detect the environment this node is in,  //
// and what kind of node this is.		//
///////////////////////////////////////


switch ( isDedicated ) do 
{
	case true:
	{
		isClient 		= false;
		isJIP 			= false;
		isAdmin 		= false;
		isAvailableAdmin = false;
	}; 
	case false:
	{
		isClient 		= true;
		isJIP 			= if ( isNull player ) then { waitUntil { !(isNull player) }; true } else { false };
		isAdmin 		= if ( isMultiplayer ) then { (serverCommandAvailable "#kick chapple") } else { true };
		/*isAvailableAdmin= if ( isMultiplayer ) then { 
			if (isClass (configFile >> "CfgPatches" >> "uo_a3_debugConsole")) then {
				tb3_UOadmins = call compile ("[" + (preprocessFile "\x\uo\addons\uo_a3_debugconsole\admins.sqf") + "]");
				(parseNumber(getPlayerUID player) in tb3_UOadmins);
			} else {(parseNumber(getPlayerUID player) in (getArray (TB3_Settings >> "Admin" >> "adminUIDs")))};
		}  else { false }; 
		*/
		// keep checking if this node is a logged-in admin
		[] spawn { while { true } do { sleep 10; isAdmin = (serverCommandAvailable "#kick chapple") || !isMultiplayer;	}; };
	};
};

TB3_INIT = true;


// Output what was discovered to the RPT	
diag_log text "";
diag_log text "Node Info:";
diag_log text format["isDedicated = %1", isDedicated];
diag_log text format["isServer = %1", isServer];
diag_log text format["isClient = %1", isClient];
diag_log text format["isMultiplayer = %1", isMultiplayer];
diag_log text format["isAdmin = %1", isAdmin];
//diag_log text format["isAvailableAdmin = %1", isAvailableAdmin];
diag_log text format["isJIP = %1", isJIP];
diag_log text "";


// end