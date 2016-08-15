// Modified from Tin's, he does shit that works.

private ["_unit","_group","_radioList"];

	_unit = player;
	_group = str(group _unit);

	waitUntil {[] call acre_api_fnc_isInitialized};

	_radioList = [] call acre_api_fnc_getCurrentRadioList;
	switch _group do {
		case "B ASH 1'0": {
			{if ([_x, "ACRE_PRC343"] call acre_api_fnc_isKindOf) then {[_x,5] call acre_api_fnc_setRadioChannel; [_x,"LEFT"] call acre_api_fnc_setRadioSpatial}} forEach _radioList;
			{if ([_x, "ACRE_PRC152"] call acre_api_fnc_isKindOf) then {[_x,1] call acre_api_fnc_setRadioChannel;}} forEach _radioList;
			{if ([_x, "ACRE_PRC117F"] call acre_api_fnc_isKindOf) then {[_x,10] call acre_api_fnc_setRadioChannel;}} forEach _radioList;
		};
		case "B ASH 1'0V": {
			{if ([_x, "ACRE_PRC343"] call acre_api_fnc_isKindOf) then {[_x,5] call acre_api_fnc_setRadioChannel; [_x,"LEFT"] call acre_api_fnc_setRadioSpatial}} forEach _radioList;
			{if ([_x, "ACRE_PRC152"] call acre_api_fnc_isKindOf) then {[_x,2] call acre_api_fnc_setRadioChannel;}} forEach _radioList;
		};
		case "B ASH 1'1": {
			{if ([_x, "ACRE_PRC343"] call acre_api_fnc_isKindOf) then {[_x,1] call acre_api_fnc_setRadioChannel; [_x,"LEFT"] call acre_api_fnc_setRadioSpatial}} forEach _radioList;
			{if ([_x, "ACRE_PRC152"] call acre_api_fnc_isKindOf) then {[_x,1] call acre_api_fnc_setRadioChannel;}} forEach _radioList;
		};
		case "B ASH 1'1V": {
			{if ([_x, "ACRE_PRC343"] call acre_api_fnc_isKindOf) then {[_x,1] call acre_api_fnc_setRadioChannel; [_x,"LEFT"] call acre_api_fnc_setRadioSpatial}} forEach _radioList;
			{if ([_x, "ACRE_PRC152"] call acre_api_fnc_isKindOf) then {[_x,2] call acre_api_fnc_setRadioChannel;}} forEach _radioList;
		};
		case "B ASH 1'2": {
			{if ([_x, "ACRE_PRC343"] call acre_api_fnc_isKindOf) then {[_x,2] call acre_api_fnc_setRadioChannel; [_x,"LEFT"] call acre_api_fnc_setRadioSpatial}} forEach _radioList;
			{if ([_x, "ACRE_PRC152"] call acre_api_fnc_isKindOf) then {[_x,1] call acre_api_fnc_setRadioChannel;}} forEach _radioList;
		};
		case "B ASH 1'2V": {
			{if ([_x, "ACRE_PRC343"] call acre_api_fnc_isKindOf) then {[_x,2] call acre_api_fnc_setRadioChannel; [_x,"LEFT"] call acre_api_fnc_setRadioSpatial}} forEach _radioList;
			{if ([_x, "ACRE_PRC152"] call acre_api_fnc_isKindOf) then {[_x,2] call acre_api_fnc_setRadioChannel;}} forEach _radioList;
		};
		case "B ASH 1'3": {
			{if ([_x, "ACRE_PRC343"] call acre_api_fnc_isKindOf) then {[_x,3] call acre_api_fnc_setRadioChannel; [_x,"LEFT"] call acre_api_fnc_setRadioSpatial}} forEach _radioList;
			{if ([_x, "ACRE_PRC152"] call acre_api_fnc_isKindOf) then {[_x,1] call acre_api_fnc_setRadioChannel;}} forEach _radioList;
		};
		case "B ASH 1'3V": {
			{if ([_x, "ACRE_PRC343"] call acre_api_fnc_isKindOf) then {[_x,3] call acre_api_fnc_setRadioChannel; [_x,"LEFT"] call acre_api_fnc_setRadioSpatial}} forEach _radioList;
			{if ([_x, "ACRE_PRC152"] call acre_api_fnc_isKindOf) then {[_x,2] call acre_api_fnc_setRadioChannel;}} forEach _radioList;
		};
		case "B ASH 0'4": {
			{if ([_x, "ACRE_PRC343"] call acre_api_fnc_isKindOf) then {[_x,4] call acre_api_fnc_setRadioChannel; [_x,"LEFT"] call acre_api_fnc_setRadioSpatial}} forEach _radioList;
			{if ([_x, "ACRE_PRC152"] call acre_api_fnc_isKindOf) then {[_x,1] call acre_api_fnc_setRadioChannel;}} forEach _radioList;
		};
		case "B ASH 0'4V": {
			{if ([_x, "ACRE_PRC343"] call acre_api_fnc_isKindOf) then {[_x,4] call acre_api_fnc_setRadioChannel; [_x,"LEFT"] call acre_api_fnc_setRadioSpatial}} forEach _radioList;
			{if ([_x, "ACRE_PRC152"] call acre_api_fnc_isKindOf) then {[_x,2] call acre_api_fnc_setRadioChannel;}} forEach _radioList;
		};
		case "B ASH 0'M": {
			{if ([_x, "ACRE_PRC343"] call acre_api_fnc_isKindOf) then {[_x,6] call acre_api_fnc_setRadioChannel; [_x,"LEFT"] call acre_api_fnc_setRadioSpatial}} forEach _radioList;
			{if ([_x, "ACRE_PRC152"] call acre_api_fnc_isKindOf) then {[_x,1] call acre_api_fnc_setRadioChannel;}} forEach _radioList;
		};
	};