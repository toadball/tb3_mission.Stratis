private ["_unit", "_language", "_handled"];
waitUntil { TB3_INIT };

_unit = _this select 0;

if ( local _unit ) then
{
	_language = _this select 1;
	
	//[_language select 0] call acre_api_fnc_babelSetSpeakingLanguage;
	_language call acre_api_fnc_babelSetSpokenLanguages;	
	diag_log format ["BabelSpokenLanguages on: %1 = %2",_unit,_language];
	_handled = true;
} else
{
	_handled = false;
};

_handled // ret