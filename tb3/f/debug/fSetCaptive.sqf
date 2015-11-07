private ["_unit","_msg"];

_unit = _this select 0;
_unit setCaptive !(captive _unit);
_msg = format["%1 setCaptive = %2", _unit,(captive _unit)];
hintSilent _msg;

diag_log _msg;