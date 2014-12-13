private ["_beginTime","_endTime"];

_beginTime = diag_tickTime;
call compile (preprocessFileLineNumbers "tb3\f\init.sqf");
_endTime = diag_tickTime;

diag_log format["All functions recompiled succesfully in %1 seconds", (_endTime - _beginTime)];