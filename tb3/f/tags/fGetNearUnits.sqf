private ["_displayDistance","_result","_nearUnits","_playerSide"];

_displayDistance = _this select 0;
_displayBase = _displayDistance / 10;
_displayRange = 20;

_sunState = sunOrMoon;

if (_sunState <= 0.2) then {_displayDistance = 15};

_nearUnits = nearestObjects [player,["CAManBase"],_displayDistance] - [player];
_result = [];

_playerSide = player getVariable ["tb3_unitSide", side player];

{
	if ((vehicle _x) == _x) then {
		if (_sunState <= 0.2) then {
			if (currentVisionMode player > 0) then {
				_displayRange = _displayDistance;
			} else {
				_displayAdd		= 15 * moonIntensity;
				_displayRange = _displayBase + _displayAdd;
			};
		};

		if (_x getVariable ["tb3_unitSide", side _x] == _playerSide) then {
			_erf = terrainIntersect [eyePos player, eyePos _x];
			_obj = lineIntersects [eyePos player, eyePos _x, player];
			_dis = player distance _x;

			if (!_erf && !_obj && _dis <= _displayRange) then {
				_result set [(count _result), _x];
			};
		};
	};
} forEach _nearUnits;

_result