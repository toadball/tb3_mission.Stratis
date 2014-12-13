

	[-1, {b_radio globalChat "'Blackjack this is Blackjack 1, over.'";}] call CBA_fnc_globalExecute;
	sleep 2.5;
	[-1, {b_radio globalChat "'Blackjack 1 this is Blackjack, send message.'";}] call CBA_fnc_globalExecute;
	sleep 2.5;
	[-1, {b_radio globalChat "'Blackjack, Blackjack 1 has secured Objective 2, over.'";}] call CBA_fnc_globalExecute;
	sleep 2.5;
	[-1, {b_radio globalChat "'Blackjack 1, Roger. Out.'";}] call CBA_fnc_globalExecute;
	
	BLUFOR_obj2Flag = true;
	publicVariable "BLUFOR_obj2Flag";