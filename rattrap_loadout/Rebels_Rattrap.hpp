class Rebels_Rattrap: ModerateRebels {
    class AllUnits: AllUnits {

   uniform = "U_I_C_Soldier_Para_3_F";
        vest = "V_TacChestrig_oli_F";
        backpack = "";
        headgear = "rhsgref_helmet_M1_bare";
        primaryWeapon = "rhs_weap_ak74m_camo";
        primaryWeaponMagazine = "rhs_30Rnd_545x39_AK_plum_green";
        primaryWeaponMuzzle = "";
        primaryWeaponPointer = "acc_flashlight";
        primaryWeaponOptics = "rhs_acc_1p87";
        handgunWeapon = "rhs_weap_makarov_pm";
        handgunWeaponMagazine = "rhs_mag_9x18_8_57N181S";
        binoculars = "Binocular";
        map = "ItemMap";
        compass = "ItemCompass";
        watch = "ItemWatch";
        gps = "ItemGPS";
        radio = "tf_fadak";
        nvgoggles = "ACE_NVG_Gen4";
    };
    class Type: Type {
        //Rifleman
        class Soldier_F :Soldier_F {
            addItemsToUniform[] = {
                "ACE_MapTools",
                LIST_1("rhs_mag_9x18_8_57N181S"),
                LIST_8("ACE_fieldDressing"),
                LIST_4("ACE_morphine"),
                LIST_1("ACE_epinephrine"),
                LIST_1("ACE_key_east"),
                "ACE_Flashlight_KSF1",
                LIST_2("ACE_bodyBag"),
                LIST_2("ACE_Chemlight_HiGreen")
            };
            addItemsToVest[] = {
                "rhs_mag_rgd5",
                LIST_2("rhs_mag_rdg2_white"),
                LIST_7("rhs_30Rnd_545x39_AK_plum_green")
            };
        };
        //Asst. Autorifleman
        class Soldier_AAR_F: Soldier_F {
            uniform = "U_I_C_Soldier_Para_4_F";
            backpack = "B_FieldPack_khk";
            addItemsToBackpack[] = {
                LIST_3("rhs_100Rnd_762x54mmR_green")
            };
        };
        //Asst. Gunner (HMG/GMG)
        class support_AMG_F: Soldier_AAR_F {};
        //Asst. Missile Specialist (AA)
        class Soldier_AAA_F: Soldier_F {
            uniform = "U_C_HunterBody_grn";
            vest = "V_TacChestrig_cbr_F";
            backpack = "rhs_rpg_empty";
            addItemsToBackpack[] = {
                LIST_2("rhs_mag_9k38_rocket")
            };
        };
        //Asst. Missile Specialist (AT)
        class Soldier_AAT_F: Soldier_F {
            uniform = "U_I_C_Soldier_Para_1_F";
            vest = "V_TacChestrig_cbr_F";
            goggles = "rhs_scarf";
            backpack = "rhs_rpg_empty";
            addItemsToBackpack[] = {
                LIST_3("rhs_rpg7_PG7VL_mag")
            };
        };
        //Autorifleman
        class Soldier_AR_F: Soldier_F {
            uniform = "U_I_C_Soldier_Para_1_F";
            vest = "V_TacChestrig_cbr_F";
            backpack = "B_FieldPack_oli";
            headgear = "rhsgref_helmet_M1_bare_alt01";
            primaryWeapon = "rhs_weap_pkm";
            primaryWeaponMagazine = "rhs_100Rnd_762x54mmR_green";
            addItemsToVest[] = {
                LIST_2("rhs_100Rnd_762x54mmR_green")
            };
            addItemsToBackpack[] = {
                LIST_2("rhs_100Rnd_762x54mmR_green")
            };
        };
        //Combat Life Saver
        class medic_F: Soldier_F {
            uniform = "U_I_C_Soldier_Para_2_F";
            vest = "V_BandollierB_khk";
            backpack = "B_Kitbag_cbr";
            headgear = "rhsgref_helmet_M1_painted";

            addItemsToVest[] = {
                LIST_2("rhs_mag_rgd5"),
                LIST_6("rhs_30Rnd_545x39_AK_plum_green")
            };
            addItemsToBackpack[] = {
                LIST_2("ACE_bloodIV"),
                LIST_10("ACE_epinephrine"),
                LIST_10("ACE_morphine"),
                LIST_20("ACE_fieldDressing"),
                LIST_2("rhs_mag_rdg2_white")
            };
        };
        //Explosive Specialist
        class Soldier_exp_F: Soldier_F {
            uniform = "U_C_HunterBody_grn";
            vest = "V_TacChestrig_cbr_F";
            backpack = "B_FieldPack_khk";

            addItemsToBackpack[] = {
                LIST_2("IEDLandSmall_Remote_Mag"),
                "IEDLandBig_Remote_Mag",
                "ACE_Cellphone"
            };
        };
        //Grenadier
        class Soldier_GL_F: Soldier_F {
            uniform = "U_BG_Guerilla3_1";
            vest = "V_TacChestrig_cbr_F";
            backpack = "B_FieldPack_khk";
            headgear = "H_Bandanna_khk";
            primaryWeapon = "rhs_weap_ak74m_gp25";
            addItemsToBackpack[] = {
                LIST_2("rhs_mag_rgd5"),
                LIST_2("rhs_mag_rdg2_white"),
                LIST_6("rhs_VOG25"),
                LIST_2("rhs_VG40MD_White"),
                LIST_2("rhs_VG40MD_Red")
            };
        };
        //Heavy Gunner
        class HeavyGunner_F: Soldier_AR_F {};
        //Marksman
        class Soldier_M_F: Soldier_F {
            uniform = "U_BG_Guerilla2_3";
            vest = "V_TacChestrig_grn_F";
            goggles = "G_Bandanna_khk";
            primaryWeapon = "rhs_weap_m76";
            primaryWeaponMagazine = "rhsgref_10Rnd_792x57_m76";
            primaryWeaponOptics = "rhs_acc_1p78";
            addItemsToVest[] = {
                LIST_2("rhs_mag_rdg2_white"),
                LIST_11("rhsgref_10Rnd_792x57_m76")
            };
        };
        //Missile Specialist (AA)
        class Soldier_AA_F: Soldier_F {
            uniform = "U_BG_Guerilla1_1";
            vest = "V_TacChestrig_cbr_F";
            backpack = "rhs_rpg_empty";

            secondaryWeapon = "rhs_weap_igla";
            secondaryWeaponMagazine = "rhs_mag_9k38_rocket";
            addItemsToBackpack[] = {
                "rhs_mag_9k38_rocket"
            };
        };
        //Missile Specialist (AT)
        class Soldier_AT_F: Soldier_F {
            uniform = "U_I_C_Soldier_Para_5_F";
            vest = "V_TacChestrig_cbr_F";
            backpack = "rhs_rpg_empty";

            secondaryWeapon = "rhs_weap_rpg7";
            secondaryWeaponMagazine = "rhs_rpg7_PG7VL_mag";
            addItemsToBackpack[] = {
                LIST_2("rhs_mag_rgd5"),
                LIST_2("rhs_mag_rdg2_white"),
                LIST_2("rhs_rpg7_PG7VL_mag"),
                "rhs_rpg7_OG7V_mag"
            };
        };
        //Repair Specialist
        class Soldier_repair_F: Soldier_F {
            uniform = "U_BG_Guerilla2_2";
            vest = "V_TacChestrig_oli_F";
            backpack = "rhs_sidor";

            addItemsToBackpack[] = {
                "ToolKit",
                "ACE_wirecutter"
            };
        };
        //Rifleman (AT)
        class Soldier_LAT_F: Soldier_F {
            uniform = "U_I_C_Soldier_Para_5_F";
            vest = "V_TacChestrig_oli_F";
            goggles = "G_Bandanna_oli";
            headgear = "rhsgref_helmet_M1_painted";

            secondaryWeapon = "rhs_weap_rpg26";
        };


        // Scout (Special Role Rattrap)
        class Survivor_F: Soldier_F {
            uniform = "U_I_C_Soldier_Bandit_1_F";
            vest = "V_BandollierB_cbr";
            backpack = "B_LegStrapBag_coyote_F";
            headgear = "H_Hat_Safari_sand_F";
            goggles = "rhsusf_shemagh_tan";

            addItemsToVest[] = {
                "rhs_mag_rgd5",
                LIST_2("rhs_mag_rdg2_white"),
                LIST_6("rhs_30Rnd_545x39_AK_plum_green"),
                "grad_axe"
            };

        };

        class Soldier_Unarmed_F: Soldier_F {
            uniform = "U_I_C_Soldier_Bandit_5_F";
            vest = "V_BandollierB_blk";
            backpack = "B_LegStrapBag_black_F";
            headgear = "H_Hat_Safari_olive_F";
            goggles = "rhsusf_shemagh2_grn";
        };


        //Squad Leader
        class Soldier_SL_F: Soldier_F {
            uniform = "U_I_C_Soldier_Para_2_F";
            vest = "V_TacVest_camo";
            headgear = "rhs_fieldcap_khk";

            primaryWeapon = "rhs_weap_ak74m_gp25";
            backpack = "tf_mr3000_rhs";

             addItemsToBackpack[] = {
                LIST_10("rhs_VG40OP_green"),
                LIST_2("rhs_GRD40_Green"),
                LIST_2("rhs_GRD40_White")
            };
        };
        //Team Leader
        class Soldier_TL_F: Soldier_F {
            uniform = "U_I_C_Soldier_Camo_F";
            vest = "V_TacVest_brn";
            headgear = "H_Booniehat_oli";

            primaryWeapon = "rhs_weap_ak74m_gp25";
            backpack = "tf_mr3000_rhs";

            addItemsToBackpack[] = {
                LIST_10("rhs_VG40OP_green"),
                LIST_2("rhs_GRD40_Green"),
                LIST_2("rhs_GRD40_White")
            };
        };
    };
};
