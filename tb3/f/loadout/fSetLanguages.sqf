private ["_unit", "_languages", "_spokenLanguages", "_nativeLanguage", "_handled"];

_unit = _this select 0;
if ( local _unit ) then
{
	_languages = _this select 1;
	_spokenLanguages = _languages select 0;
	_spokenLanguages call acre_api_fnc_babelSetSpokenLanguages;	
	_unit setVariable ["TB3_babelSpokenLanguages",_spokenLanguages];
		
	if ((count _languages) > 1) then {
		_nativelanguage = _languages select 1;
		[_spokenLanguages select (_spokenLanguages find _nativeLanguage)] call acre_api_fnc_babelSetSpeakingLanguage;
		_unit setVariable ["TB3_babelNativeLanguage",[_nativelanguage]];
	} else {
		[_spokenLanguages select 0] call acre_api_fnc_babelSetSpeakingLanguage;
		_unit setVariable ["TB3_babelNativeLanguage",[_spokenLanguages select 0]];
	};
	
	_handled = true;
} else
{
	_handled = false;
};

_handled // ret