private ["_unit", "_mreArray", "_backItems", "_handled"];
 
_unit = _this select 0;
 
if ( (local _unit) && (!isNil backpack _unit) ) then
{
	   _mreArray = [
			"cse_US_MRE_ChiliBeans",
			"cse_US_MRE_ChickenFajita",
			"cse_US_MRE_ChickenNoodles",
			"cse_US_MRE_PorkSausageGravy",
			"cse_US_MRE_MedChicen",
			"cse_US_MRE_BeefRoastVeggies",
			"cse_US_MRE_BeefBrisket",
			"cse_US_MRE_BeefStew",
			"cse_US_MRE_ChiliMacaroni",
			"cse_US_MRE_VegetableLasagna",
			"cse_US_MRE_SpicyPennePasta",
			"cse_US_MRE_CheeseTortellini",
			"cse_US_MRE_Ratatouille",
			"cse_US_MRE_MexicanStyleChickenStew",        
			"cse_US_MRE_PorkRib",
			"cse_US_MRE_MapleSausage",
			"cse_US_MRE_BeefRavioli",
			"cse_US_MRE_SloppyJoe",
			"cse_US_MRE_SpaghettiMeatSauce",
			"cse_US_MRE_LemonPepperTuna",
			"cse_US_MRE_AsianBeefStrips",            
			"cse_US_MRE_ChickenPestoPasta",
			"cse_US_MRE_SouthwestStyleBeefBlackBeans",        
			"cse_US_MRE_MeatballMarinara"
		];
 
        _backItems = [
			"cse_canteen",
			"cse_canteen_half",
			"cse_Humanitarian_Ration"
        ] + [_mreArray call BIS_fnc_selectRandom] + [_mreArray call BIS_fnc_selectRandom];
 
       {_unit addItemToBackpack _x} forEach _backItems;
 
        _handled = true;
} else
{
        _handled = false;
};
 
_handled // ret