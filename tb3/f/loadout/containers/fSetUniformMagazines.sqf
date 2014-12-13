private ["_unit", "_magazines", "_addThis", "_putMag", "_handled"];

_unit = _this select 0;

_handled = false;


if ( !isNull(uniformContainer _unit) ) then
{
	if ( local _unit ) then 
	{
		_magazines = _this select 1;
		{
			for "_i" from 1 to (_x select 1) do {
				_unit addItemToUniform (_x select 0);
			};
		} forEach _magazines;
		_handled = true;
	};
};

_handled  // ret