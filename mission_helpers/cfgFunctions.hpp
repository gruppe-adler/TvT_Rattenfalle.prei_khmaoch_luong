class GRAD_mission_helpers {

	class ambient {
		file = mission_helpers\functions\ambient;

		class heliLightImprovement { postInit = 1; };
		class toggleHeliLight;
	};


	class boat_mkv {
		file = mission_helpers\functions\boat_mkv;

		class decorateOpforBoat;
		class lockTurret;
	};


	class customAnimations {
		file = mission_helpers\functions\customAnimations;

		class doWave;
		class waveAddAction;
	};


	class marker {
		file = mission_helpers\functions\marker;

		class createMarkerForSides;
	};


	class setup {
		file = mission_helpers\functions\setup;

		class nerfStamina;
		class registerDynamicGroup;
		class createCrashSite;
		class selectCrashSite;
		class teleportPlayer;
    	class TFARsettings { preInit = 1; };
	};
};
