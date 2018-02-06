class GRAD_pilotCam {

	class client {
		file = grad_pilotCam\functions\client;

		class camTurnOffPilot;
		class camTurnOffPlayer;
		class camTurnOnPilot;
		class camTurnOnPlayer;
		class createCameraEffectsPilot;
		class createProgressBarPilot;
		class createProgressBarPlayer;
		class pipEnd;
		class pipStart;
	};

	class server {
		file = grad_pilotCam\functions\server;

		class addInteractionToCams;
		class initServer { preInit = 1; };
		class camTurnOnServer;
		class camTurnOffServer;
	};
};
