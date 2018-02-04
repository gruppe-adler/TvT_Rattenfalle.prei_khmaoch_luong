class GRAD_simpleWaveRespawn {

	class client {
		file = grad_simpleWaveRespawn\functions\client;

		class forceRespawn;
		class showRemainingTime;
	};

	class server {
		file = grad_simpleWaveRespawn\functions\server;

		class serverLoop;
		class setupVehicleAfterRespawn;
		class simpleVehicleRespawn;
		class spawnVehicle;
		class vehicleRespawn;
	};
};