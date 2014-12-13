private ["_msg","_unit"];

_unit = _this select 0;

_unit allowDammage (_this select 1); 
_msg = format["God Mode: %1", _this select 1];
diag_log _msg;
_unit globalChat _msg;
