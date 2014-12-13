
	[-1, {tb3 globalChat "'Hello Copper 0, this is Copper 2, over.'";}] call CBA_fnc_globalExecute;
	sleep 2.5;
	[-1, {tb3 globalChat "'Hello, Copper 2 this is Copper 0, go ahead.'";}] call CBA_fnc_globalExecute;
	sleep 2.5;
	[-1, {tb3 globalChat "'Copper 2, objective secured, over.'";}] call CBA_fnc_globalExecute;
	sleep 2.5;
	[-1, {tb3 globalChat "'0, Roger. Out.'";}] call CBA_fnc_globalExecute;
	sleep 5;
	BLUFOR_end2 = true;
	publicVariable "BLUFOR_end2";