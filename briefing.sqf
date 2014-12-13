/*----------------------------------------------------------------------------------------------------------------------
	The syntax for mk4_fCreateNote is as followed:
	[ [WEST] ,[ "noteSubject", "noteMessage"]] call mk4_fCreateNote;
	
	1st arg can be of type:
		BOOL -> true will make it show for every, while false will block it for everyone
		ARRAY -> You can also send a array of the following datatypes:
			SIDE -> Specify sides that are allowed to see the marker, [WEST] or [WEST, RESISTANCE]
			STRING -> To specify factions, [Bgrp3] or [Bgrp3, "CDF", "CIV_RU"]
			GROUP -> To specify groups, [BLU_1Plt_HQ, BLU_1Plt_1Sqd, BLU_1Plt_2Sqd]
			OBJECT -> To specify individual units, [plt_ldr, plt_sgt]
	
	2nd arg must contain an array containing 2 strings.
		1st -> Note Subject
		2nd -> Note Message
	
------------------------------------------------------------------------------------------------------------------------
	
	The syntax for mk4_fCreateTask is as follows:
	[["USMC"] , ["tskVarName", "taskSubject", "taskMessage"]] call mk4_fCreateTask;
OR
	[ [WEST, EAST] , ["tskVarName", "taskSubject", "taskMessage", [4000,4000]]] call mk4_fCreateTask;
	
	1st arg is the same as the first arg of mk4_fCreateNote, look there instead.
	
	2nd arg is an array that contains 3 strings:
		1st -> The variable name you want to give to this task, so you can reference the task later on
		2nd -> Task Subject
		3rd -> Task Message
		Optional
		4th -> Task destination
------------------------------------------------------------------------------------------------------------------------ */


// wait until the template has finished initializing
waitUntil { TB3_INIT };


_westPrelim = 
"
<br/>
<br/>Preliminaries:
<br/>Security of O-Group: O-Group secured by 2 Platoon.
<br/>Weather: Overcast, heavy rain.
<br/>First Light: 0545h
<br/>Last Light: 1820h
<br/>Time Now: 0700h
<br/>Forecast: Weather is expected to remain unchanged.
<br/>Moonstate: Waxing Crescent.
<br/>Visibility: Poor.
<br/>
";

_westSituation = 
"
<br/>
<br/>Situation:
<br/>1 Platoon is in blocking/security positions near Drozhino (grid. 035049).
<br/>2 Platoon is at FRP (grid. 044110).
<br/>We have been conducting offensive operations against local insurgent groups since the beginning of August.
<br/>Insurgent groups maintain little territorial control, instead conduct ambushes on local defence force and AAF convoys out of operating bases, most often structures seized from the local civilian population or camps in the region’s forests.
<br/>Reliable sources have indicated one such base outside of Kozlovka (grid. 039047).
<br/>
";

_westESituation = 
"
<br/>
<br/>Situation Enemy:
<br/>i) Strength
<br/>Enemy estimated to be a platoon minus in strength.
<br/>
<br/>ii) Locations
<br/>The enemy have fixed positions at the buildings outside of Kozlovka (grid. 039047) designated: HOTEL MOSCOW, and are known to have patrols and sentry positions in the surrounding area.
<br/>
<br/>iii) Weapons
<br/>Enemy forces have been equipped with a mix of captured defence force equipment and AK pattern assault rifles brought in with the recent influx of foreign fighters
<br/>
<br/>iv) Equipment
<br/>They have 2 unarmed, and 1 armed transport vehicle and access to likely ammunition and weapons stores on site.
<br/>
<br/>v) Obstacles
<br/>The enemy are likely to have placed APERS mines in likely avenues of approach to the compound.
<br/>
<br/>vi) Defensive Fires
<br/>None
<br/>
<br/>vii) Air Threat
<br/>None.
<br/>
<br/>viii) Morale
<br/>Enemy Morale is high as they have been able to operate freely from this base due to the minimal presence of local defence force units in the area.
<br/>
<br/>ix) CBRN Threat
<br/>None.
<br/>
<br/>x) Future Intentions
<br/>The Enemy’s future intention is to maintain the objective as an operating base in order to conduct further attacks on AAF and local defence force units in the area.
<br/>The Enemy’s most likely course of action is to attempt to defend in place, while reinforcing forward fighting positions. Their most deadly is to fix attackers with machine gun fire, flank with nearby patrols to destroy the attack.
<br/>
";

_westFSituation = 
"
<br/>
<br/>Situation Friendly:
<br/>i) Battalion Intent
<br/>The Battalion intent is to locate and secure known insurgent operating bases in the South Zagoria region in order to reduce insurgent capability to conduct attacks on friendly forces.
<br/>
<br/>ii) Company Mission
<br/>Assault and secure operating base near Kozlovka (grid. 039047).
<br/>
<br/>iii) Company Intent
<br/>The Company intent is to locate and secure known insurgent operating bases in the area around Zelenagorsk in order to reduce insurgent capability to conduct attacks on friendly forces.
<br/>
<br/>iv) Company Scheme of Manoeuvre
<br/>1 Platoon will remain in a blocking position near Drozhino.
<br/>2 Platoon will move around the East face of Windy Mountain to conduct a deliberate assault on the objective.
<br/>
<br/>v) Company’s Main Effort
<br/>Seizure of known operating base near Kozlovka (grid. 039047) in order to disrupt the activities of local insurgent groups in addition to acquiring intelligence as to the location and future plans of these groups.
<br/>
";

_westMission = 
"
<br/>
<br/>Mission:
<br/>2 Platoon, ASSAULT and SECURE known insurgent operations base, HOTEL MOSCOW, (grid. 039047) NLT 0800h Local.
<br/>
";

_westExecution = 
"
<br/>
<br/>Execution:
<br/>i) Commander’s Intent
<br/>To Seize enemy operating base, HOTEL MOSCOW (grid. 039047), by conducting a deliberate attack from our FRP at grid. 044110 no later than 0800h Local.
<br/>
<br/>ii) Scheme of Manoeuvre
<br/>At Platoon Commander's discretion
<br/>
<br/>iii) Main Effort
<br/>At Platoon Commander's discretion
<br/>
<br/>iv) Timings
<br/>H-Hour: At Platoon Commander's discretion
<br/>Objective Complete By: 0800h Local
<br/>
<br/>v) Control Measures
<br/>Line of Departure: 2 Platoon FRP (grid. 044110)
<br/>Report Lines: At Platoon Commander's discretion
<br/>Bounds: At Platoon Commander's discretion
<br/>Axis: At Platoon Commander's discretion
<br/>Boundaries: Windy mountain is our boundary to the West/SouthWest and Kozlovka is our boundary to the East/North East.
<br/>Method of Movement: Foot.
<br/>
<br/>vi) Surprise and Security
<br/>Flank Protection: None additional
<br/>Hide Areas: None
<br/>Deception: None
<br/>
<br/>vii) Actions On
<br/>Effective Enemy Fire: As per SOPs
<br/>Prisoners: Extract to Start Position
<br/>CivPop: Extract if possible/requested, otherwise ignore. Do not engage.
<br/>
<br/>viii) CBRN Plan
<br/>States: We are at CBRN State 0
<br/>Detection Plans: Visual and physical effects.
<br/>Alarms: Verbal 'Gas Gas Gas'
<br/>Reporting: Verbal 'Gas Gas Gas'
<br/>Contamination Countermeasures: None
<br/>
";

_westServiceSupport = 
"
<br/>
<br/>Service Support:
<br/>i) SOP Variations
<br/>Dress: NIL
<br/>Equipment: NIL
<br/>Weapons: NIL
<br/>Vehicle Loading: NIL
<br/>
<br/>ii) Logistic Support
<br/>Replen Plan: None for 24h
<br/>Ammunition: Riflemen carry spares belts of 5.56 and 60mm mortar bombs.
<br/>IPE: Helmets and body armour are to be worn at all times.
<br/>
<br/>iii) Medical
<br/>Location: NIL
<br/>CASEVAC: By foot.
<br/>Plan: NIL
<br/>Stretchers: NIL
<br/>Individual First Aid Kit: Contain 1x Bandage (Elastic), 1x Chest Seal, 1x Tourniquet, 2 x Quick Clot, 2 x Bandage
<br/>Morphine: CLS carries supply of morphine.
<br/>
";

_westCommandAndSignal = 
"
<br/>Command and Signals:
<br/>Command Location: At Platoon Commander's Discretion
<br/>
<br/>i)2 Platoon C Coy Chain of Command:
<br/>Platoon Commander.
<br/>Platoon Sergeant.
<br/>Section commanders by precedence.
<br/>
<br/>ii)2 Platoon C Coy Callsigns:
<br/>Copper 2'1 - 2 Platoon, 1 Section (A - Section IC. B - Section 2IC.)
<br/>Copper 2'2 - 2 Platoon, 2 Section (A - Section IC. B - Section 2IC.)
<br/>Copper 2'3 - 2 Platoon, 3 Section (A - Section IC. B - Section 2IC.)
<br/>Copper 2'0’A - 2 Platoon, Platoon Commander
<br/>Copper 2'0’B - 2 Platoon, Platoon Sergeant
<br/>Copper 2'0'Z - 2 Platoon, Platoon Signaller
<br/>
<br/>iii) Frequencies:
<br/>2 Platoon C Coy PRR:
<br/>Copper 2'0 - Channel 10
<br/>Copper 2'1 - Channel 11
<br/>Copper 2'2 - Channel 12
<br/>Copper 2'3 - Channel 13
<br/>
<br/>VHF:
<br/>031.125 MHz - A Company Net
<br/>   031.250 MHz - 1 Platoon Net
<br/>   031.375 MHz - 2 Platoon Net
<br/>   031.500 MHz - 3 Platoon Net
<br/>
<br/>036.275 MHz - B Company Net
<br/>   036.400 MHz - 1 Platoon Net
<br/>   036.550 MHz - 2 Platoon Net
<br/>   036.700 MHz - 3 Platoon Net
<br/>
<br/>041.425 MHz - C Company Net
<br/>   041.500 MHz - 1 Platoon Net
<br/>   041.625 MHz - 2 Platoon Net
<br/>   041.750 MHz - 3 Platoon Net
<br/>
<br/>046.150 MHz - Battalion HQ
<br/>051.850 MHz - Battalion Fires Net
<br/>
<br/>iv) Password:
<br/>Challenge: Foxtrot Uniform
<br/>Response: Charlie Kilo
<br/>Running: Sabre
<br/>Number Combo: 9
<br/>
";

_info = 
"
<br/> GENERAL INFORMATION 
<br/>
<br/> ----	Mission maker/s: ToadBall
<br/> ----	Respawn: None 
<br/> ----	JIP: Teleport to Squad Leader
<br/> ----	Medical: CSE
<br/> ----  End Conditions: Completion of objective with 30% casualties or fewer.
<br/> ----  Auto Fail Condition: N/A
<br/>
<br/> ----	tb3_template 0.60
<br/>
";


// -----------------------------------------------------  Briefing Notes   ----------------------------------------------------- //
// MISSION INFO
[[WEST, EAST, RESISTANCE, CIVILIAN], ["MISSION INFO", _info]] call tb3_fCreateNote;

// COMMAND & SIGNAL
[[WEST, RESISTANCE], ["COMMAND AND SIGNALS", _westCommandAndSignal]] call tb3_fCreateNote;

// Service Support
[[WEST, RESISTANCE], ["SERVICE SUPPORT", _westServiceSupport]] call tb3_fCreateNote;

// Execution
[[WEST, RESISTANCE], ["EXECUTION", _westExecution]] call tb3_fCreateNote;

// Mission
[[WEST, RESISTANCE], ["MISSION", _westMission]] call tb3_fCreateNote;

// Situation Friendly
[[WEST, RESISTANCE], ["   SITUATION FRIENDLY", _westFSituation]] call tb3_fCreateNote;

// Situation Enemy
[[WEST, RESISTANCE], ["   SITUATION ENEMY", _westESituation]] call tb3_fCreateNote;

// Situation
[[WEST, RESISTANCE], ["SITUATION", _westSituation]] call tb3_fCreateNote;

// Preliminaries
[[WEST, RESISTANCE], ["PRELIMINARIES", _westPrelim]] call tb3_fCreateNote;
// -----------------------------------------------------------------------------------------------------------------------------------//





// ----------------------------------------------------  Objective 1 ----------------------------------------------------- //
//_tskPrimarySub = "Objective 1";
//_tskPrimaryMsg = 
//"
//<br/>2 Platoon conducts assault on Sanaag Bari vicinity <marker name='obj1'>GS063049</marker>.
//";

//[[WEST], ["tskObjective1", _tskPrimarySub, _tskPrimaryMsg, (getMarkerPos "obj1")]] call tb3_fCreateTask;
//["tskObjective1"] call tb3_fAssignTask;
// -------------------------------------------------------------------------------------------------------------------------------------//