//Written by beta
//Check if player is on a frequency


private ["_freq", "_flag"];

_freq = _this select 0;
_flag = false;

if (alive player) then
{
	if (!isNil {player getVariable "acre_active_radio"}) then
	{
		if ((([] call acre_api_fnc_getCurrentRadioState) select 0) == _freq) then
		{
			_flag = true;
		};
	};
};

_flag
