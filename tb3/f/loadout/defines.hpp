	class TB3_Gear {
		class ExampleSide {
			class ExampleUnit {
				babelSpokenLanguages[] = {{"English"},"english"};//0 = array of spoken languages inc native, 1 = native spoken language
				weapons[] = {"arifle_MX_F","Binocular"};
				magazines[] = {	}; //do not use if using specific allocation of magazines
				backpack[] = {"B_Kitbag_rgr",0};
					backpackContents[] = {
						{"30Rnd_65x39_caseless_mag",2},
						{"30Rnd_65x39_caseless_mag_Tracer",1},
						{"Chemlight_blue",2},
						{"acc_flashlight",1}						
					};
				headgear[] = {"H_HelmetB_light"};
				uniform[] = {"U_B_CombatUniform_mcam_vest"};
					uniformContents[] = {
						{"FirstAidKit",2},
					};
				goggles[] = {"G_Lowprofile"};
				vest[] = {"V_PlateCarrier2_rgr"};
					vestContents[] = {
						{"30Rnd_65x39_caseless_mag",4},
						{"30Rnd_65x39_caseless_mag_Tracer",2},
						{"HandGrenade",2},
						{"SmokeShell",1}				
					};
				assignedItems[] = {"ItemMap","ItemCompass",	"ItemWatch","ItemGPS","ItemRadio"};
				items[] = {	}; //do not use if using specific allocation of items
				
				priKit[] = {"optic_ERCO_snd_F","acc_pointer_IR","30Rnd_65x39_caseless_mag"}; //primary weapon attachment/s
				secKit[] = {}; //launcher weapon attachment/s
				pisKit[] = {}; //pistol attachment/s
			};
			class ExampleVehicle {
				vehCargoWeapons[] = {{"launch_NLAW_F",2}};
				vehCargoMagazines[] = {
					{"30Rnd_65x39_caseless_mag",10},
					{"30Rnd_65x39_caseless_mag_Tracer",10},
					{"200Rnd_65x39_cased_Box",4},
					{"200Rnd_65x39_cased_Box_Tracer",4},
					{"HandGrenade",6},
					{"SmokeShell",6},
					{"1Rnd_HE_Grenade_shell",8}
				};
				vehCargoItems[] = {
					{"I_UavTerminal",1},
					{"ToolKit",1}
				};
				vehCargoRucks[] = {
					{"B_Carryall_oli",2}
				};
			};		
			class ExampleUnit2 : ExampleUnit {
				babelSpokenLanguages[] = {{"english","altian"},"altian"};//0 = array of spoken languages inc native, 1 = native spoken language	
			};
			class ExampleUnit3 : ExampleUnit {
				babelSpokenLanguages[] = {{"english","altian"}};//0 = array of spoken languages inc native, 1 = native spoken language	
			};
		};
	};