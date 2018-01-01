class US_Rattrap: SOGBLACK {
    class AllUnits:AllUnits {
        uniform = "rhs_uniform_g3_blk";
        vest = "";
        backpack = "B_ViperLightHarness_blk_F";
        headgear = "rhsusf_opscore_bk_pelt";
        primaryWeapon = "rhs_weap_hk416d10";
        primaryWeaponMagazine = "30Rnd_556x45_Stanag_Tracer_Red";
        primaryWeaponMuzzle = SUPPRESSORITEM;
        primaryWeaponPointer = "grad_flashlight_1";
        primaryWeaponOptics = "rhsusf_acc_compm4";
		primaryWeaponUnderbarrel = "rhsusf_acc_grip3";
        handgunWeapon = "rhsusf_weap_glock17g4";
		handgunWeaponMuzzle = "rhsusf_acc_omega9k";
        handgunWeaponMagazine = "rhsusf_mag_17Rnd_9x19_FMJ";
        binoculars = "ACE_Vector";
        map = "ItemMap";
        compass = "ItemCompass";
        watch = "ACE_Altimeter";
        gps = "ItemGPS";
        radio = "tf_anprc152";
        nvgoggles = "ACE_NVG_Gen4";
        goggles = "";
    };
    class Type: Type {
        //Rifleman
        class Soldier_F: Soldier_F {
            addItemsToUniform[] = {
                "ACE_MapTools",
                "ACE_DefusalKit",
                LIST_2("ACE_CableTie"),
                LIST_10("ACE_fieldDressing"),
                LIST_4("ACE_morphine"),
				LIST_1("ACE_key_lockpick"),
                "ACE_epinephrine",
                "ACE_Flashlight_MX991",
                LIST_1("ACE_bodyBag"),
                LIST_2("ACE_Chemlight_HiRed"),
                "ACE_acc_pointer_green"
            };
            addItemsToBackpack[] = {
                LIST_2("HandGrenade"),
                LIST_2("SmokeShell"),
                LIST_1("rhsusf_mag_17Rnd_9x19_FMJ"),
                LIST_10("30Rnd_556x45_Stanag_Tracer_Red"),
                "ACE_IR_Strobe_Item"
            };
        };
        //Asst. Autorifleman
        class soldier_AAR_F: Soldier_F {
           
            addItemsToBackpack[] = {
                LIST_2("rhs_200rnd_556x45_M_SAW"),
                "rhsusf_100Rnd_556x45_soft_pouch"
            };
        };
        //Asst. Gunner (HMG/GMG)
        class support_AMG_F: Soldier_F {
           
            addItemsToBackpack[] = {
                LIST_4("rhsusf_100Rnd_762x51_m62_tracer"),
                "rhsusf_100Rnd_762x51"
            };
        };
        //Asst. Missile Specialist (AA)
        class soldier_AAA_F: Soldier_F {
            backpack = "B_ViperHarness_blk_F";
            addItemsToBackpack[] = {
                "rhs_fim92_mag"
            };
        };
        //Asst. Missile Specialist (AT)
        class soldier_AAT_F: Soldier_F {
            backpack = "B_ViperHarness_blk_F";
            addItemsToBackpack[] = {
                "rhs_fgm148_magazine_AT"
            };
        };
        //Autorifleman
        class soldier_AR_F: Soldier_F {
            primaryWeapon = "rhs_weap_m249_pip_S_para";
            primaryWeaponMagazine = "rhs_200rnd_556x45_M_SAW";
            primaryWeaponPointer = LLITEM_MG;
            handgunWeapon = "";
            handgunWeaponMagazine = "";
            addItemsBackpack[] = {
                LIST_2("HandGrenade"),
                LIST_2("SmokeShell"),
				LIST_2("rhs_200rnd_556x45_M_SAW"),
                "rhsusf_100Rnd_556x45_soft_pouch"
            };
        };
        //Combat Life Saver
        class medic_F: Soldier_F {
            
            addItemsToBackpack[] = {
                LIST_1("HandGrenade"),
                LIST_2("SmokeShellPurple"),
                LIST_2("SmokeShell"),
                LIST_1("rhsusf_mag_17Rnd_9x19_FMJ"),
                LIST_6("30Rnd_556x45_Stanag_Tracer_Red"),
                LIST_2("ACE_bloodIV"),
                LIST_10("ACE_epinephrine"),
                LIST_10("ACE_morphine"),
                LIST_10("ACE_fieldDressing")
            };
        };
        //Explosive Specialist
        class soldier_exp_F: Soldier_F {
           
            addItemsToBackpack[] = {
                "ACE_Clacker",
                "ACE_M26_Clacker",
                "SatchelCharge_Remote_Mag",
                LIST_3("DemoCharge_Remote_Mag")
            };
        };
        //Grenadier
        class Soldier_GL_F: Soldier_F {
            primaryWeapon = "rhs_weap_mk18_m320";
            addItemsBackpack[] = {
                LIST_2("HandGrenade"),
                LIST_2("SmokeShell"),
                LIST_1("rhsusf_mag_17Rnd_9x19_FMJ"),
                LIST_8("30Rnd_556x45_Stanag_Tracer_Red"),
                LIST_6("rhs_mag_M441_HE"),
                LIST_2("rhs_mag_m713_Red")
            };
        };
        //Heavy Gunner
        class HeavyGunner_F: Soldier_F {
            primaryWeapon = "rhs_weap_m240B";
            primaryWeaponMagazine = "rhsusf_100Rnd_762x51";
            handgunWeapon = "";
            handgunWeaponMagazine = "";
           
            addItemsBackpack[] = {
                LIST_2("HandGrenade"),
                LIST_2("SmokeShell"),
				LIST_2("rhsusf_100Rnd_762x51_m62_tracer"),
                "rhsusf_100Rnd_762x51"
            };
        };
        //Marksman
        class soldier_M_F: Soldier_F {
            primaryWeapon = "rhs_weap_sr25_ec";
            primaryWeaponMagazine = "rhsusf_20Rnd_762x51_m118_special_Mag";
			primaryWeaponMuzzle = SUPPRESSORITEM_MARKSMAN;
            primaryWeaponPointer = LLITEM;
            primaryWeaponOptics = "optic_DMS";
            primaryWeaponUnderbarrel = "bipod_01_F_blk";
            addItemsBackpack[] = {
                LIST_2("HandGrenade"),
                LIST_2("SmokeShell"),
                LIST_1("rhsusf_mag_17Rnd_9x19_FMJ"),
                LIST_7("rhsusf_20Rnd_762x51_m118_special_Mag")
            };
        };
        //Missile Specialist (AA)
        class soldier_AA_F: Soldier_F {
            secondaryWeapon = "rhs_weap_fim92";
            secondaryWeaponMagazine = "rhs_fim92_mag";
            backpack = "B_ViperHarness_blk_F";
            addItemsToBackpack[] = {
                "rhs_fim92_mag"
            };
        };
        //Missile Specialist (AT)
        class soldier_AT_F: Soldier_F {
            secondaryWeapon = "rhs_weap_fgm148";
            secondaryWeaponMagazine = "rhs_fgm148_magazine_AT";
            backpack = "B_ViperHarness_blk_F";
            addItemsToBackpack[] = {
                "rhs_fgm148_magazine_AT"
            };
        };
        //Repair Specialist
        class soldier_repair_F: Soldier_F {
           
            addItemsToBackpack[] = {
                "ToolKit",
                "ACE_wirecutter"
            };
        };
        //Rifleman (AT)
        class soldier_LAT_F: Soldier_F {
            secondaryWeapon = "rhs_weap_M136";
        };
        //Squad Leader
        class Soldier_SL_F: Soldier_F {
            backpack = "TFAR_rt1523g_bwmod";
            primaryWeapon = "rhs_weap_hk416d10_m320";

            addItemsToBackpack[] = {
                LIST_8("UGL_FlareRed_F"),
                LIST_2("1Rnd_SmokeRed_Grenade_shell"),
                LIST_2("1Rnd_Smoke_Grenade_shell")
            };
        };

        //Team Leader
        class Soldier_TL_F: Soldier_F {
            backpack = "TFAR_rt1523g_bwmod";
            primaryWeapon = "rhs_weap_hk416d10_m320";

            addItemsBackpack[] = {
                LIST_8("UGL_FlareRed_F"),
                LIST_2("1Rnd_SmokeRed_Grenade_shell"),
                LIST_2("1Rnd_Smoke_Grenade_shell")
            };
        };
    };
};
