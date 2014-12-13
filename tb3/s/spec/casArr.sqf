//because both BI and CBA suck...
private ["_unit"];
 _unit = _this select 0;
switch ( side _unit ) do { 
	case WEST : { WCasArr = WCasArr + [_unit] };
	case EAST : { ECasArr = ECasArr + [_unit] };
	case RESISTANCE : { RCasArr = RCasArr + [_unit] };
	case CIVILIAN : { CCasArr = CCasArr + [_unit] };	
};

