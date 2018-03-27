class GRAD_pilotTracking {

	class client {
		file = grad_pilotTracking\functions\client;

		class addAction;
		class addInteractions;
		class bodyBagHintAdd;
		class bodyBagHintRemove;
		class breakBones;
		class createBloodSplatter;
		class disableCollision;
		class dropBlood;
		class estimateBleedout;
		class forceCloseWound;
		class getFatigue;
		class getCardinalBearing;
		class gpsSetReceivingIndicator;
		class initClient;
		class initPilot;
		class medicStartHealing;
		class openGPS;
		class pilotLoop;
		class pilotStartHealing;
		class playerLoop;
		class readTrace;
		class reOpenGPS;
		class setBloodBar;
	};

	class server {
		file = grad_pilotTracking\functions\server;

		class addBodyBagHandling;
		class addTimeStamp;
		class createFootStepDry;
		class createFootStepWet;
		class createPilotMarker;
		class gpsReceivingSetter;
		class initServer;
		class serverLoopPilotAlive;
		class serverLoopPilotDead;
	};
};
