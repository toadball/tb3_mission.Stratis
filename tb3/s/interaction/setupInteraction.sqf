waitUntil { TB3_INIT };
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

sleep 5;  //wait for start

//Self interaction
["player", [DIK_APPS], -10, ["tb3\s\interaction\selfInteraction.sqf", "main"]] call CBA_ui_fnc_add;

//Interaction with others
//["CAManBase", [DIK_LWIN], 15, ["tb3\s\interaction\unitInteraction.sqf", "main"]] call CBA_ui_fnc_add;
