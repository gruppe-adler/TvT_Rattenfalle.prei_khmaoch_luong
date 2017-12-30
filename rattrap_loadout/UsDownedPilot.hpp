#ifdef NIGHTVISION
  #define NVITEM "rhsusf_ANPVS_15"
#else
  #define NVITEM ""
#endif

#ifdef LASERS
  #define LLITEM "rhsusf_acc_anpeq15_bk"
#else
  #define LLITEM ""
#endif

#ifdef GUNLIGHTS
  #define LLITEM "rhsusf_acc_anpeq15_bk_light"
#endif

#ifdef SUPPRESSORS
  #define SUPPRESSORITEM "rhsusf_acc_nt4_black"
#else
  #define SUPPRESSORITEM ""
#endif

class UsDownedPilot {
    class AllUnits {
        uniform = "rhs_uniform_g3_rgr";
        vest = "V_Rangemaster_belt";
        backpack = "";
        headgear = "H_HeadBandage_bloody_F";
        primaryWeapon = "";
        primaryWeaponMagazine = "";
        primaryWeaponMuzzle = SUPPRESSORITEM;
        primaryWeaponPointer = LLITEM;
        primaryWeaponOptics = "";
        handgunWeapon = "rds_weap_latarka_janta";
        handgunWeaponMagazine = "";
        binoculars = "Binocular";
        map = "";
        compass = "ItemCompass";
        watch = "ItemWatch";
        gps = "";
        radio = "tf_rf7800str";
        nvgoggles = "";
        goggles = "NeckTight_OD";
    };
    class Type {
        //everyone inherits from soldier_f
        class Soldier_F {
            addItemsToUniform[] = {
                "",
                "ACE_DefusalKit",
                LIST_2("ACE_epinephrine"),
                LIST_8("ACE_fieldDressing"),
                LIST_2("ACE_morphine"),
                "ACE_SpraypaintRed"
            };
            addItemsToVest[] = {
                LIST_2("rhs_mag_m18_yellow"),
                LIST_2("ACE_HandFlare_Yellow")
            };
        };
    };
};
