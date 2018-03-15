class GRAD_pilotCam {

	class client {
		file = grad_pilotCam\functions\client;

		class camTurnOffPlayer;
		class camTurnOnPlayer;
		class createCameraEffectsPilot;
		class createAreaBarPilot;
		class getColorForDistance;
		class pipEnd;
		class pipStart;
		class showCamAreaBar;
	};

	class server {
		file = grad_pilotCam\functions\server;

		class addInteractionToCams;
		class initServer { preInit = 1; };
		class camTurnOnServer;
		class camTurnOffServer;
	};
};
