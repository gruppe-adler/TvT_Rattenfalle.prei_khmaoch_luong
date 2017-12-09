class GRAD_pilotTracking {

	class client {
		file = grad_pilotTracking\functions\client;

		class addBodyBagHandling;
		class addAction;
		class addInteractions;
		class clientLoop;
		class createBloodSplatter;
		class createPilotMarker;
		class gpsCanReceive;
		class initClient;
		class initPilot;
		class openGPS;
		class readTrace;
		class setBloodBar;
	};

	class server {
		file = grad_pilotTracking\functions\server;

		class addTimeStamp;
		class createFootStepDry;
		class createFootStepWet;
		class dropBlood;
		class initServer;
		class serverLoopPilotAlive;
		class serverLoopPilotDead;
	};
};
