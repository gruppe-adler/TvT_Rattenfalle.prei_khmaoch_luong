class mission_helpers {

	class ambient {
		file = mission_helpers\functions\ambient;

		class heliLightImprovement { postInit = 1; };
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

		class createCrashSite;
		class selectCrashSite;
		class teleportPlayer;
	};


};
