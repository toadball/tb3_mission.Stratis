#define CHANGETIME 10

if ( mk4_debugMode == 3 ) then { [__FILE__] call mk4_fRegisterScript };


sleep CHANGETIME;

"mk4_weather" addPublicVariableEventHandler 
{ 
	_overcast 	= (_this select 1) select 0;
	_rain 		= (_this select 1) select 1;
	_fog 		= (_this select 1) select 2;
	
	if ( mk4_debugMode == 3 ) then { // if debug is high
		[__FILE__, __LINE__, "received new weather values", (_this select 1)] call mk4_fEcho;
	};
	
	CHANGETIME setOvercast _overcast;
	CHANGETIME setRain _rain;
	CHANGETIME setFog _fog;
}; 


if (isServer) then 
{
	while { true } do
	{
		mk4_weather = [overcast, rain, fog];
		publicVariable "mk4_weather";
		
		if ( mk4_debugMode == 3 ) then { // if debug is high
			[__FILE__, __LINE__, "sending new weather values over network", mk4_weather] call mk4_fEcho;
		};
		
		sleep 10;
	};
};


if ( mk4_debugMode == 3 ) then { [__FILE__] call mk4_fUnregisterScript };