hint "\nClick on your destination.\n\n\nThe map will close automagically.\n\n";
onMapSingleClick "openMap [false, false]; (vehicle player) setPosATL [_pos select 0, _pos select 1, (getPosATL (vehicle player)) select 2]; true; hintSilent ''; onMapSingleClick ''; ";
openMap [true,false];