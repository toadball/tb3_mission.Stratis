
	if (isDedicated) exitWith {};
	if (isNil "tb3_nameTags_init") then {tb3_nameTags_init = true} else {if (tb3_nameTags_init) exitWith {diag_log format["Nametags already initialized for %1",player];}};

	disableSerialization;

	if (isNil "tb3_nameTags") then {tb3_nameTags = true};
	if (isNil "tb3_nameTags_drawDistance") then {tb3_nameTags_drawDistance = getNumber(missionConfigFile >> "TB3_Settings" >> "NameTags" >> "distance");};

	[{
		if (tb3_nameTags && alive player) then {
			_nearUnits = [tb3_nameTags_drawDistance] call tb3_fGetNearUnits;

			if (leader (group player) == player) then {
				{
					_unitTeam = _x getVariable ["tb3_nameTags_groupAssignment","MAIN"];
					if (_unitTeam != assignedTeam _x) then {
						_x setVariable ["tb3_nameTags_groupAssignment",assignedTeam _x,true];
					};
				} forEach units (group player);
			} else {
				{
					_unitTeam = _x getVariable ["tb3_nameTags_groupAssignment","MAIN"];
					if (_unitTeam != assignedTeam _x) then {
						_x assignTeam _unitTeam;
					};
				} forEach units (group player);
			};
		};
	}, 5] call CBA_fnc_addPerFrameHandler;

	[{
		if (tb3_nameTags && alive player) then {
			_nearUnits = [tb3_nameTags_drawDistance] call tb3_fGetNearUnits;

			if (count _nearUnits > 0) then {
				1 cutRsc ["tb3_nametagHUD","PLAIN"];
				_index = 0;
				_teamColor = [1,1,1,1];
				{
					if (_x in units group player) then {
						if (_x == leader (group player)) then {
							_teamColor = [0.85, 0.4, 0, 1]
						} else {
							_liveTeam = _x getVariable ["tb3_nameTags_groupAssignment","MAIN"];
							switch (_liveTeam) do {
								case "RED": 	{_teamColor = [1, 0, 0, 1]};
								case "GREEN": 	{_teamColor = [0, 1, 0, 1]};
								case "BLUE": 	{_teamColor = [0, 0, 1, 1]};
								case "YELLOW": 	{_teamColor = [0.85, 0.85, 0, 1]};
								default 		{_teamColor = [1,1,1,1]};
							};
						};
					} else {_teamColor = [0.8,0.8,0.8,1]};
					[_x, _index, _teamColor, tb3_nameTags_drawDistance] call tb3_fSetNameTag;
				} forEach _nearUnits;
			};
		};
	}, 0] call CBA_fnc_addPerFrameHandler;