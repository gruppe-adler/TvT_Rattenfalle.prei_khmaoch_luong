class GRAD_buy_menu
{
		idd = 1337;
		movingenable = 0;

		enableSimulation = 1;
		enableDisplay = 1;
		onLoad = "uiNamespace setVariable ['GRAD_buy_menu_var', (_this select 0)];";
		fadein = 0.25;
		fadeout = 0.25;

		class ControlsBackground
		{
			class dlgBackground: RscBackground
			{
				idc = 1336;
				x = safeZoneX;
				y = safeZoneY;
				w = safeZoneW;
				h = safeZoneH;
				colorBackground[] = {0,0,0,0.8};
			};


		};



		class Objects {

			class pic1 {
				onObjectMoved = "systemChat str _this";
				idc = 1338;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0};
				position[] = {0,3,0.25};
				positionBack[] = {0,3,0.25};
				// x = 0.5; y = 0.5; z = 1;
				// xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 0;
				enableZoom = 0;
				zoomDuration = 0.001;
				onLoad = "ctrlShow [_this, false];";

			};

			class pic2 {
				onObjectMoved = "systemChat str _this";
				idc = 1339;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic3 {
				onObjectMoved = "systemChat str _this";
				idc = 1340;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic4 {
				onObjectMoved = "systemChat str _this";
				idc = 1341;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";
			};

			class pic5 {
				onObjectMoved = "systemChat str _this";
				idc = 1342;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic6 {
				onObjectMoved = "systemChat str _this";
				idc = 1343;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic7 {
				onObjectMoved = "systemChat str _this";
				idc = 1344;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic8 {
				onObjectMoved = "systemChat str _this";
				idc = 1345;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic9 {
				onObjectMoved = "systemChat str _this";
				idc = 1346;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic10 {
				onObjectMoved = "systemChat str _this";
				idc = 1347;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic11 {
				onObjectMoved = "systemChat str _this";
				idc = 1348;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic12 {
				onObjectMoved = "systemChat str _this";
				idc = 1349;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

		};
};



class GRAD_DeathCamDisplay
{
		idd = 7000;
		movingenable = 1;

		enableSimulation = 1;
		enableDisplay = 1;
		onLoad = "uiNamespace setVariable ['GRAD_DeathCamDisplay', (_this select 0)];";
		fadein = 0.25;
		fadeout = 0.25;

		class controlsBackground
				{
						class GRAD_DeathCam_bg : RscStructuredText
						{
									idc = -1;
									x = SafeZoneX;
									y = SafeZoneY;
									w = SafeZoneW + safeZoneX;
									h = SafeZoneH + safeZoneY;
									colorBackground[] = {0,0,0,0};
									color[] = {0,0,0,0};
									text = "";
						};
				};
		class controls {
			class RscText_DeathCam_headline : RscStructuredText {
				idc = 7001;
				text = "<t size='4' shadow='0' align='center'>Du bist tot.</t>";
				color[] = {1,1,1,0};
				x = safeZoneX + (safeZoneX + safeZoneW)/5;
				y = safeZoneY + (safeZoneY + safeZoneH)/20;
				w = safeZoneX + safeZoneW;
				h = safeZoneH/9;
				colorBackground[] = {0,0,0,0};
			};
			class RscText_DeathCam_quote : RscStructuredText {
				idc = 7002;
				text = "quote";
				color[] = {1,1,1,0.8};
				x = safeZoneX + (safeZoneX + safeZoneW)/5;
				y = safeZoneY + (safeZoneH/20)*16;
				w = safeZoneX + safeZoneW;
				h = safeZoneH/10;
				colorBackground[] = {0,0,0,0};
			};
			class RscText_DeathCam_author : RscStructuredText {
				idc = 7003;
				text = "author";
				color[] = {1,1,1,0.4};
				x = safeZoneX + (safeZoneX + safeZoneW)/5;
				y = safeZoneY + (safeZoneH/20)*18;
				w = safeZoneX + safeZoneW;
				h = safeZoneH/10;
				colorBackground[] = {0,0,0,0};
			};
		};
};



class gui_spawn_blufor
{
		idd = 8000;
		movingenable = 0;
		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};

		class ControlsBackground
		{
			class gui_spawn_blufor_bg: RscBackground
			{
				idc = 8001;
				x = 10 * GUI_GRID_W + GUI_GRID_X;
				y = 0 * GUI_GRID_H + GUI_GRID_Y;
				w = 20 * GUI_GRID_W;
				h = 10 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8};
			};
		};

		class Controls {

			class btn_spawn_blufor: RscStructuredText
			{
				idc = 8002;
				text = "Warte auf Opfor...";
				x = 14 * GUI_GRID_W + GUI_GRID_X;
				y = 5 * GUI_GRID_H + GUI_GRID_Y;
				w = 12 * GUI_GRID_W;
				h = 3 * GUI_GRID_H;
				colorBackground[] = {0,0,0,1};
			};
		};
};

class gui_spawn_opfor
{
		idd = 8010;
		movingenable = 0;
		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};

		class ControlsBackground
		{
			class gui_spawn_opfor_bg: RscBackground
			{
				idc = 8011;
				x = 10 * GUI_GRID_W + GUI_GRID_X;
				y = 0 * GUI_GRID_H + GUI_GRID_Y;
				w = 20 * GUI_GRID_W;
				h = 10 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8};
			};
		};

		class Controls {

			class text_spawn_opfor1: RscStructuredText
			{
				idc = -1;
				text = "<t align='center' size='1.2'>Hello Commander!</t>";
				x = 11 * GUI_GRID_W + GUI_GRID_X;
				y = 1 * GUI_GRID_H + GUI_GRID_Y;
				w = 18 * GUI_GRID_W;
				h = 3 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};

			class text_spawn_opfor2: RscStructuredText
			{
				idc = -1;
				text = $STR_GRAD_choose_spawn_location_hint;
				x = 11 * GUI_GRID_W + GUI_GRID_X;
				y = 3 * GUI_GRID_H + GUI_GRID_Y;
				w = 18 * GUI_GRID_W;
				h = 3 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};

			class btn_spawn_opfor3: RscButton
			{
				idc = -1;
				text = $STR_GRAD_choose_spawn_location;
				x = 11 * GUI_GRID_W + GUI_GRID_X;
				y = 6 * GUI_GRID_H + GUI_GRID_Y;
				w = 18 * GUI_GRID_W;
				h = 3 * GUI_GRID_H;
				colorText[] = {0,0,0,1};
				colorBackground[] = {0.81,0.55,0.12,1};
				tooltip = $STR_GRAD_choose_spawn_location_road;
				onButtonClick = "openMap [true,false]; player linkitem 'itemMap'; [] execVM 'spawn\teleport.sqf'; closeDialog 0";
			};
		};
};

class gui_spawn_waitplease
{
		idd = 8020;
		movingenable = 0;
		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};

		class ControlsBackground
		{
			class gui_spawn_waitplease_bg: RscBackground
			{
				idc = 8021;
				x = 10 * GUI_GRID_W + GUI_GRID_X;
				y = 0 * GUI_GRID_H + GUI_GRID_Y;
				w = 20 * GUI_GRID_W;
				h = 10 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8};
			};
		};

		class Controls {

			class btn_wait_opfor: RscStructuredText
			{
				idc = 8022;
				text = $STR_GRAD_choose_spawn_location;
				x = 16 * GUI_GRID_W + GUI_GRID_X;
				y = 2 * GUI_GRID_H + GUI_GRID_Y;
				w = 12 * GUI_GRID_W;
				h = 3 * GUI_GRID_H;
				colorBackground[] = {0,0,0,1};

			};
		};
};