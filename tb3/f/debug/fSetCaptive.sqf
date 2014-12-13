private ["_unit","_msg"];

_unit = _this select 0;
_unit setCaptive !(captive _unit);
_msg = format["_unit setCaptive = %1", (captive _unit)];
_unit globalChat _msg;
diag_log _msg;