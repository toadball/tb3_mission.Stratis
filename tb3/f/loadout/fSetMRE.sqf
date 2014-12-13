private ["_unit", "_items", "_handled"];
 
_unit = _this select 0;
 
if ( (local _unit) && (!isNil backpack _unit) ) then
{
        _mreArray = [
                "cse_MRE_ChickenHerbDumplings",
                "cse_MRE_ChickenTikkaMassala",
                "cse_MRE_CreamChickenSoup",
                "cse_MRE_CreamTomatoSoup",
                "cse_MRE_LambC",
                "cse_MRE_MeatballsPasta",
                "cse_MRE_Rice",
                "cse_MRE_SteakVegetables"
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