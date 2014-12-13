
TB3_SkillProfiles =  (missionConfigFile >> "TB3_Settings" >> "SkillSettings" >> "Profiles");

_mode 	= _this select 0;

if ( !isServer ) exitWith { };
waitUntil { TB3_INIT  && time > 0 };

switch (_mode) do {
	case 0: {
		//[0,_side,"Skillprofile"] execVM "tb3\s\ai\setSkillProfile.sqf"
		_side = _this select 1;
		{
			if ( side _x == _side ) then {
				_unitArray pushback _x;
			};
		} forEach allUnits;
		_skillProfile = _this select 2;
		_aA = ["aimingAccuracy",getNumber (TB3_SkillProfiles >> _skillProfile >> "aimingAccuracy")];
			{_x setSkill _aA} forEach _unitArray;
		_aSh = ["aimingShake",getNumber (TB3_SkillProfiles >> _skillProfile >> "aimingShake")];
			{_x setSkill _aSh} forEach _unitArray;		
		_aSp = ["aimingSpeed",getNumber (TB3_SkillProfiles >> _skillProfile >> "aimingSpeed")];
			{_x setSkill _aSp} forEach _unitArray;			
		_sD = ["spotDistance",getNumber (TB3_SkillProfiles >> _skillProfile >> "spotDistance")];
			{_x setSkill _sD} forEach _unitArray;				
		_sT = ["spotTime",getNumber (TB3_SkillProfiles >> _skillProfile >> "spotTime")];
			{_x setSkill _sT} forEach _unitArray;						
		_cou = ["courage", getNumber (TB3_SkillProfiles >> _skillProfile >> "courage")];
			{_x setSkill _cou} forEach _unitArray;						
		_rS = ["reloadSpeed",getNumber (TB3_SkillProfiles >> _skillProfile >> "reloadSpeed")];
			{_x setSkill _rS} forEach _unitArray;			
		_com = ["commanding",getNumber (TB3_SkillProfiles >> _skillProfile >> "commanding")];
			{_x setSkill _com} forEach _unitArray;			
		_gen = ["general",getNumber (TB3_SkillProfiles >> _skillProfile >> "general")];
			{_x setSkill _gen} forEach _unitArray;		
	};
	case 1: {
		//[2,classname,"Skillprofile"] execVM "tb3\s\ai\setSkillProfile.sqf"	
		_class = _this select 1;
		{
			if (_x isKindOf _class) then {
				_unitArray pushback _x;
			};
		} forEach allUnits;
		
		_aA = ["aimingAccuracy",getNumber (TB3_SkillProfiles >> _skillProfile >> "aimingAccuracy")];
			{_x setSkill _aA} forEach _unitArray;
		_aSh = ["aimingShake",getNumber (TB3_SkillProfiles >> _skillProfile >> "aimingShake")];
			{_x setSkill _aSh} forEach _unitArray;		
		_aSp = ["aimingSpeed",getNumber (TB3_SkillProfiles >> _skillProfile >> "aimingSpeed")];
			{_x setSkill _aSp} forEach _unitArray;			
		_sD = ["spotDistance",getNumber (TB3_SkillProfiles >> _skillProfile >> "spotDistance")];
			{_x setSkill _sD} forEach _unitArray;				
		_sT = ["spotTime",getNumber (TB3_SkillProfiles >> _skillProfile >> "spotTime")];
			{_x setSkill _sT} forEach _unitArray;						
		_cou = ["courage", getNumber (TB3_SkillProfiles >> _skillProfile >> "courage")];
			{_x setSkill _cou} forEach _unitArray;						
		_rS = ["reloadSpeed",getNumber (TB3_SkillProfiles >> _skillProfile >> "reloadSpeed")];
			{_x setSkill _rS} forEach _unitArray;			
		_com = ["commanding",getNumber (TB3_SkillProfiles >> _skillProfile >> "commanding")];
			{_x setSkill _com} forEach _unitArray;			
		_gen = ["general",getNumber (TB3_SkillProfiles >> _skillProfile >> "general")];
			{_x setSkill _gen} forEach _unitArray;		
	};
	case 2: {
		//[2,_unit,"Skillprofile"] execVM "tb3\s\ai\setSkillProfile.sqf"
		_unit = _this select 1;
		_skillProfile = _this select 2;

		_unit setSkill ["aimingAccuracy",getNumber (TB3_SkillProfiles >> _skillProfile >> "aimingAccuracy")];
		_unit setSkill ["aimingShake",getNumber (TB3_SkillProfiles >> _skillProfile >> "aimingShake")];
		_unit setSkill ["aimingSpeed",getNumber (TB3_SkillProfiles >> _skillProfile >> "aimingSpeed")];
		_unit setSkill ["spotDistance",getNumber (TB3_SkillProfiles >> _skillProfile >> "spotDistance")];
		_unit setSkill ["spotTime",getNumber (TB3_SkillProfiles >> _skillProfile >> "spotTime")];
		_unit setSkill ["courage", getNumber (TB3_SkillProfiles >> _skillProfile >> "courage")];
		_unit setSkill ["reloadSpeed",getNumber (TB3_SkillProfiles >> _skillProfile >> "reloadSpeed")];
		_unit setSkill ["commanding",getNumber (TB3_SkillProfiles >> _skillProfile >> "commanding")];
		_unit setSkill ["general",getNumber (TB3_SkillProfiles >> _skillProfile >> "general")];

	};
	default {};
};

