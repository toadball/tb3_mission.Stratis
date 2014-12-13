// Move _unit 3m behind his group leader or into leader's vehicle
// By Megagoth1702, thanks to Sandiford and Cheesenoggin, slightly modified by ZZEZ

private ["_unit","_leader","_LX","_LY","_LZ"];
	_unit = _this select 0;
	_leader = leader _unit;

	if (_leader == _unit) exitWith {_unit sideChat "You are the group leader, cannot teleport."; _unit setVariable ["tb3_canTeleport",false];};
	
	if (_leader distance specPen < 100) exitWith {_unit sideChat "There is no-one to teleport to."; _unit setVariable ["tb3_canTeleport",false];};

	if (vehicle _leader == _leader) then
	{
		_LX = (getpos _leader select 0) + (3*sin ((getDir _leader) -180));
		_LY = (getpos _leader select 1) + (3*cos ((getDir _leader) -180));
		_LZ = (getpos _leader select 2);

		_unit setpos [_LX,_LY,_LZ];
		_unit setUnitPos "DOWN";
		_unit setVariable ["tb3_canTeleport",false];
	}
	else
	{
		if ((vehicle _leader) emptyPositions "cargo" == 0) then
		{
			hint "No room in Section Leader's vehicle."
		}
		else
		{
			_unit moveincargo vehicle _leader;
			_unit setVariable ["tb3_canTeleport",false];
		};
	};
	
	