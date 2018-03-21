class rattrap_objectives {

	class client {
		file = rattrap_objectives\functions\client;

		class preparationTimeCountdown;
	};

	class server {
		file = rattrap_objectives\functions\server;

		class createTasks;
		class endGame;
		class initTasks { postInit = 1; };
		class startPreparationTime;
	};
};
