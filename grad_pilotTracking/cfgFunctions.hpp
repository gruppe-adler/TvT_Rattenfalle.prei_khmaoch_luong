class GRAD_pilotTracking {

	class client {
		file = grad_pilotTracking\functions\client;

		class addAction;
		class addInteractions;
		class clientLoop;
		class createBloodSplatter;
		class createPilotMarker;
		class disableCollision;
		class gpsCanReceive;
		class initClient;
		class initPilot;
		class openGPS;
		class readTrace;
		class setBloodBar;
	};

	class server {
		file = grad_pilotTracking\functions\server;

		class addBodyBagHandling;
		class addTimeStamp;
		class createFootStepDry;
		class createFootStepWet;
		class dropBlood;
		class initServer;
		class serverLoopPilotAlive;
		class serverLoopPilotDead;
	};
};
