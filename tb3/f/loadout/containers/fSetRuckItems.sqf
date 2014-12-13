private ["_unit", "_items", "_addThis", "_putMag", "_handled"];

_unit = _this select 0;
_handled = false;


if ( !isNull(backpackContainer _unit) ) then // dealing with a BIS backpack
{
	if ( local _unit ) then 
	{
		_items = _this select 1;
		
		{
			for "_i" from 1 to (_x select 1) do {
				_unit addItemToBackpack (_x select 0);
			};
		} forEach _items;
		_handled = true;
	};
};
//diag_log "Done adding ruckItems";
_handled  // ret