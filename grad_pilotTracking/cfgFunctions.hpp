class GRAD_pilotTracking {

	class client {
		file = grad_pilotTracking\functions\client;

		class addAction;
		class addInteractions;
		class clientLoop;
		class createBloodSplatter;
		class disableCollision;
		class getCardinalBearing;
		class gpsCanReceive;
		class initClient;
		class initPilot;
		class openGPS;
		class pilotStartHealing;
		class readTrace;
		class setBloodBar;
	};

	class server {
		file = grad_pilotTracking\functions\server;

		class addBodyBagHandling;
		class addTimeStamp;
		class createFootStepDry;
		class createFootStepWet;
		class createPilotMarker;
		class dropBlood;
		class initServer;
		class serverLoopPilotAlive;
		class serverLoopPilotDead;
	};
};
