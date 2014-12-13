private ["_unit", "_items", "_addThis", "_putMag", "_handled"];

_unit = _this select 0;

_handled = false;


if ( !isNull(vestContainer _unit) ) then
{
	if ( local _unit ) then 
	{
		_items = _this select 1;
		{
			for "_i" from 1 to (_x select 1) do {
				_unit addItemToVest (_x select 0);
			};
		} forEach _items;
		_handled = true;
	};
};
//diag_log "Done adding vestItems";
_handled  // ret