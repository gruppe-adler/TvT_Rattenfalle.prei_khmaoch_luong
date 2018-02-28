#define GRID_X          (pixelW * pixelGridBase)
#define GRID_Y          (pixelH * pixelGridBase)

#define MAIN_W          (GRID_X * 20)
#define MAIN_H          (GRID_Y * 12)
#define MAIN_X          (safeZoneX + safeZoneW - MAIN_W * 1.15)
#define MAIN_Y          (safeZoneY + safeZoneH - MAIN_H * 2)

#define FRAME_TB_H      (GRID_Y * 1)
#define FRAME_LR_W      (GRID_X * 1)

#define PIP_W           (MAIN_W - 0.5 * FRAME_LR_W)
#define PIP_H           (MAIN_H - 0.5 * FRAME_TB_H)
#define PIP_X           (MAIN_X + (MAIN_W - PIP_W)/2)
#define PIP_Y           (MAIN_Y + (MAIN_H - PIP_H)/2)

#define pilotCam_CT_STATIC       0
#define pilotCam_ST_PICTURE      0x30


class pilotCam_RscPicture
{
    access = 0;
    type = pilotCam_CT_STATIC;
    idc = -1;
    style = pilotCam_ST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = "TahomaB";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
};


class pilotCam_RscProgress
{
    type = 8;
    style = 0;
    colorFrame[] = {0,0,0,0};
    colorBar[] = {1,0,0,1};
    texture = "#(argb,8,8,3)color(1,1,1,1)";
    w = 1;
    h = 0.03;
};