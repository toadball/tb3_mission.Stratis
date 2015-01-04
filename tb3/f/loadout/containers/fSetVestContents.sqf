private ["_unit", "_vestContents", "_handled"];

_unit = _this select 0;
_handled = false;


if ( !isNull(vestContainer _unit) ) then // dealing with a BIS backpack
{
	if ( local _unit ) then 
	{
		_vestContents = _this select 1;
		
		{
			for "_i" from 1 to (_x select 1) do {
				if (_unit canAddItemToVest (_x select 0)) then {
					_unit addItemToVest (_x select 0);
				} else {
					diag_log Format ["TB3 Error: Not Enough space to add %1 to %2 (Vest)",(_x select 0),_unit];
				};
			};
		} forEach _vestContents;
		_handled = true;
	};
};
//diag_log "Done adding ruckItems";
_handled  // ret