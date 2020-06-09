#include <YSI_Coding\y_hooks>

#define MODE_DM 1
#define MODE_TDM 2

enum AirsoftEnum {
    Leader,
    Name[24],
    Weapon,
    Password[24],
    Map,
    Gamemode,
    UserLimit,
    TimeLimit,
    CurrentTime,
    bool:Started
};
new Airsoft[20][AirsoftEnum];

enum AirsoftStatsEnum {
    Kill,
    Death,
    Shots,
    Headshots
};
new AirsoftStats[MAX_PLAYERS][AirsoftStatsEnum];

new AirsoftMaps[][] = {
    "Cs_Deagle",
    "Fy_Snow",
    "Simpson"
};

enum AirsoftSkinsEnum {
    Gamemode,
    Team,
    Skin
}

new AirsoftSkins[][AirsoftSkinsEnum] = {
    {MODE_TDM, 1, 25989},
    {MODE_TDM, 2, 25991},
    {MODE_DM, 0, 25992}
};

enum AirsoftMapPositionsEnum {
    Map,
    Gamemode,
    Team,
    Float:PosX,
    Float:PosY,
    Float:PosZ
};

new Float:AirsoftMapPositions[][AirsoftMapPositionsEnum] = {
    {1, MODE_TDM, 1, 63.2158, 2486.2256, 16.6857},
    {1, MODE_TDM, 1, 62.0823, 2493.9043, 16.6857},
    {1, MODE_TDM, 1, 61.8331, 2501.1780, 16.6857},
    {1, MODE_TDM, 1, 62.0831, 2507.2083, 16.6857},
    {1, MODE_TDM, 1, 63.1512, 2513.3101, 16.6857},
    {1, MODE_TDM, 1, 62.6158, 2519.1443, 16.6857},
    {1, MODE_TDM, 1, 61.2997, 2528.5647, 16.6857},
    {1, MODE_TDM, 1, 62.9129, 2533.7378, 16.6857},
    {1, MODE_TDM, 1, 61.8670, 2499.8667, 24.0161},
    {1, MODE_TDM, 1, 44.7923, 2493.4832, 16.6857},
    {1, MODE_TDM, 2, -44.8391, 2475.8672, 16.6857},
    {1, MODE_TDM, 2, -41.1787, 2481.1287, 16.6857},
    {1, MODE_TDM, 2, -42.7521, 2486.9214, 16.6857},
    {1, MODE_TDM, 2, -46.0826, 2491.3301, 16.6857},
    {1, MODE_TDM, 2, -46.2715, 2498.6182, 16.6857},
    {1, MODE_TDM, 2, -44.4650, 2502.2300, 16.6857},
    {1, MODE_TDM, 2, -43.3172, 2507.5774, 16.6857},
    {1, MODE_TDM, 2, -43.8911, 2514.3301, 16.6857},
    {1, MODE_TDM, 2, -43.7827, 2521.2932, 16.6857},
    {1, MODE_TDM, 2, -38.6388, 2508.8945, 16.6857},
    {1, MODE_DM, 0, -38.6388, 2508.8945, 16.6857},
    {1, MODE_DM, 0, -27.4032, 2518.6624, 16.6857},
    {1, MODE_DM, 0, -11.5634, 2530.2073, 16.6857},
    {1, MODE_DM, 0, -6.8761, 2523.2881, 16.6857},
    {1, MODE_DM, 0, 0.3399, 2511.7466, 16.6857},
    {1, MODE_DM, 0, 1.3217, 2497.0557, 16.6857},
    {1, MODE_DM, 0, 14.0971, 2485.5461, 16.6857},
    {1, MODE_DM, 0, 32.6645, 2482.4915, 16.6857},
    {1, MODE_DM, 0, 44.9248, 2488.7903, 16.6857},
    {1, MODE_DM, 0, 54.8097, 2501.5149, 16.6857},
    {1, MODE_DM, 0, 63.3046, 2506.3826, 16.6857},
    {1, MODE_DM, 0, 60.6159, 2517.1604, 16.6857},
    {1, MODE_DM, 0, 52.9233, 2525.4700, 16.6857},
    {1, MODE_DM, 0, 39.6816, 2529.0830, 16.6857},
    {1, MODE_DM, 0, 29.5565, 2535.2202, 16.6857},
    {1, MODE_DM, 0, 26.4026, 2520.6360, 16.6857},
    {1, MODE_DM, 0, 34.9339, 2509.1895, 16.6857},
    {1, MODE_DM, 0, 62.0008, 2500.6470, 24.0161},
    {1, MODE_DM, 0, 1.2523, 2499.6067, 24.0036},
    {1, MODE_DM, 0, -34.2785, 2499.8147, 24.0238},

    {2, MODE_TDM, 1, -2310.0576, -1518.1261, 1287.8210},
    {2, MODE_TDM, 1, -2313.3574, -1518.4177, 1287.8210},
    {2, MODE_TDM, 1, -2316.8123, -1517.9152, 1287.8210},
    {2, MODE_TDM, 1, -2294.5537, -1518.3175, 1287.8210},
    {2, MODE_TDM, 1, -2290.9099, -1518.3196, 1287.8210},
    {2, MODE_TDM, 1, -2288.4849, -1518.6257, 1287.8210},
    {2, MODE_TDM, 1, -2284.3123, -1508.2404, 1287.8210},
    {2, MODE_TDM, 1, -2303.2134, -1508.9841, 1289.4739},
    {2, MODE_TDM, 1, -2322.1155, -1508.1024, 1287.8210},
    {2, MODE_TDM, 1, -2301.5359, -1516.9579, 1287.8210},
    {2, MODE_TDM, 2, -2301.6426, -1565.9709, 1287.8210},
    {2, MODE_TDM, 2, -2310.4119, -1565.0231, 1287.8210},
    {2, MODE_TDM, 2, -2314.5103, -1564.7579, 1287.8210},
    {2, MODE_TDM, 2, -2316.9304, -1565.1132, 1287.8210},
    {2, MODE_TDM, 2, -2322.0520, -1572.8376, 1287.8210},
    {2, MODE_TDM, 2, -2303.4153, -1573.3167, 1289.4739},
    {2, MODE_TDM, 2, -2283.5884, -1573.1863, 1287.8210},
    {2, MODE_TDM, 2, -2287.9641, -1565.7030, 1287.8210},
    {2, MODE_TDM, 2, -2291.7153, -1565.3107, 1287.8210},
    {2, MODE_TDM, 2, -2294.6511, -1565.5092, 1287.8210},
    {2, MODE_DM, 0, -2280.1152, -1555.2848, 1287.8210},
    {2, MODE_DM, 0, -2270.0032, -1542.9919, 1288.3209},
    {2, MODE_DM, 0, -2270.8730, -1540.3677, 1288.3954},
    {2, MODE_DM, 0, -2281.4729, -1530.8066, 1287.8210},
    {2, MODE_DM, 0, -2282.5730, -1524.9298, 1287.8210},
    {2, MODE_DM, 0, -2284.0313, -1509.4963, 1287.8210},
    {2, MODE_DM, 0, -2322.3779, -1509.7036, 1287.8210},
    {2, MODE_DM, 0, -2324.0122, -1523.6888, 1287.8210},
    {2, MODE_DM, 0, -2323.5974, -1528.1157, 1287.8210},
    {2, MODE_DM, 0, -2334.6006, -1539.8113, 1288.3638},
    {2, MODE_DM, 0, -2334.4453, -1542.7214, 1288.3954},
    {2, MODE_DM, 0, -2322.2712, -1552.4644, 1287.8210},
    {2, MODE_DM, 0, -2315.0249, -1542.7198, 1287.8210},
    {2, MODE_DM, 0, -2302.6873, -1551.1162, 1287.8210},
    {2, MODE_DM, 0, -2290.4421, -1541.9425, 1287.8210},
    {2, MODE_DM, 0, -2303.1570, -1531.3954, 1287.8210},
    {2, MODE_DM, 0, -2319.4646, -1559.2118, 1287.8210},
    {2, MODE_DM, 0, -2323.0288, -1573.0977, 1287.8210},
    {2, MODE_DM, 0, -2303.6594, -1573.0289, 1289.4739},
    {2, MODE_DM, 0, -2277.3264, -1571.8363, 1287.8210},

    {3, MODE_TDM, 1, 623.1361, 1732.5787, 505.6424},
    {3, MODE_TDM, 1, 628.5726, 1732.2275, 505.6424},
    {3, MODE_TDM, 1, 630.5421, 1738.3864, 501.5315},
    {3, MODE_TDM, 1, 626.7682, 1738.7744, 501.5304},
    {3, MODE_TDM, 1, 621.3762, 1738.9956, 501.5314},
    {3, MODE_TDM, 1, 626.8904, 1731.5327, 501.5505},
    {3, MODE_TDM, 1, 622.2001, 1746.3125, 498.0546},
    {3, MODE_TDM, 1, 626.8998, 1745.8864, 498.0546},
    {3, MODE_TDM, 1, 631.7811, 1746.6771, 498.0546},
    {3, MODE_TDM, 1, 626.1077, 1736.1283, 498.0599},
    {3, MODE_TDM, 2, 626.3640, 1704.1219, 498.0580},
    {3, MODE_TDM, 2, 620.3843, 1696.2410, 498.0546},
    {3, MODE_TDM, 2, 626.5360, 1696.7675, 498.0546},
    {3, MODE_TDM, 2, 630.7337, 1697.1917, 498.0546},
    {3, MODE_TDM, 2, 629.4310, 1702.8099, 501.5321},
    {3, MODE_TDM, 2, 625.7057, 1703.2764, 501.5317},
    {3, MODE_TDM, 2, 621.8359, 1703.8068, 501.5310},
    {3, MODE_TDM, 2, 626.1137, 1712.0354, 501.5494},
    {3, MODE_TDM, 2, 623.2021, 1711.0302, 505.6429},
    {3, MODE_TDM, 2, 629.1216, 1711.9240, 505.6429},
    {3, MODE_DM, 0, 615.4476, 1739.4918, 498.0546},
    {3, MODE_DM, 0, 622.4634, 1744.9591, 498.0546},
    {3, MODE_DM, 0, 631.1715, 1746.3363, 498.0546},
    {3, MODE_DM, 0, 637.1255, 1738.9799, 498.0546},
    {3, MODE_DM, 0, 636.8242, 1731.2772, 498.0546},
    {3, MODE_DM, 0, 637.7274, 1712.8236, 498.0546},
    {3, MODE_DM, 0, 637.7984, 1703.3199, 498.0546},
    {3, MODE_DM, 0, 630.4254, 1697.7410, 498.0546},
    {3, MODE_DM, 0, 622.2167, 1697.5455, 498.0546},
    {3, MODE_DM, 0, 615.4421, 1704.3867, 498.0546},
    {3, MODE_DM, 0, 618.1719, 1706.3673, 498.0546},
    {3, MODE_DM, 0, 623.2039, 1708.4568, 498.0588},
    {3, MODE_DM, 0, 631.0900, 1708.7816, 498.0589},
    {3, MODE_DM, 0, 623.0871, 1729.3964, 498.0604},
    {3, MODE_DM, 0, 630.0388, 1732.2317, 498.0604},
    {3, MODE_DM, 0, 626.9236, 1739.1954, 501.5304},
    {3, MODE_DM, 0, 626.6468, 1730.1001, 501.5505},
    {3, MODE_DM, 0, 625.1944, 1732.9037, 505.6424},
    {3, MODE_DM, 0, 625.6563, 1702.1329, 501.5317},
    {3, MODE_DM, 0, 626.0129, 1713.2494, 501.5494}
};

static allowedAirsoftWeapons[13] = { 22, 24, 25, 27, 28, 29, 30, 31, 32, 33, 34, 35, 38 };

CMD:airsoft(playerid) {
    if(!IsPlayerLoggedIn(playerid)) return 1;
    if(GetPVarInt(playerid, "InAirsoft")) {
        if(Airsoft[GetPVarInt(playerid, "AirsoftRoom")][Leader] == playerid) {
            new string[128];
            format(string, sizeof(string), ""C1""CIZGI" {a1f049}Oyuncu At\n"C1""CIZGI" {a1f049}Oda Þifresi\t%s\n"C1""CIZGI" {a1f049}Odadan Çýk", Airsoft[GetPVarInt(playerid, "AirsoftRoom")][Password]);            
            Dialog_Show(playerid, AirsoftAdminPanel, DIALOG_STYLE_TABLIST, ""C7"EIGHTBORN - "C8"Airsoft", string, "Seç", "Ýptal");
        }
        else {
            Dialog_Show(playerid, AirsoftExit, DIALOG_STYLE_MSGBOX, ""C7"EIGHTBORN - "C8"Airsoft", ""C1"Airsoft odasýndan çýkýþ yapmak istiyor musunuz?\n ", "Evet", "Hayýr");
        }
    } else {
        if(IsPlayerInRangeOfPoint(playerid, 3.0, AIRSOFT_POS_X, AIRSOFT_POS_Y, AIRSOFT_POS_Z)) {
            new string[1024];
            format(string, sizeof(string), "Oda Ýsmi\tMod - Map\tSilah\tDoluluk\n");
            for(new i = 0; i < sizeof(Airsoft); i++) {
                if(Airsoft[i][Weapon] == 0) continue;
                if(isnull(Airsoft[i][Password])) 
                    format(string, sizeof(string), "%s"CIZGI" {a1f049}%s\t"C1"%s - %s\t%s\t%d/%d\n", string, Airsoft[i][Name], GetGamemodeName(Airsoft[i][Gamemode]), GetMapName(Airsoft[i][Map]), SilahIsim(Airsoft[i][Weapon]), GetUsersInAirsoftRoom(i), Airsoft[i][UserLimit]);
                else 
                    format(string, sizeof(string), "%s"CIZGI" {cc9966}%s\t"C1"%s - %s\t%s\t%d/%d\n", string, Airsoft[i][Name], GetGamemodeName(Airsoft[i][Gamemode]), GetMapName(Airsoft[i][Map]), SilahIsim(Airsoft[i][Weapon]), GetUsersInAirsoftRoom(i), Airsoft[i][UserLimit]);
                if(GetUsersInAirsoftRoom(i) == Airsoft[i][UserLimit]) 
                    format(string, sizeof(string), "%s"CIZGI" {993333}%s\t"C1"%s - %s\t%s\t%d/%d\n", string, Airsoft[i][Name], GetGamemodeName(Airsoft[i][Gamemode]), GetMapName(Airsoft[i][Map]), SilahIsim(Airsoft[i][Weapon]), GetUsersInAirsoftRoom(i), Airsoft[i][UserLimit]);
            }
            format(string, sizeof(string), "%s\n"CIZGI" {a3d9f3}Oda Kur", string);
            Dialog_Show(playerid, AirsoftRooms, DIALOG_STYLE_TABLIST_HEADERS, ""C7"EIGHTBORN - "C8"Airsoft", string, "Seç", "Ýptal");
        } else return Mesaj(playerid, HATA_MESAJ, "Airsoft yerinde deðilsiniz.");
    }
    return 1;
}

Dialog:AirsoftAdminPanel(playerid, response, listitem, inputtext[])
{
    if(response) {
        if(listitem == 0) {
            new string[1024], playerName[MAX_PLAYER_NAME+1];
            foreach(new i : Player) {
                if(GetPVarInt(i, "InAirsoft") && GetPVarInt(i, "AirsoftRoom") == GetPVarInt(playerid, "AirsoftRoom")) {
                    GetPlayerName(i, playerName, sizeof(playerName));
                    format(string, sizeof(string), "%s "CIZGI" %s(%d)\n", string, playerName, i);
                    Dialog_Show(playerid, AirsoftKickPlayer, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Airsoft", string, "Seç", "Ýptal");
                }
            }
        } else if(listitem == 1) {
            Dialog_Show(playerid, AirsoftChangeRoomPass, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Airsoft", ""C1"Odanýn þifresini girin:", "Seç", "Ýptal");
        } else if(listitem == 2) {
            TogglePlayerControllable(playerid, false);
            SetPlayerPos(playerid, AIRSOFT_POS_X, AIRSOFT_POS_Y, AIRSOFT_POS_Z);
            SetPlayerVirtualWorld(playerid, 0);
            SetPlayerInterior(playerid, 0);
            SetPlayerHealth(playerid, GetPVarFloat(playerid, "AirsoftOldHealth"));
            SetPlayerArmour(playerid, GetPVarFloat(playerid, "AirsoftOldArmour"));
            SetPlayerSkin(playerid, Karakter[playerid][skin]);
            DeletePVar(playerid, "InAirsoft");
            DeletePVar(playerid, "AirsoftRoom");
            DeletePVar(playerid, "AirsoftTeam");
            ResetPlayerWeapons(playerid);
            Mesaj(playerid, BILGI_MESAJ, "Airsoft odasýndan çýkýþ yaptýnýz.");
            SetTimerEx("UnfreezeTimer", 2500, false, "u", playerid);
        }
    }
    return 1;
}

Dialog:AirsoftKickPlayer(playerid, response, listitem, inputtext[])
{
	if(response)
	{
        new count = -1;
        foreach(new i : Player) {
            if(GetPVarInt(i, "InAirsoft") && GetPVarInt(i, "AirsoftRoom") == GetPVarInt(playerid, "AirsoftRoom")) {
                count++;
                if(count == listitem) {
                    TogglePlayerControllable(i, false);
                    SetPlayerPos(i, AIRSOFT_POS_X, AIRSOFT_POS_Y, AIRSOFT_POS_Z);
                    SetPlayerVirtualWorld(i, 0);
                    SetPlayerInterior(i, 0);
                    SetPlayerHealth(i, GetPVarFloat(i, "AirsoftOldHealth"));
                    SetPlayerArmour(i, GetPVarFloat(playerid, "AirsoftOldArmour"));
                    SetPlayerSkin(i, Karakter[i][skin]);
                    DeletePVar(i, "InAirsoft");
                    DeletePVar(i, "AirsoftRoom");
                    DeletePVar(i, "AirsoftTeam");
                    ResetPlayerWeapons(i);
                    Mesaj(i, BILGI_MESAJ, "Airsoft odasýndan oda yöneticisi tarafýndan atýldýnýz.");
                    new playerName[MAX_PLAYER_NAME+1];
                    GetPlayerName(i, playerName, sizeof(playerName));
                    Mesaj(playerid, BILGI_MESAJ, "%s(%d) oyuncuyu odadan attýnýz.", playerName, i);
                    SetTimerEx("UnfreezeTimer", 2500, false, "u", i);
                }
            }
        }
    }
    return 1;
}

Dialog:AirsoftChangeRoomPass(playerid, response, listitem, inputtext[])
{
	if(response)
	{
        if(strlen(inputtext) >= 23) {
            Mesaj(playerid, HATA_MESAJ, "Oda þifresi 24 karakterden kýsa olmalýdýr.");
            return Dialog_Show(playerid, AirsoftChangeRoomPass, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Airsoft", ""C1"Odanýn þifresini girin:", "Seç", "Ýptal");
        }
        new roomID = GetPVarInt(playerid, "AirsoftRoom");
        format(Airsoft[roomID][Password], 24, "%s", inputtext);
        Mesaj(playerid, BILGI_MESAJ, "Airsoft odasýnýn þifresini %s olarak ayarladýnýz.", inputtext);
    }
    return 1;
}

Dialog:AirsoftExit(playerid, response, listitem, inputtext[])
{
    if(response) {
        new playerName[MAX_PLAYER_NAME+1], string[64];
        GetPlayerName(playerid, playerName, sizeof(playerName));
        format(string, sizeof(string), "%s(%d) odadan çýktý.", playerName, playerid);
        AirsoftMessage(GetPVarInt(playerid, "AirsoftRoom"), string);
        TogglePlayerControllable(playerid, false);
        SetPlayerPos(playerid, AIRSOFT_POS_X, AIRSOFT_POS_Y, AIRSOFT_POS_Z);
        SetPlayerVirtualWorld(playerid, 0);
        SetPlayerInterior(playerid, 0);
        SetPlayerHealth(playerid, GetPVarFloat(playerid, "AirsoftOldHealth"));
        SetPlayerArmour(playerid, GetPVarFloat(playerid, "AirsoftOldArmour"));
        SetPlayerSkin(playerid, Karakter[playerid][skin]);
        DeletePVar(playerid, "InAirsoft");
        DeletePVar(playerid, "AirsoftRoom");
        DeletePVar(playerid, "AirsoftTeam");
        ResetPlayerWeapons(playerid);
        Mesaj(playerid, BILGI_MESAJ, "Airsoft odasýndan çýkýþ yaptýnýz.");
        SetTimerEx("UnfreezeTimer", 2500, false, "u", playerid);
    }
    return 1;
}

Dialog:AirsoftRooms(playerid, response, listitem, inputtext[])
{
	if(response)
	{
       if(!strcmp(inputtext,""CIZGI" Oda Kur")) {
            if(CountAirsoftRooms() == sizeof(Airsoft)) { Mesaj(playerid, HATA_MESAJ, "Oda sýnýrý dolu."); Mesaj(playerid, IPUCU_MESAJ, "Oda kurmak için bir odanýn kapanmasýný bekleyin."); return 1; }
            SetPVarString(playerid, "AirsoftRoomName", "Airsoft Odasý");
            SetPVarString(playerid, "AirsoftRoomPassword", "");
            SetPVarInt(playerid, "AirsoftRoomMap", 1);
            SetPVarInt(playerid, "AirsoftRoomGamemode", 1);
            SetPVarInt(playerid, "AirsoftRoomWeapon", 24);
            SetPVarInt(playerid, "AirsoftRoomUserLimit", 10);
            SetPVarInt(playerid, "AirsoftRoomTimeLimit", 5);
            ShowCreateAirsoftRoomDialog(playerid);
       } else {
           new count = -1;
           for(new i = 0; i < sizeof(Airsoft); i++) {
                if(Airsoft[i][Weapon] == 0) continue;
                count++;
                if(listitem == count) {
                    if(GetUsersInAirsoftRoom(i) == Airsoft[i][UserLimit]) {
                        Mesaj(playerid, HATA_MESAJ, "Bu odada yer yok.");
                        cmd_airsoft(playerid);
                        return 1;
                    }
                    if(!isnull(Airsoft[i][Password])) {
                        SetPVarInt(playerid, "AirsoftEnteringRoom", i);
                        new string[1024];
                        format(string, sizeof(string), ""C1""CIZGI" {61A347}Oda Adý\t "C1"%s\n"CIZGI" {61A347}Oda Sahibi\t "C1"%s\n"CIZGI" {61A347}Harita\t\t "C1"%s\n"CIZGI" {61A347}Oyun Modu\t "C1"%s\n"CIZGI" {61A347}Silah\t\t "C1"%s\n"CIZGI" {61A347}Doluluk\t "C1"%d/%d\n\n"C1"Odanýn þifresini girin:", 
                        Airsoft[i][Name], OyuncuAdiniBul(Airsoft[i][Leader]), GetMapName(Airsoft[i][Map]), GetGamemodeName(Airsoft[i][Gamemode]), SilahIsim(Airsoft[i][Weapon]), GetUsersInAirsoftRoom(i), Airsoft[i][UserLimit]);
                        Dialog_Show(playerid, AirsoftRoomPassword, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Airsoft", string, "Gir", "Ýptal");
                        return 1;
                    }
                    SetPVarInt(playerid, "InAirsoft", 1);
                    SetPVarInt(playerid, "AirsoftRoom", i);
                    Mesaj(playerid, BILGI_MESAJ, "%s odasýna girdiniz.", Airsoft[i][Name]);
                    if(Airsoft[i][Gamemode] == MODE_TDM) {
                        new string[1024], teamUserNames[2][10][MAX_PLAYER_NAME+1];
                        for(new j = 0; j < sizeof(teamUserNames); j++) {
                            for(new k = 0; k < sizeof(teamUserNames[]); k++) {
                                teamUserNames[j][k] = " ";
                            }
                        }
                        foreach(new j : Player) {
                            if(GetPVarInt(i, "InAirsoft") && GetPVarInt(i, "AirsoftRoom") == i) {
                                printf("%d - %d", GetPVarInt(j, "AirsoftTeam"), sizeof(teamUserNames[]));
                                for(new k = 0; k < sizeof(teamUserNames[]); k++) {
                                    if(!strcmp(teamUserNames[GetPVarInt(j, "AirsoftTeam")-1][k], " ")) {
                                        new playerName[MAX_PLAYER_NAME+1];
                                        GetPlayerName(j, playerName, sizeof(playerName));
                                        format(teamUserNames[GetPVarInt(j, "AirsoftTeam")-1][k], MAX_PLAYER_NAME+1, "%s", playerName);
                                        break;
                                    }
                                }
                            }
                        }
                        format(string, sizeof(string), "Takým 1\tTakým2\n");
                        for(new k = 0; k < sizeof(teamUserNames[]); k++) {
                            format(string, sizeof(string), "%s%s\t%s\n", string, teamUserNames[0][k], teamUserNames[1][k]);
                        }
                        format(string, sizeof(string), "%s\n"C3"(Seçiminizi aþaðýdaki tuþlardan yapýn.)\t ", string);
                        Dialog_Show(playerid, AirsoftRoomSelectTeam, DIALOG_STYLE_TABLIST_HEADERS, ""C7"EIGHTBORN - "C8"Airsoft", string, "Takým 1", "Takým 2");
                    } else {
                        new j = randomEx(20+(Airsoft[i][Map]-1)*40, 20+(Airsoft[i][Map]-1)*40+19);
                        SetPlayerPos(playerid, AirsoftMapPositions[j][PosX], AirsoftMapPositions[j][PosY], AirsoftMapPositions[j][PosZ]);
                        SetPlayerVirtualWorld(playerid, Airsoft[i][Leader]);
                        SetPlayerInterior(playerid, 100);
                        TogglePlayerControllable(playerid, false);
                        new Float:playerHP, Float:playerArmour;
                        GetPlayerHealth(playerid, playerHP);
                        GetPlayerArmour(playerid, playerArmour);
                        SetPVarFloat(playerid, "AirsoftOldHealth", playerHP);
                        SetPVarFloat(playerid, "AirsoftOldArmour", playerArmour);
                        new playerName[MAX_PLAYER_NAME+1], stringex[64];
                        GetPlayerName(playerid, playerName, sizeof(playerName));
                        format(stringex, sizeof(stringex), "%s(%d) odaya katýldý.", playerName, playerid);
                        AirsoftMessage(i, stringex);
                        if(!Airsoft[i][Started]) {
                            Mesaj(playerid, IPUCU_MESAJ, "Oyun daha baþlamamýþ, oyunun baþlamasýný bekleyin.");
                        } else {
                            ResetPlayerWeapons(playerid);
                            GivePlayerWeapon(playerid, Airsoft[i][Weapon], 9999);
                            SetPlayerHealth(playerid, 100);
                            SetPlayerArmour(playerid, 0);
                            SetPlayerSkin(playerid, AirsoftSkins[2][Skin]);
                        }
                        SetTimerEx("UnfreezeTimer", 2500, false, "u", playerid);
                    }
                }
           }
       }
    }
    return 1;
}

Dialog:AirsoftRoomSelectTeam(playerid, response, listitem, inputtext[])
{
	if(response) Mesaj(playerid, BILGI_MESAJ, "Takým 1'i seçtiniz.");
    else Mesaj(playerid, BILGI_MESAJ, "Takým 2'yi seçtiniz.");
    new playerTeam = (response)?1:2;
    SetPVarInt(playerid, "AirsoftTeam", playerTeam);
    TogglePlayerControllable(playerid, false);
    new roomID = GetPVarInt(playerid, "AirsoftRoom");
    new playerName[MAX_PLAYER_NAME+1], string[64];
    GetPlayerName(playerid, playerName, sizeof(playerName));
    format(string, sizeof(string), "%s(%d) odaya katýldý [Takým %d].", playerName, playerid, playerTeam);
    AirsoftMessage(roomID, string);
    new i = randomEx((Airsoft[roomID][Map]-1)*(playerTeam), (Airsoft[roomID][Map]-1)*(playerTeam)+9);
    SetPlayerPos(playerid, AirsoftMapPositions[i][PosX], AirsoftMapPositions[i][PosY], AirsoftMapPositions[i][PosZ]);
    SetPlayerVirtualWorld(playerid, Airsoft[roomID][Leader]);
    SetPlayerInterior(playerid, 100);
    SetTimerEx("UnfreezeTimer", 2500, false, "u", playerid);
    new Float:playerHP, Float:playerArmour;
    GetPlayerHealth(playerid, playerHP);
    GetPlayerArmour(playerid, playerArmour);
    SetPVarFloat(playerid, "AirsoftOldHealth", playerHP);
    SetPVarFloat(playerid, "AirsoftOldArmour", playerArmour);
    if(Airsoft[roomID][Started]) {
        ResetPlayerWeapons(playerid);
        GivePlayerWeapon(playerid, Airsoft[roomID][Weapon], 9999);
        SetPlayerHealth(playerid, 100);
        SetPlayerArmour(playerid, 0);
        SetPlayerSkin(playerid, AirsoftSkins[playerTeam-1][Skin]);
        AirsoftStats[playerid][Kill] = 0;
        AirsoftStats[playerid][Death] = 0;
        AirsoftStats[playerid][Shots] = 0;
        AirsoftStats[playerid][Headshots] = 0;
    } else {
        Mesaj(playerid, IPUCU_MESAJ, "Oyun daha baþlamamýþ, oyunun baþlamasýný bekleyin.");
    }
    return 1;
}

Dialog:AirsoftRoomPassword(playerid, response, listitem, inputtext[])
{
	if(response)
	{
        if(!strcmp(inputtext,Airsoft[GetPVarInt(playerid, "AirsoftEnteringRoom")][Password])) {
            SetPVarInt(playerid, "InAirsoft", 1);
            new i = GetPVarInt(playerid, "AirsoftEnteringRoom");
            SetPVarInt(playerid, "AirsoftRoom", i);
            Mesaj(playerid, BILGI_MESAJ, "%s odasýna girdiniz.", Airsoft[i][Name]);
            if(Airsoft[i][Gamemode] == MODE_TDM) {
                new string[1024], teamUserNames[2][10][MAX_PLAYER_NAME+1];
                for(new j = 0; j < sizeof(teamUserNames); j++) {
                    for(new k = 0; k < sizeof(teamUserNames[]); k++) {
                        teamUserNames[j][k] = " ";
                    }
                }
                foreach(new j : Player) {
                    if(GetPVarInt(i, "InAirsoft") && GetPVarInt(i, "AirsoftRoom") == i) {
                        for(new k = 0; k < sizeof(teamUserNames[]); k++) {
                            if(!strcmp(teamUserNames[GetPVarInt(j, "AirsoftTeam")-1][k], " ")) {
                                new playerName[MAX_PLAYER_NAME+1];
                                GetPlayerName(j, playerName, sizeof(playerName));
                                format(teamUserNames[GetPVarInt(j, "AirsoftTeam")-1][k], MAX_PLAYER_NAME+1, "%s", playerName);
                                break;
                            }
                        }
                    }
                }
                format(string, sizeof(string), "Takým 1\tTakým2\n");
                for(new k = 0; k < sizeof(teamUserNames[]); k++) {
                    format(string, sizeof(string), "%s%s\t%s\n", string, teamUserNames[0][k], teamUserNames[1][k]);
                }
                format(string, sizeof(string), "%s\n"C3"(Seçiminizi aþaðýdaki tuþlardan yapýn.)\t ", string);
                Dialog_Show(playerid, AirsoftRoomSelectTeam, DIALOG_STYLE_TABLIST_HEADERS, ""C7"EIGHTBORN - "C8"Airsoft", string, "Takým 1", "Takým 2");
            } else {
                new j = randomEx(20+(Airsoft[i][Map]-1)*40, 20+(Airsoft[i][Map]-1)*40+19);
                SetPlayerPos(playerid, AirsoftMapPositions[j][PosX], AirsoftMapPositions[j][PosY], AirsoftMapPositions[j][PosZ]);
                SetPlayerVirtualWorld(playerid, Airsoft[i][Leader]);
                SetPlayerInterior(playerid, 100);
                TogglePlayerControllable(playerid, false);
                new Float:playerHP, Float:playerArmour;
                GetPlayerHealth(playerid, playerHP);
                GetPlayerArmour(playerid, playerArmour);
                SetPVarFloat(playerid, "AirsoftOldHealth", playerHP);
                SetPVarFloat(playerid, "AirsoftOldArmour", playerArmour);
                new playerName[MAX_PLAYER_NAME+1], stringex[64];
                GetPlayerName(playerid, playerName, sizeof(playerName));
                format(stringex, sizeof(stringex), "%s(%d) odaya katýldý.", playerName, playerid);
                AirsoftMessage(i, stringex);
                if(!Airsoft[i][Started]) {
                    Mesaj(playerid, IPUCU_MESAJ, "Oyun daha baþlamamýþ, oyunun baþlamasýný bekleyin.");
                } else {
                    ResetPlayerWeapons(playerid);
                    GivePlayerWeapon(playerid, Airsoft[i][Weapon], 9999);
                    SetPlayerHealth(playerid, 100);
                    SetPlayerArmour(playerid, 0);
                    SetPlayerSkin(playerid, AirsoftSkins[2][Skin]);
                    AirsoftStats[playerid][Kill] = 0;
                    AirsoftStats[playerid][Death] = 0;
                    AirsoftStats[playerid][Shots] = 0;
                    AirsoftStats[playerid][Headshots] = 0;
                }    
                SetTimerEx("UnfreezeTimer", 2500, false, "u", playerid);
            }
        }
        else {
            Mesaj(playerid, HATA_MESAJ, "Oda þifresini yanlýþ girdiniz.");
        }
    }
    DeletePVar(playerid, "AirsoftEnteringRoom");
    return 1;
}

ShowCreateAirsoftRoomDialog(playerid) {
    new string[1024], roomName[24], roomPassword[24], roomMap = GetPVarInt(playerid, "AirsoftRoomMap"), roomGamemode = GetPVarInt(playerid, "AirsoftRoomGamemode"), roomWeapon = GetPVarInt(playerid, "AirsoftRoomWeapon"),
    roomUserLimit = GetPVarInt(playerid, "AirsoftRoomUserLimit"), roomTimeLimit = GetPVarInt(playerid, "AirsoftRoomTimeLimit");
    GetPVarString(playerid, "AirsoftRoomName", roomName, sizeof(roomName));
    GetPVarString(playerid, "AirsoftRoomPassword", roomPassword, sizeof(roomPassword));
    format(string, sizeof(string), "Özellik\tDurum\n"CIZGI" {bada55}Oda Adý\t"C1"%s\n"CIZGI" {bada55}Þifre\t"C1"%s\n"CIZGI" {bada55}Oyun Haritasý\t"C1"%s\n"CIZGI" {bada55}Oyun Modu\t"C1"%s\n"CIZGI" {bada55}Oyuncu Sýnýrý\t"C1"%d\n"CIZGI" {bada55}Silah\t"C1"%s\n"CIZGI" {bada55}Oyun Süresi\t"C1"%d dakika\n \n"CIZGI" {a3d9f3}Oda Kur",
    roomName, roomPassword, GetMapName(roomMap), GetGamemodeName(roomGamemode), roomUserLimit, SilahIsim(roomWeapon), roomTimeLimit);
    Dialog_Show(playerid, AirsoftCreateRoom, DIALOG_STYLE_TABLIST_HEADERS, ""C7"EIGHTBORN - "C8"Airsoft", string, "Seç", "Ýptal");
}

Dialog:AirsoftCreateRoom(playerid, response, listitem, inputtext[])
{
	if(response)
	{
        if(!strcmp(inputtext,""CIZGI" Oda Kur")) {
            new roomID = -1;
            for(new i = 0; i < sizeof(Airsoft); i++) {
                if(Airsoft[i][Weapon] == 0) {
                    roomID = i;
                    break;
                }
            }
            if(roomID == -1) return Mesaj(playerid, HATA_MESAJ, "Oda sýnýrý dolmuþ, þu an oda açamazsýnýz.");
            Airsoft[roomID][Leader] = playerid;
            GetPVarString(playerid, "AirsoftRoomName", Airsoft[roomID][Name], 24);
            GetPVarString(playerid, "AirsoftRoomPassword", Airsoft[roomID][Password], 24);
            Airsoft[roomID][Weapon] = GetPVarInt(playerid, "AirsoftRoomWeapon");
            Airsoft[roomID][Gamemode] = GetPVarInt(playerid, "AirsoftRoomGamemode");
            Airsoft[roomID][Map] = GetPVarInt(playerid, "AirsoftRoomMap");
            Airsoft[roomID][UserLimit] = GetPVarInt(playerid, "AirsoftRoomUserLimit");
            Airsoft[roomID][TimeLimit] = GetPVarInt(playerid, "AirsoftRoomTimeLimit");
            Airsoft[roomID][CurrentTime] = 0;
            Airsoft[roomID][Started] = false;
            SetPVarInt(playerid, "AirsoftRoom", roomID);
            SetPVarInt(playerid, "InAirsoft", 1);
            if(Airsoft[roomID][Gamemode] == MODE_TDM) {
                return Dialog_Show(playerid, AirsoftCreateRoomTeam, DIALOG_STYLE_MSGBOX, ""C7"EIGHTBORN - "C8"Airsoft", ""C1"Hangi takýmda yer almak istiyorsunuz?\n ", "Takým 1", "Takým 2");
            }
            else {
                TogglePlayerControllable(playerid, false);
                new i = randomEx(20+(Airsoft[roomID][Map]-1)*40, 20+(Airsoft[roomID][Map]-1)*40+19);
                SetPlayerPos(playerid, AirsoftMapPositions[i][PosX], AirsoftMapPositions[i][PosY], AirsoftMapPositions[i][PosZ]);
                SetPlayerVirtualWorld(playerid, Airsoft[roomID][Leader]);
                SetPlayerInterior(playerid, 100);
                new Float:playerHP, Float:playerArmour;
                GetPlayerHealth(playerid, playerHP);
                GetPlayerArmour(playerid, playerArmour);
                SetPVarFloat(playerid, "AirsoftOldHealth", playerHP);
                SetPVarFloat(playerid, "AirsoftOldArmour", playerArmour);
                SetTimerEx("UnfreezeTimer", 2500, false, "u", playerid);
                GameTextForPlayer(playerid, "~y~~h~Oyun 30 Saniye Icinde Basliyor!", 30000, 6);
                defer StartAirsoft(roomID);
            }
            Mesaj(playerid, BILGI_MESAJ, "%s adýnda bir oda kurdunuz, oda þifresi : %s", Airsoft[roomID][Name], Airsoft[roomID][Password]);
            Mesaj(playerid, IPUCU_MESAJ, "/airsoft yazarak yönetim paneline eriþebilirsiniz.");
        } else {
           if(listitem == 0) return Dialog_Show(playerid, AirsoftCreateRoomName, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Airsoft", ""C1"Odanýn adýný girin:", "Seç", "Ýptal");
           else if(listitem == 1) return Dialog_Show(playerid, AirsoftCreateRoomPass, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Airsoft", ""C1"Odanýn þifresini girin:", "Seç", "Ýptal");
           else if(listitem == 2) {
               new string[128];
               for(new i = 0; i < sizeof(AirsoftMaps); i++) {
                   format(string, sizeof(string), "%s"CIZGI" {ffba6b}%s\n", string, GetMapName(i+1));
               }
               return Dialog_Show(playerid, AirsoftCreateRoomMap, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Airsoft", string, "Seç", "Ýptal");
           }
           else if(listitem == 3) return Dialog_Show(playerid, AirsoftCreateRoomMode, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Airsoft", ""CIZGI" {ffba6b}Deathmatch\n"CIZGI" {ffba6b}Team Deathmatch", "Seç", "Ýptal");
           else if(listitem == 4) return Dialog_Show(playerid, AirsoftCreateRoomULimit, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Airsoft", ""C1"Oyuncu sýnýrýný girin:", "Seç", "Ýptal");
           else if(listitem == 5) {
               new string[512];
               for(new i = 0; i < sizeof(allowedAirsoftWeapons); i++) {
                   format(string, sizeof(string), "%s"CIZGI" {ffba6b}%s\n", string, SilahIsim(allowedAirsoftWeapons[i]));
               }
               return Dialog_Show(playerid, AirsoftCreateRoomWeapon, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Airsoft", string, "Seç", "Ýptal");
           }
           else if(listitem == 6) return Dialog_Show(playerid, AirsoftCreateRoomTLimit, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Airsoft", ""C1"Oyun süresini girin:", "Seç", "Ýptal");
           else ShowCreateAirsoftRoomDialog(playerid);
        }
    }
    return 1;
}

Dialog:AirsoftCreateRoomName(playerid, response, listitem, inputtext[])
{
	if(response)
	{
        if(strlen(inputtext) >= 23) {
            Mesaj(playerid, HATA_MESAJ, "Oda adý 24 karakterden kýsa olmalýdýr.");
            return Dialog_Show(playerid, AirsoftCreateRoomName, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Airsoft", ""C1"Odanýn adýný girin:", "Seç", "Ýptal");
        }
        SetPVarString(playerid, "AirsoftRoomName", inputtext);
        Mesaj(playerid, BILGI_MESAJ, "Airsoft odasýnýn adýný %s olarak ayarladýnýz.", inputtext);
        ShowCreateAirsoftRoomDialog(playerid);
    }
    return 1;
}

Dialog:AirsoftCreateRoomPass(playerid, response, listitem, inputtext[])
{
	if(response)
	{
        if(strlen(inputtext) >= 23) {
            Mesaj(playerid, HATA_MESAJ, "Oda þifresi 24 karakterden kýsa olmalýdýr.");
            return Dialog_Show(playerid, AirsoftCreateRoomPass, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Airsoft", ""C1"Odanýn þifresini girin:", "Seç", "Ýptal");
        }
        SetPVarString(playerid, "AirsoftRoomPassword", inputtext);
        Mesaj(playerid, BILGI_MESAJ, "Airsoft odasýnýn þifresini %s olarak ayarladýnýz.", inputtext);
        ShowCreateAirsoftRoomDialog(playerid);
    }
    return 1;
}

Dialog:AirsoftCreateRoomMode(playerid, response, listitem, inputtext[])
{
	if(response)
	{
        /*SetPVarInt(playerid, "AirsoftRoomGamemode", listitem+1);
        Mesaj(playerid, BILGI_MESAJ, "Airsoft odasýnýn oyun modunu %s olarak ayarladýnýz.", GetGamemodeName(listitem+1));*/
        Mesaj(playerid, HATA_MESAJ, "Ýnaktif.");
        ShowCreateAirsoftRoomDialog(playerid);
    }
    return 1;
}

Dialog:AirsoftCreateRoomTeam(playerid, response, listitem, inputtext[])
{
	if(response) Mesaj(playerid, BILGI_MESAJ, "Takým 1'i seçtiniz.");
    else Mesaj(playerid, BILGI_MESAJ, "Takým 2'yi seçtiniz.");
    new playerTeam = (response)?1:2;
    SetPVarInt(playerid, "AirsoftTeam", playerTeam);
    TogglePlayerControllable(playerid, false);
    new roomID = GetPVarInt(playerid, "AirsoftRoom");
    new i = randomEx((Airsoft[roomID][Map]-1)*(playerTeam), (Airsoft[roomID][Map]-1)*(playerTeam)+9);
    SetPlayerPos(playerid, AirsoftMapPositions[i][PosX], AirsoftMapPositions[i][PosY], AirsoftMapPositions[i][PosZ]);
    SetPlayerVirtualWorld(playerid, Airsoft[roomID][Leader]);
    SetPlayerInterior(playerid, 100);
    new Float:playerHP, Float:playerArmour;
    GetPlayerHealth(playerid, playerHP);
    GetPlayerArmour(playerid, playerArmour);
    SetPVarFloat(playerid, "AirsoftOldHealth", playerHP);
    SetPVarFloat(playerid, "AirsoftOldArmour", playerArmour);
    SetTimerEx("UnfreezeTimer", 2500, false, "u", playerid);
    GameTextForPlayer(playerid, "~y~~h~Oyun 30 Saniye Icinde Basliyor!", 30000, 6);
    defer StartAirsoft(roomID);
    return 1;
}

Dialog:AirsoftCreateRoomMap(playerid, response, listitem, inputtext[])
{
	if(response)
	{
        SetPVarInt(playerid, "AirsoftRoomMap", listitem+1);
        Mesaj(playerid, BILGI_MESAJ, "Airsoft odasýnýn haritasýný %s olarak ayarladýnýz.", GetMapName(listitem+1));
        ShowCreateAirsoftRoomDialog(playerid);
    }
    return 1;
}

Dialog:AirsoftCreateRoomWeapon(playerid, response, listitem, inputtext[])
{
	if(response)
	{
        SetPVarInt(playerid, "AirsoftRoomWeapon", allowedAirsoftWeapons[listitem]);
        Mesaj(playerid, BILGI_MESAJ, "Airsoft odasýnýn silahýný %s olarak ayarladýnýz.", SilahIsim(allowedAirsoftWeapons[listitem]));
        ShowCreateAirsoftRoomDialog(playerid);
    }
    return 1;
}

Dialog:AirsoftCreateRoomULimit(playerid, response, listitem, inputtext[])
{
	if(response)
	{
        if(strval(inputtext) > 20) {
            Mesaj(playerid, HATA_MESAJ, "Oyuncu sýnýrý maksimum 20 olabilir.");
            return Dialog_Show(playerid, AirsoftCreateRoomULimit, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Airsoft", ""C1"Oyuncu sýnýrýný girin:", "Seç", "Ýptal");
        }
        else if(strval(inputtext) < 2) {
            Mesaj(playerid, HATA_MESAJ, "Oyuncu sýnýrý minimum 2 olabilir.");
            return Dialog_Show(playerid, AirsoftCreateRoomULimit, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Airsoft", ""C1"Oyuncu sýnýrýný girin:", "Seç", "Ýptal");
        }
        SetPVarInt(playerid, "AirsoftRoomUserLimit", strval(inputtext));
        Mesaj(playerid, BILGI_MESAJ, "Airsoft odasýnýn oyuncu sýnýrýný %d olarak ayarladýnýz.", strval(inputtext));
        ShowCreateAirsoftRoomDialog(playerid);
    }
    return 1;
}

Dialog:AirsoftCreateRoomTLimit(playerid, response, listitem, inputtext[])
{
	if(response)
	{
        if(strval(inputtext) > 20) {
            Mesaj(playerid, HATA_MESAJ, "Oyun süresi maksimum 20 dakika olabilir.");
            return Dialog_Show(playerid, AirsoftCreateRoomTLimit, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Airsoft", ""C1"Oyun süresini girin:", "Seç", "Ýptal");
        }
        else if(strval(inputtext) < 2) {
            Mesaj(playerid, HATA_MESAJ, "Oyun süresi minimum 2 dakika olabilir.");
            return Dialog_Show(playerid, AirsoftCreateRoomTLimit, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Airsoft", ""C1"Oyun süresini girin:", "Seç", "Ýptal");
        }
        SetPVarInt(playerid, "AirsoftRoomTimeLimit", strval(inputtext));
        Mesaj(playerid, BILGI_MESAJ, "Airsoft odasýnýn zaman sýnýrýný %d olarak ayarladýnýz.", strval(inputtext));
        ShowCreateAirsoftRoomDialog(playerid);
    }
    return 1;
}

hook OnPlayerDisconnect(playerid, reason) {
    DeletePVar(playerid, "AirsoftRoom");
    DeletePVar(playerid, "InAirsoft");
    DeletePVar(playerid, "AirsoftTeam");
    DeletePVar(playerid, "AirsoftRoomName");
    DeletePVar(playerid, "AirsoftRoomPassword");
    DeletePVar(playerid, "AirsoftRoomMap");
    DeletePVar(playerid, "AirsoftRoomGamemode");
    DeletePVar(playerid, "AirsoftRoomWeapon");
    DeletePVar(playerid, "AirsoftRoomUserLimit");
    DeletePVar(playerid, "AirsoftRoomTimeLimit");
    DeletePVar(playerid, "AirsoftOldArmour");
    DeletePVar(playerid, "AirsoftOldHealth");
    DeletePVar(playerid, "AirsoftInFreeze");
    return 1;
}

hook OnGameModeInit() {
    LoadMaps();
    return 1;
}

GetUsersInAirsoftRoom(room) {
    new count = 0;
    foreach(new i : Player) {
        if(GetPVarInt(i, "InAirsoft") && GetPVarInt(i, "AirsoftRoom") == room)
            count++;
    }
    return count;
}

CountAirsoftRooms() {
    new count = 0;
    for(new i = 0; i < sizeof(Airsoft); i++) {
        if(Airsoft[i][Weapon] == 0) continue;
        count++;
    }
    return count;
}

GetGamemodeName(mode) {
    new string[4];
    string = "Yok";
    switch(mode) {
        case MODE_DM:
            string = "DM";
        case MODE_TDM:
            string = "TDM";
    }
    return string; 
}

GetMapName(map) {
    new string[12];
    string = "Yok";
    if(map > 0)
        format(string, sizeof(string), "%s", AirsoftMaps[map-1]);
    return string;
}

timer StartAirsoft[30000](roomID)
{
    foreach(new i : Player) {
        if(GetPVarInt(i, "InAirsoft") && GetPVarInt(i, "AirsoftRoom") == roomID) {
            if(Airsoft[roomID][Gamemode] == MODE_TDM) {
                new j = randomEx((Airsoft[roomID][Map]-1)*(GetPVarInt(i, "AirsoftTeam")-1), (Airsoft[roomID][Map]-1)*(GetPVarInt(i, "AirsoftTeam")-1)+9);
                SetPlayerPos(i, AirsoftMapPositions[j][PosX], AirsoftMapPositions[j][PosY], AirsoftMapPositions[j][PosZ]);
                SetPlayerSkin(i, AirsoftSkins[GetPVarInt(i, "AirsoftTeam")-1][Skin]);
            }
            else {
                new j = randomEx(20+(Airsoft[roomID][Map]-1)*40, 20+(Airsoft[roomID][Map]-1)*40+19);
                SetPlayerPos(i, AirsoftMapPositions[j][PosX], AirsoftMapPositions[j][PosY], AirsoftMapPositions[j][PosZ]);
                SetPlayerSkin(i, AirsoftSkins[2][Skin]);
            }
            GameTextForPlayer(i, "~g~~h~Oyun Basladi!", 2500, 6);
            ResetPlayerWeapons(i);
            GivePlayerWeapon(i, Airsoft[roomID][Weapon], 9999);
            SetPlayerHealth(i, 100);
            SetPlayerArmour(i, 0);
            AirsoftStats[i][Kill] = 0;
            AirsoftStats[i][Death] = 0;
            AirsoftStats[i][Shots] = 0;
            AirsoftStats[i][Headshots] = 0;
        }
    }
    Airsoft[roomID][Started] = true;
    defer AirsoftTimeCheck(roomID);
}

timer AirsoftTimeCheck[10000](roomID)
{
    Airsoft[roomID][CurrentTime] += 10;
    if(Airsoft[roomID][TimeLimit]*60 <= Airsoft[roomID][CurrentTime]) {
        FinishAirsoft(roomID);
    }
    else {
        if(Airsoft[roomID][TimeLimit]*60-Airsoft[roomID][CurrentTime] <= 10) {
            AirsoftMessage(roomID, "Sürenin dolmasýna 10 saniyeden az bir süre kaldý.");
        } else if(Airsoft[roomID][TimeLimit]*60-Airsoft[roomID][CurrentTime] <= 20) {
            AirsoftMessage(roomID, "Sürenin dolmasýna 20 saniyeden az bir süre kaldý.");
        } else if(Airsoft[roomID][TimeLimit]*60-Airsoft[roomID][CurrentTime] <= 30) {
            AirsoftMessage(roomID, "Sürenin dolmasýna 30 saniyeden az bir süre kaldý.");
        } else if(Airsoft[roomID][TimeLimit]*60-Airsoft[roomID][CurrentTime] == 60) {
            AirsoftMessage(roomID, "Sürenin dolmasýna 1 dakikadan az kaldý.");
        }
        defer AirsoftTimeCheck(roomID);
    }
}

GetAirsoftBestPlayer(roomID) {
    new bestPlayer = -1;
    foreach(new i : Player) {
        if(GetPVarInt(i, "InAirsoft") && GetPVarInt(i, "AirsoftRoom") == roomID) {
            if(bestPlayer == -1) bestPlayer = i;
            else if((AirsoftStats[i][Kill] > AirsoftStats[bestPlayer][Kill]) || (AirsoftStats[i][Kill] == AirsoftStats[bestPlayer][Kill] && AirsoftStats[i][Death] < AirsoftStats[bestPlayer][Death])) bestPlayer = i;
        }
    }
    return bestPlayer;
}

FinishAirsoft(roomID) {
    new bestPlayer = GetAirsoftBestPlayer(roomID), string[256], playerName[MAX_PLAYER_NAME+1];
    if(bestPlayer != -1) {
        GetPlayerName(bestPlayer, playerName, sizeof(playerName));
        format(string, sizeof(string), ""C1"\tEn Ýyi Oyuncu\n"C1""CIZGI" %s(%d)\n"C1""CIZGI" Öldürme: \t\t{a50000}%d\n"C1""CIZGI" Ölüm: \t\t%d\n"C1""CIZGI" K/D: \t\t%.2f \
        \n"C1""CIZGI" Headshot Oraný: \t{ffcf3c}%d/%d (%.2f%c)", playerName, bestPlayer, AirsoftStats[bestPlayer][Kill], AirsoftStats[bestPlayer][Death], float(AirsoftStats[bestPlayer][Kill])/float(AirsoftStats[bestPlayer][Death]), AirsoftStats[bestPlayer][Headshots], AirsoftStats[bestPlayer][Shots], ((100.0*float(AirsoftStats[bestPlayer][Headshots]))/float(AirsoftStats[bestPlayer][Shots])), '%');
    }
    foreach(new i : Player) {
        if(GetPVarInt(i, "InAirsoft") && GetPVarInt(i, "AirsoftRoom") == roomID) {
            SendClientMessageEx(i, -1, ""C1""CIZGI" {5e64c1}[Airsoft] "C1"Oyun süresi sona erdi.");
            TogglePlayerControllable(i, false);
            SetPlayerPos(i, AIRSOFT_POS_X, AIRSOFT_POS_Y, AIRSOFT_POS_Z);
            SetPlayerInterior(i, 0);
            SetPlayerVirtualWorld(i, 0);
            SetPlayerHealth(i, GetPVarFloat(i, "AirsoftOldHealth"));
            SetPlayerArmour(i, GetPVarFloat(i, "AirsoftOldArmour"));
            SetPlayerSkin(i, Karakter[i][skin]);
            DeletePVar(i, "InAirsoft");
            DeletePVar(i, "AirsoftRoom");
            DeletePVar(i, "AirsoftTeam");
            ResetPlayerWeapons(i);
            SetTimerEx("UnfreezeTimer", 2500, false, "u", i);
            Dialog_Show(i, AirsoftBestPlayer, DIALOG_STYLE_MSGBOX, ""C7"EIGHTBORN - "C8"Airsoft", string, "Kapat", "");
        }
    }
    Airsoft[roomID][Weapon] = 0;
    Airsoft[roomID][Started] = false;
}

AirsoftMessage(roomID, message[]) {
    foreach(new i : Player) {
        if(GetPVarInt(i, "InAirsoft") && GetPVarInt(i, "AirsoftRoom") == roomID) {
            SendClientMessageEx(i, -1, ""C1""CIZGI" {5e64c1}[Airsoft] "C1"%s", message);
        }
    }
}

hook OnPlayerSpawn(playerid) {
    if(GetPVarInt(playerid, "InAirsoft")) {
        new roomID = GetPVarInt(playerid, "AirsoftRoom");
        TogglePlayerControllable(playerid, false);
        SetPVarInt(playerid, "AirsoftInFreeze", 1);
        if(Airsoft[roomID][Gamemode] == MODE_TDM) {
            new j = randomEx((Airsoft[roomID][Map]-1)*(GetPVarInt(playerid, "AirsoftTeam")-1), (Airsoft[roomID][Map]-1)*(GetPVarInt(playerid, "AirsoftTeam")-1)+9);
            SetPlayerPos(playerid, AirsoftMapPositions[j][PosX], AirsoftMapPositions[j][PosY], AirsoftMapPositions[j][PosZ]);
            SetPlayerSkin(playerid, AirsoftSkins[GetPVarInt(playerid, "AirsoftTeam")-1][Skin]);
        }
        else {
            new j = randomEx(20+(Airsoft[roomID][Map]-1)*40, 20+(Airsoft[roomID][Map]-1)*40+19);
            SetPlayerPos(playerid, AirsoftMapPositions[j][PosX], AirsoftMapPositions[j][PosY], AirsoftMapPositions[j][PosZ]);
            SetPlayerSkin(playerid, AirsoftSkins[2][Skin]);
        }
        SetPlayerVirtualWorld(playerid, Airsoft[roomID][Leader]);
        SetPlayerInterior(playerid, 100);
        defer AirsoftUnfreezeTimer(playerid);
        SetPlayerArmour(playerid, 0);
        SetPlayerHealth(playerid, 100);
        ResetPlayerWeapons(playerid);
        GivePlayerWeapon(playerid, Airsoft[roomID][Weapon], 9999);
    }
    return 1;
}

timer AirsoftUnfreezeTimer[2500](playerid)
{
    TogglePlayerControllable(playerid, true);
    SetPVarInt(playerid, "AirsoftInFreeze", 0);
}

hook OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart) {
    if(GetPVarInt(playerid, "InAirsoft")) {
        PlayerPlaySound(playerid,1057,0,0,0);
        if(bodypart == 9)
            AirsoftStats[playerid][Headshots] += 1;
    }
    return 1;
}

hook OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart) {
    if(GetPVarInt(playerid, "InAirsoft")) {
        new roomID = GetPVarInt(playerid, "AirsoftRoom");
        if(!Airsoft[roomID][Started])
            return Y_HOOKS_BREAK_RETURN_0;
        if(Airsoft[roomID][Started] && GetPVarInt(playerid, "AirsoftTeam") == GetPVarInt(issuerid, "AirsoftTeam")) {
            new Float:playerHealth;
            GetPlayerHealth(playerid, playerHealth);
            SetPlayerHealth(playerid, playerHealth);
            return 1;
        }
        if(GetPVarInt(playerid, "AirsoftInFreeze") == 1) {
            new Float:playerHealth;
            GetPlayerHealth(playerid, playerHealth);
            SetPlayerHealth(playerid, playerHealth);
            return 1;
        }
    }
    return 1;
}

hook OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ) {
    if(GetPVarInt(playerid, "InAirsoft")) {
        if(Airsoft[GetPVarInt(playerid, "AirsoftRoom")][Started]) {
            AirsoftStats[playerid][Shots] += 1;
        }
    }
    return 1;
}

hook OnPlayerDeath(playerid, killerid, reason) {
    if(GetPVarInt(playerid, "InAirsoft") && GetPVarInt(killerid, "InAirsoft")) {
        if(Airsoft[GetPVarInt(playerid, "AirsoftRoom")][Started]) {
            AirsoftStats[playerid][Death] += 1;
            AirsoftStats[killerid][Kill] += 1;
        }
    }
    return 1;
}

LoadMaps() {
    Map_CsDeagle();
    Map_FySnow();
    Map_Simpson();
}

Map_FySnow() {
    new tmpobjid;
	tmpobjid = CreateDynamicObject(19530,-2302.078,-1542.945,  1286.821,0.000,0.000,0.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3609094);
	tmpobjid = CreateDynamicObject(19378,-2268.835,-1512.106,  1287.413,0.000,0.000,  180.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2268.835,-1521.726,  1287.413,0.000,0.000,  180.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2268.835,-1531.336,  1287.413,0.000,0.000,  180.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2268.835,-1540.965,  1287.413,0.000,0.000,  180.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2268.835,-1550.576,  1287.413,0.000,0.000,  180.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2268.835,-1560.185,  1287.413,0.000,0.000,  180.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2335.964,-1569.732,  1287.413,0.000,0.000,0.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2335.964,-1560.133,  1287.413,0.000,0.000,0.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2335.964,-1550.504,  1287.413,0.000,0.000,0.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2335.964,-1540.874,  1287.413,0.000,0.000,0.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2335.964,-1531.305,  1287.413,0.000,0.000,0.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2335.964,-1521.685,  1287.413,0.000,0.000,0.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2335.964,-1512.066,  1287.413,0.000,0.000,0.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2331.196,-1507.336,  1287.413,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2321.587,-1507.336,  1287.413,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2311.978,-1507.336,  1287.413,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2302.368,-1507.336,  1287.413,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2292.759,-1507.336,  1287.413,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2283.169,-1507.336,  1287.413,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2273.568,-1507.336,  1287.413,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2268.835,-1569.795,  1287.413,0.000,0.000,  180.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2273.554,-1574.645,  1287.413,0.000,0.000,270.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2283.165,-1574.645,  1287.413,0.000,0.000,270.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2292.764,-1574.645,  1287.413,0.000,0.000,270.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2302.383,-1574.645,  1287.413,0.000,0.000,270.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2311.962,-1574.645,  1287.413,0.000,0.000,270.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2321.551,-1574.645,  1287.413,0.000,0.000,270.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2331.141,-1574.645,  1287.413,0.000,0.000,270.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19866,-2326.596,-1507.332,  1291.921,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2321.596,-1507.332,  1291.921,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2316.596,-1507.332,  1291.921,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2311.596,-1507.332,  1291.921,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2306.596,-1507.332,  1291.921,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2301.617,-1507.332,  1291.921,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2296.618,-1507.332,  1291.921,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2291.618,-1507.332,  1291.921,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2286.638,-1507.332,  1291.921,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2281.649,-1507.332,  1291.921,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2276.640,-1507.332,  1291.921,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2326.596,-1574.652,  1291.921,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19378,-2320.225,-1552.075,  1287.413,0.000,0.000,0.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2284.491,-1552.155,  1287.413,0.000,0.000,0.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2298.925,-1552.134,  1287.413,0.000,0.000,0.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2305.817,-1552.075,  1287.413,0.000,0.000,0.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19456,-2319.020,-1558.061,  1287.850,90.000,0.000,225.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2313.016,-1559.275,  1287.413,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19456,-2307.022,-1558.055,  1287.850,90.000,0.000,315.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19456,-2307.034,-1546.103,  1287.850,90.000,0.000,405.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2313.015,-1544.907,  1287.413,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19456,-2319.008,-1546.110,  1287.850,90.000,0.000,315.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2291.697,-1559.335,  1287.413,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19456,-2285.704,-1558.140,  1287.850,90.000,0.000,315.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19456,-2297.699,-1558.125,  1287.850,90.000,0.000,405.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19456,-2297.714,-1546.131,  1287.850,90.000,0.000,315.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19456,-2285.697,-1546.140,  1287.850,90.000,0.000,405.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2291.706,-1544.926,  1287.413,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2291.746,-1538.035,  1287.413,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19456,-2297.741,-1536.823,  1287.850,90.000,0.000,405.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19456,-2285.779,-1536.813,  1287.850,90.000,0.000,495.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2284.582,-1530.795,  1287.413,0.000,0.000,360.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19456,-2285.802,-1524.786,  1287.850,90.000,0.000,405.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2291.786,-1523.578,  1287.413,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2298.973,-1530.815,  1287.413,0.000,0.000,360.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19456,-2297.759,-1524.778,  1287.850,90.000,0.000,495.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19456,-2307.030,-1536.817,  1287.850,90.000,0.000,315.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2313.015,-1537.997,  1287.413,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2305.817,-1530.845,  1287.413,0.000,0.000,0.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19456,-2319.011,-1536.790,  1287.850,90.000,0.000,405.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2320.197,-1530.845,  1287.413,0.000,0.000,0.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19456,-2307.040,-1524.818,  1287.850,90.000,0.000,405.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19456,-2319.007,-1524.840,  1287.850,90.000,0.000,315.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2313.015,-1523.597,  1287.413,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2313.032,-1557.592,  1292.581,0.000,90.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2313.016,-1551.535,  1292.584,0.000,90.000,  180.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2313.032,-1536.290,  1292.581,0.000,90.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2313.012,-1546.571,  1292.581,0.000,90.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2318.553,-1552.083,  1292.581,0.000,90.000,  180.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2307.512,-1552.072,  1292.581,0.000,90.000,  180.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2315.666,-1549.466,  1292.581,0.000,90.000,225.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2310.410,-1554.720,  1292.581,0.000,90.000,225.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2315.671,-1554.707,  1292.581,0.000,90.000,315.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2310.410,-1549.446,  1292.581,0.000,90.000,315.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2313.016,-1530.234,  1292.584,0.000,89.999,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2313.012,-1525.270,  1292.581,0.000,90.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2318.523,-1530.781,  1292.581,0.000,89.999,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2307.512,-1530.771,  1292.581,0.000,89.999,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2315.651,-1528.179,  1292.581,-0.000,89.999,-135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2310.410,-1533.419,  1292.581,-0.000,89.999,-135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2315.650,-1533.427,  1292.581,-0.000,90.000,-44.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2310.410,-1528.145,  1292.581,-0.000,90.000,-44.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2291.778,-1536.290,  1292.581,0.000,90.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2291.761,-1530.234,  1292.584,0.000,89.999,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2291.758,-1525.270,  1292.581,0.000,90.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2297.299,-1530.781,  1292.581,0.000,89.999,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2286.258,-1530.771,  1292.581,0.000,89.999,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2294.411,-1528.165,  1292.581,-0.000,89.999,-135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2289.155,-1533.419,  1292.581,-0.000,89.999,-135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2294.417,-1533.406,  1292.581,-0.000,90.000,-44.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2289.156,-1528.145,  1292.581,-0.000,90.000,-44.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2291.708,-1557.651,  1292.581,0.000,90.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2291.691,-1551.594,  1292.584,0.000,89.999,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2291.687,-1546.630,  1292.581,0.000,90.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2297.229,-1552.142,  1292.581,0.000,89.999,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2286.187,-1552.132,  1292.581,0.000,89.999,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2294.341,-1549.526,  1292.581,-0.000,89.999,-135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2289.085,-1554.780,  1292.581,-0.000,89.999,-135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2294.347,-1554.767,  1292.581,-0.000,90.000,-44.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19447,-2289.085,-1549.505,  1292.581,-0.000,90.000,-44.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3149830);
	tmpobjid = CreateDynamicObject(19378,-2272.182,-1510.700,  1287.413,0.000,0.000,225.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19866,-2321.596,-1574.652,  1291.921,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19378,-2272.217,-1571.228,  1287.413,0.000,0.000,315.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19866,-2316.596,-1574.652,  1291.921,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19378,-2332.555,-1510.775,  1287.413,0.000,0.000,  135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19866,-2311.596,-1574.652,  1291.921,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19378,-2332.603,-1571.253,  1287.413,0.000,0.000,405.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3149830);
	tmpobjid = CreateDynamicObject(19866,-2306.596,-1574.652,  1291.921,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(4724,-2320.875,-1531.852,  1288.742,0.000,0.000,0.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3477252);
	tmpobjid = CreateDynamicObject(4724,-2284.185,-1531.672,  1288.742,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3477252);
	tmpobjid = CreateDynamicObject(4724,-2283.873,-1551.053,  1288.742,0.000,0.000,  180.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3477252);
	tmpobjid = CreateDynamicObject(4724,-2320.662,-1551.223,  1288.742,0.000,0.000,270.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2301.617,-1574.652,  1291.921,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2296.618,-1574.652,  1291.921,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2291.618,-1574.652,  1291.921,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2286.638,-1574.652,  1291.921,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2281.649,-1574.652,  1291.921,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2276.640,-1574.652,  1291.921,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2268.836,-1566.438,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2268.836,-1561.438,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2268.836,-1556.438,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2268.836,-1551.438,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2268.836,-1546.438,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2268.836,-1541.459,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2268.836,-1536.460,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2268.836,-1531.460,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2268.836,-1526.480,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2268.836,-1521.491,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2268.836,-1516.482,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2335.969,-1566.438,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2335.969,-1561.438,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2335.969,-1556.438,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2335.969,-1551.438,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2335.969,-1546.438,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2335.969,-1541.459,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2335.969,-1536.460,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2335.969,-1531.460,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2335.969,-1526.480,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2335.969,-1521.491,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2335.969,-1516.482,  1291.921,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2334.302,-1569.549,  1291.921,0.000,-0.000,224.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2330.899,-1572.951,  1291.921,0.000,-0.000,224.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2273.832,-1572.848,  1291.921,0.000,0.000,  134.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2270.309,-1569.326,  1291.921,0.000,0.000,  134.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2270.603,-1512.281,  1291.921,0.000,-0.000,224.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2273.856,-1509.028,  1291.921,0.000,-0.000,224.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2330.863,-1509.078,  1291.921,0.000,0.000,  135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2334.320,-1512.536,  1291.921,0.000,0.000,  135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(9305,-2272.234,-1571.395,  1292.681,0.000,0.000,270.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3477252);
	tmpobjid = CreateDynamicObject(9305,-2272.174,-1510.665,  1292.671,0.000,0.000,360.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3477252);
	tmpobjid = CreateDynamicObject(9305,-2332.636,-1510.665,  1292.671,0.000,0.000,450.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3477252);
	tmpobjid = CreateDynamicObject(9305,-2332.636,-1571.306,  1292.691,0.000,0.000,540.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3477252);
	tmpobjid = CreateDynamicObject(19411,-2303.103,-1510.981,  1290.262,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3477252);
	tmpobjid = CreateDynamicObject(19463,-2296.699,-1510.985,  1288.528,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3477252);
	tmpobjid = CreateDynamicObject(19463,-2287.159,-1510.985,  1288.528,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3477252);
	tmpobjid = CreateDynamicObject(19463,-2309.490,-1510.985,  1288.528,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3477252);
	tmpobjid = CreateDynamicObject(19463,-2319.100,-1510.985,  1288.528,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3477252);
	tmpobjid = CreateDynamicObject(19367,-2303.110,-1510.979,  1287.200,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -2952966);
	tmpobjid = CreateDynamicObject(19463,-2303.175,-1509.155,  1288.388,0.000,90.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3477252);
	tmpobjid = CreateDynamicObject(19463,-2293.586,-1509.155,  1288.388,0.000,90.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3477252);
	tmpobjid = CreateDynamicObject(19463,-2312.757,-1509.155,  1288.388,0.000,90.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3477252);
	tmpobjid = CreateDynamicObject(14416,-2320.643,-1509.097,  1285.277,0.000,0.000,270.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -2952966);
	SetDynamicObjectMaterial(tmpobjid, 1, 3922, "bistro", "mp_snow", -2952966);
	tmpobjid = CreateDynamicObject(14416,-2285.672,-1509.027,  1285.277,0.000,0.000,450.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -2952966);
	SetDynamicObjectMaterial(tmpobjid, 1, 3922, "bistro", "mp_snow", -2952966);
	tmpobjid = CreateDynamicObject(19411,-2303.212,-1571.112,  1290.262,0.000,0.000,-89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3477252);
	tmpobjid = CreateDynamicObject(19463,-2309.616,-1571.108,  1288.528,0.000,0.000,-89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3477252);
	tmpobjid = CreateDynamicObject(19463,-2319.156,-1571.108,  1288.528,0.000,0.000,-89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3477252);
	tmpobjid = CreateDynamicObject(19463,-2296.824,-1571.108,  1288.528,0.000,0.000,-89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3477252);
	tmpobjid = CreateDynamicObject(19463,-2287.215,-1571.108,  1288.528,0.000,0.000,-89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -3477252);
	tmpobjid = CreateDynamicObject(19367,-2303.225,-1571.114,  1287.210,0.000,0.000,-89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -2952966);
	tmpobjid = CreateDynamicObject(19463,-2303.140,-1572.938,  1288.388,0.000,90.000,-89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3477252);
	tmpobjid = CreateDynamicObject(19463,-2312.729,-1572.938,  1288.388,0.000,90.000,-89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3477252);
	tmpobjid = CreateDynamicObject(19463,-2293.558,-1572.938,  1288.388,0.000,90.000,-89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -3477252);
	tmpobjid = CreateDynamicObject(14416,-2285.672,-1572.996,  1285.277,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -2952966);
	SetDynamicObjectMaterial(tmpobjid, 1, 3922, "bistro", "mp_snow", -2952966);
	tmpobjid = CreateDynamicObject(14416,-2320.643,-1573.066,  1285.277,0.000,0.000,-89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -2952966);
	SetDynamicObjectMaterial(tmpobjid, 1, 3922, "bistro", "mp_snow", -2952966);
	tmpobjid = CreateDynamicObject(19447,-2331.478,-1541.480,  1287.711,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -2952966);
	tmpobjid = CreateDynamicObject(19447,-2331.468,-1541.320,  1287.711,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -2952966);
	tmpobjid = CreateDynamicObject(19447,-2333.316,-1541.410,  1288.885,23.599,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -2952966);
	tmpobjid = CreateDynamicObject(1660,-2344.698,-1541.188,  1284.590,0.000,90.000,270.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 2, 3922, "bistro", "mp_snow", -2952966);
	SetDynamicObjectMaterial(tmpobjid, 3, 4004, "civic07_lan", "badmarb1_LAn", -2952966);
	tmpobjid = CreateDynamicObject(1660,-2344.657,-1541.640,  1284.910,0.000,270.000,630.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 2, 3922, "bistro", "mp_snow", -2952966);
	SetDynamicObjectMaterial(tmpobjid, 3, 4004, "civic07_lan", "badmarb1_LAn", -2952966);
	tmpobjid = CreateDynamicObject(19447,-2273.375,-1541.349,  1287.711,0.000,0.000,-89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -2952966);
	tmpobjid = CreateDynamicObject(19447,-2273.385,-1541.509,  1287.711,0.000,0.000,-89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -2952966);
	tmpobjid = CreateDynamicObject(19447,-2271.537,-1541.419,  1288.885,23.599,0.000,-89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4004, "civic07_lan", "badmarb1_LAn", -2952966);
	tmpobjid = CreateDynamicObject(1660,-2260.155,-1541.640,  1284.590,0.000,90.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 2, 3922, "bistro", "mp_snow", -2952966);
	SetDynamicObjectMaterial(tmpobjid, 3, 4004, "civic07_lan", "badmarb1_LAn", -2952966);
	tmpobjid = CreateDynamicObject(1660,-2260.196,-1541.188,  1284.860,0.000,270.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 2, 3922, "bistro", "mp_snow", -2952966);
	SetDynamicObjectMaterial(tmpobjid, 3, 4004, "civic07_lan", "badmarb1_LAn", -2952966);
	tmpobjid = CreateDynamicObject(3565,-2282.397,-1527.933,  1284.921,0.000,90.000,0.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 12821, "alleystuff", "Crate_B", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3922, "bistro", "mp_snow", -2952966);
	tmpobjid = CreateDynamicObject(3565,-2282.767,-1555.034,  1284.921,0.000,90.000,0.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 12821, "alleystuff", "Crate_B", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3922, "bistro", "mp_snow", -2952966);
	tmpobjid = CreateDynamicObject(3565,-2321.768,-1555.034,  1284.921,0.000,90.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 12821, "alleystuff", "Crate_B", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3922, "bistro", "mp_snow", -2952966);
	tmpobjid = CreateDynamicObject(3565,-2321.768,-1527.764,  1284.921,0.000,90.000,  180.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 12821, "alleystuff", "Crate_B", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3922, "bistro", "mp_snow", -2952966);
	tmpobjid = CreateDynamicObject(19866,-2315.337,-1559.272,  1291.901,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2310.727,-1559.272,  1291.901,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2294.017,-1559.332,  1291.901,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2289.406,-1559.332,  1291.901,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2315.397,-1523.602,  1291.901,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2310.787,-1523.602,  1291.901,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2294.077,-1523.572,  1291.901,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2289.467,-1523.572,  1291.901,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2284.490,-1554.378,  1291.901,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2284.490,-1549.769,  1291.901,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2284.580,-1533.059,  1291.901,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2284.580,-1528.448,  1291.901,0.000,-0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2315.397,-1538.003,  1291.901,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2310.697,-1538.003,  1291.901,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2310.697,-1544.913,  1291.901,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2315.307,-1544.913,  1291.901,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2294.016,-1544.913,  1291.901,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2289.425,-1544.913,  1291.901,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2289.425,-1538.033,  1291.901,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2294.025,-1538.033,  1291.901,0.000,0.000,89.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2320.194,-1528.533,  1291.901,0.000,0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2320.194,-1533.103,  1291.901,0.000,0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2320.224,-1549.763,  1291.901,0.000,0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2320.224,-1554.384,  1291.901,0.000,0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2305.814,-1554.384,  1291.901,0.000,0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2305.814,-1549.764,  1291.901,0.000,0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2305.814,-1533.124,  1291.901,0.000,0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2305.814,-1528.504,  1291.901,0.000,0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2298.964,-1528.504,  1291.901,0.000,0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2298.964,-1533.114,  1291.901,0.000,0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2298.924,-1549.834,  1291.901,0.000,0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(19866,-2298.924,-1554.425,  1291.901,0.000,0.000,  179.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", -3477252);
	tmpobjid = CreateDynamicObject(2267,-2298.553,-1557.443,  1292.261,0.000,0.000,315.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2297.733,-1558.263,  1292.261,0.000,0.000,315.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2297.054,-1558.942,  1292.261,0.000,0.000,315.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2319.872,-1557.403,  1292.261,-0.000,0.000,-44.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2319.053,-1558.223,  1292.261,-0.000,0.000,-44.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2318.373,-1558.902,  1292.261,-0.000,0.000,-44.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2318.343,-1545.252,  1292.261,-0.000,0.000,-135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2319.163,-1546.072,  1292.261,-0.000,0.000,-135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2319.842,-1546.751,  1292.261,-0.000,0.000,-135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2318.343,-1523.992,  1292.261,-0.000,0.000,-135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2319.163,-1524.811,  1292.261,-0.000,0.000,-135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2319.842,-1525.491,  1292.261,-0.000,0.000,-135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2297.084,-1523.952,  1292.261,-0.000,-0.000,-135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2297.904,-1524.771,  1292.261,-0.000,-0.000,-135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2298.583,-1525.451,  1292.261,-0.000,-0.000,-135.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2297.034,-1545.300,  1292.261,-0.000,-0.000,-134.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2297.854,-1546.120,  1292.261,-0.000,-0.000,-134.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2298.533,-1546.799,  1292.261,-0.000,-0.000,-134.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2298.593,-1536.131,  1292.261,-0.000,-0.000,-44.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2297.774,-1536.951,  1292.261,-0.000,-0.000,-44.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2297.094,-1537.630,  1292.261,-0.000,-0.000,-44.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2319.852,-1536.131,  1292.261,-0.000,-0.000,-44.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2319.033,-1536.951,  1292.261,-0.000,-0.000,-44.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2318.353,-1537.630,  1292.261,-0.000,-0.000,-44.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2307.730,-1537.680,  1292.261,-0.000,0.000,45.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2306.910,-1536.861,  1292.261,-0.000,0.000,45.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2306.231,-1536.181,  1292.261,-0.000,0.000,45.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2307.730,-1558.930,  1292.261,-0.000,0.000,45.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2306.910,-1558.111,  1292.261,-0.000,0.000,45.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2306.231,-1557.431,  1292.261,-0.000,0.000,45.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2286.380,-1558.970,  1292.261,-0.000,0.000,45.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2285.560,-1558.151,  1292.261,-0.000,0.000,45.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2284.881,-1557.471,  1292.261,-0.000,0.000,45.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2286.480,-1537.671,  1292.261,-0.000,0.000,45.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2285.660,-1536.851,  1292.261,-0.000,0.000,45.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2284.981,-1536.172,  1292.261,-0.000,0.000,45.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2284.901,-1546.760,  1292.261,-0.000,0.000,  134.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2285.720,-1545.940,  1292.261,-0.000,0.000,  134.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2286.400,-1545.261,  1292.261,-0.000,0.000,  134.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2284.951,-1525.469,  1292.261,-0.000,0.000,  134.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2285.770,-1524.649,  1292.261,-0.000,0.000,  134.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2286.450,-1523.970,  1292.261,-0.000,0.000,  134.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2306.160,-1525.529,  1292.261,-0.000,0.000,  134.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2306.979,-1524.709,  1292.261,-0.000,0.000,  134.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2307.659,-1524.030,  1292.261,-0.000,0.000,  134.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2306.160,-1546.798,  1292.261,-0.000,-0.000,  134.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2306.979,-1545.978,  1292.261,-0.000,-0.000,  134.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(2267,-2307.659,-1545.299,  1292.261,-0.000,-0.000,  134.999,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 3449, "vegashse2", "badhousewalld06_128", -2952966);
	tmpobjid = CreateDynamicObject(18317,-2461.446,-1609.219,  1308.861,0.000,0.000,  145.700,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 2, 3922, "bistro", "mp_snow", -2952966);
	tmpobjid = CreateDynamicObject(18307,-2357.652,-1489.495,  1299.189,0.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 4, 3922, "bistro", "mp_snow", -2952966);
	tmpobjid = CreateDynamicObject(11696,-2317.042,-1720.277,  1296.370,0.000,-33.100,270.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "mp_snow", -2952966);
	SetDynamicObjectMaterial(tmpobjid, 2, 3922, "bistro", "mp_snow", -2952966);
	SetDynamicObjectMaterial(tmpobjid, 3, 3922, "bistro", "mp_snow", -2952966);
	tmpobjid = CreateDynamicObject(18317,-2142.954,-1538.599,  1301.479,-18.399,0.000,-5.399,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 2, 3922, "bistro", "mp_snow", -2952966);
	tmpobjid = CreateDynamicObject(18317,-2171.637,-1491.974,  1283.269,-18.399,0.000,31.600,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 2, 3922, "bistro", "mp_snow", -2952966);
	tmpobjid = CreateDynamicObject(8171,-2335.927,-1554.664,  1283.292,90.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	tmpobjid = CreateDynamicObject(8171,-2335.927,-1517.244,  1283.292,90.000,0.000,90.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	tmpobjid = CreateDynamicObject(8171,-2316.217,-1507.393,  1283.292,90.000,0.000,720.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	tmpobjid = CreateDynamicObject(8171,-2279.057,-1507.393,  1283.292,90.000,0.000,720.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	tmpobjid = CreateDynamicObject(8171,-2268.848,-1526.074,  1283.292,90.000,0.000,990.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	tmpobjid = CreateDynamicObject(8171,-2268.848,-1563.884,  1283.292,90.000,0.000,990.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	tmpobjid = CreateDynamicObject(8171,-2288.298,-1574.654,  1283.292,90.000,0.000,  1260.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	tmpobjid = CreateDynamicObject(8171,-2326.987,-1574.654,  1283.292,90.000,0.000,  1260.000,  -1,100,-1,300.000,300.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
}

Map_Simpson() {
    new tmpobjid;
    tmpobjid = CreateDynamicObject(18981, 638.6561, 1719.2890, 484.5446, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx25mx25m
    SetDynamicObjectMaterial(tmpobjid, 0, 13295, "ce_terminal", "des_adobewall2", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18981, 625.6966, 1706.8703, 496.5546, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx25mx25m
    SetDynamicObjectMaterial(tmpobjid, 0, 11425, "des_clifftown", "des_adobewall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19604, 639.0688, 1720.6423, 492.2246, 0.0000, 0.0000, 90.0000, -1,100,-1,300.000,300.000); //WaterPlane2
    tmpobjid = CreateDynamicObject(18981, 613.7261, 1719.2890, 497.8649, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx25mx25m
    SetDynamicObjectMaterial(tmpobjid, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 622.6519, 1741.3360, 497.5083, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18981, 625.6966, 1735.7403, 496.5546, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx25mx25m
    SetDynamicObjectMaterial(tmpobjid, 0, 11425, "des_clifftown", "des_adobewall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19604, 619.0693, 1720.6423, 492.2246, 0.0000, 0.0000, 90.0000, -1,100,-1,300.000,300.000); //WaterPlane2
    tmpobjid = CreateDynamicObject(19604, 629.0695, 1720.6423, 492.2246, 0.0000, 0.0000, 90.0000, -1,100,-1,300.000,300.000); //WaterPlane2
    tmpobjid = CreateDynamicObject(18981, 625.6966, 1718.8691, 483.7146, 0.0000, 0.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx25mx25m
    SetDynamicObjectMaterial(tmpobjid, 0, 13295, "ce_terminal", "des_adobewall2", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18981, 613.7361, 1719.2890, 484.5446, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx25mx25m
    SetDynamicObjectMaterial(tmpobjid, 0, 13295, "ce_terminal", "des_adobewall2", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18981, 613.7261, 1744.2885, 497.8649, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx25mx25m
    SetDynamicObjectMaterial(tmpobjid, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18981, 613.7261, 1694.2987, 497.8649, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx25mx25m
    SetDynamicObjectMaterial(tmpobjid, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18981, 625.7164, 1693.8892, 497.8645, 0.0000, 0.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx25mx25m
    SetDynamicObjectMaterial(tmpobjid, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18981, 625.7164, 1748.6494, 497.8640, 0.0000, 0.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx25mx25m
    SetDynamicObjectMaterial(tmpobjid, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18981, 638.6760, 1735.9086, 497.8645, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx25mx25m
    SetDynamicObjectMaterial(tmpobjid, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18981, 638.6761, 1710.9288, 497.8649, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx25mx25m
    SetDynamicObjectMaterial(tmpobjid, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18981, 638.6761, 1685.9289, 497.8640, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx25mx25m
    SetDynamicObjectMaterial(tmpobjid, 0, 6867, "vgnpwrmainbld", "sw_wallbrick_02", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 614.6934, 1707.9929, 494.7000, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1426, "break_scaffold", "cheerybox03", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 637.9835, 1708.0731, 494.7000, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1426, "break_scaffold", "cheerybox03", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 614.6934, 1734.9831, 494.7000, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1426, "break_scaffold", "cheerybox03", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 637.9835, 1734.9831, 494.7000, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1426, "break_scaffold", "cheerybox03", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 630.2025, 1740.4063, 497.5083, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 632.2025, 1738.3575, 498.5082, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 625.2826, 1740.4067, 499.8481, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 630.1925, 1740.3863, 499.4881, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 630.2025, 1741.3360, 497.5083, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 622.6524, 1740.4063, 497.5083, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 622.6524, 1740.4063, 499.4983, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18766, 630.6221, 1736.4210, 500.0315, 90.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFF991E1E);
    tmpobjid = CreateDynamicObject(18766, 627.5520, 1736.4210, 500.0304, 90.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFF991E1E);
    tmpobjid = CreateDynamicObject(18766, 621.4520, 1736.4210, 500.0304, 90.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFF991E1E);
    tmpobjid = CreateDynamicObject(18766, 623.1419, 1735.9306, 500.0314, 90.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFF991E1E);
    tmpobjid = CreateDynamicObject(1437, 624.5335, 1741.7770, 495.5811, 0.0000, 0.0000, 180.0000, -1,100,-1,300.000,300.000); //DYN_LADDER_2
    tmpobjid = CreateDynamicObject(18762, 630.1825, 1740.3764, 498.5082, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 622.6524, 1740.4063, 498.5082, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 632.1925, 1733.3780, 499.8481, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 632.2025, 1728.9671, 498.5082, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 632.2025, 1726.6367, 499.8481, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 628.1928, 1724.6367, 497.5083, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18981, 625.6966, 1723.7095, 483.7146, 0.0000, 0.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx25mx25m
    SetDynamicObjectMaterial(tmpobjid, 0, 13295, "ce_terminal", "des_adobewall2", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 630.1926, 1731.8662, 501.2081, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 620.6526, 1733.3773, 499.8481, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 620.6728, 1728.9671, 499.4682, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 623.5031, 1724.6463, 499.8481, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 632.2028, 1737.4365, 497.5083, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 632.2025, 1738.3565, 499.4980, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 632.2030, 1728.9676, 499.5082, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 632.2028, 1727.5975, 497.5083, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18766, 630.6223, 1728.9199, 500.0310, 90.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFF991E1E);
    tmpobjid = CreateDynamicObject(18766, 621.4520, 1728.9113, 500.0325, 90.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFF991E1E);
    tmpobjid = CreateDynamicObject(18766, 625.9226, 1728.9113, 500.0320, 90.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFF991E1E);
    tmpobjid = CreateDynamicObject(18762, 625.2826, 1724.6469, 499.8481, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 624.6326, 1724.6367, 497.5083, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 630.2026, 1724.6367, 497.5083, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 632.2028, 1732.4670, 497.5083, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 620.6525, 1737.4365, 497.5083, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 620.6524, 1738.3571, 498.5082, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 620.6524, 1738.3571, 499.4981, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 620.6525, 1727.5178, 497.5083, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 620.6925, 1726.6367, 499.8481, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 620.6525, 1732.4670, 497.5083, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 620.6728, 1728.9671, 498.5082, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 629.2827, 1724.6463, 499.8481, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 622.6425, 1724.6367, 497.5083, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(1347, 631.4304, 1731.6833, 500.9993, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //CJ_WASTEBIN
    tmpobjid = CreateDynamicObject(18762, 622.1225, 1731.8757, 501.2081, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 628.2028, 1728.8769, 501.2090, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 624.1326, 1728.8759, 501.2098, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 625.0923, 1728.8763, 503.2699, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 622.1127, 1728.8763, 502.0698, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 630.2030, 1728.8764, 502.0698, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 627.2022, 1728.8774, 503.2697, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 630.2030, 1731.8657, 504.0697, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 630.2030, 1731.8659, 503.0798, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 630.2030, 1731.8660, 502.2098, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 622.1225, 1731.8757, 502.1981, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 622.1225, 1731.8757, 503.1781, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 622.1225, 1731.8757, 504.1281, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 629.2231, 1733.8666, 502.0698, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 628.2333, 1733.8666, 502.0698, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 623.1032, 1733.8666, 502.0698, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 624.0833, 1733.8666, 502.0698, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 626.1423, 1733.8764, 504.0697, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18766, 626.1221, 1731.8807, 504.1414, 90.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFF991E1E);
    tmpobjid = CreateDynamicObject(18766, 626.1226, 1730.8208, 504.1424, 90.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFF991E1E);
    tmpobjid = CreateDynamicObject(1428, 623.1900, 1734.7751, 502.9566, 0.0000, 0.0000, 180.0000, -1,100,-1,300.000,300.000); //DYN_LADDER
    tmpobjid = CreateDynamicObject(18762, 625.0633, 1733.8666, 502.0698, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 623.6583, 1736.9361, 496.9349, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 629.2084, 1736.9361, 496.9349, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 625.6384, 1736.9361, 496.9339, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 625.6384, 1731.0163, 496.9349, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 623.6583, 1731.0067, 496.9354, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 629.2883, 1731.0067, 496.9354, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 629.2084, 1727.1162, 496.9339, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 623.6285, 1727.1162, 496.9349, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 626.5686, 1727.1077, 496.9335, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19430, 626.4361, 1720.0957, 496.9679, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //wall070
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19430, 626.4353, 1722.3875, 496.9690, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //wall070
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19789, 624.7652, 1729.0773, 504.5921, 0.0000, 0.0000, 151.4999, -1,100,-1,300.000,300.000); //Cube1mx1m
    SetDynamicObjectMaterial(tmpobjid, 0, 1736, "cj_ammo", "CJ_SLATEDWOOD2", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19789, 625.9905, 1729.1839, 504.5928, 0.0000, 0.0000, 133.7999, -1,100,-1,300.000,300.000); //Cube1mx1m
    SetDynamicObjectMaterial(tmpobjid, 0, 1736, "cj_ammo", "CJ_SLATEDWOOD2", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19789, 625.3105, 1729.1040, 505.5429, 0.0000, 0.0000, -167.5000, -1,100,-1,300.000,300.000); //Cube1mx1m
    SetDynamicObjectMaterial(tmpobjid, 0, 1736, "cj_ammo", "CJ_SLATEDWOOD2", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19789, 623.1386, 1734.8714, 500.5129, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube1mx1m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19789, 624.0786, 1734.8714, 500.5129, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube1mx1m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18981, 625.6966, 1718.8691, 491.6947, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx25mx25m
    SetDynamicObjectMaterial(tmpobjid, 0, 13295, "ce_terminal", "des_adobewall2", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 624.1334, 1728.8764, 500.8898, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 628.0739, 1728.8771, 500.8898, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 622.1235, 1731.7966, 500.8898, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 630.1935, 1731.7966, 500.8898, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 630.2033, 1733.8666, 502.0698, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 629.2827, 1717.9256, 499.8481, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 628.1928, 1717.9262, 497.5083, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 625.2826, 1717.9256, 499.8481, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 622.6425, 1717.9256, 497.5083, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 630.2026, 1717.9256, 497.5083, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 623.5026, 1717.9256, 499.8481, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 624.6426, 1717.9262, 497.5083, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 620.6525, 1715.8984, 497.5075, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 620.6525, 1715.9284, 499.8481, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 632.2021, 1715.9284, 499.8481, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 632.2028, 1715.9176, 497.5075, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 632.2028, 1704.6274, 497.5075, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 632.2028, 1709.6076, 497.5075, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 632.2022, 1712.4571, 497.5069, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 632.2022, 1712.4571, 498.5069, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 632.2022, 1712.4571, 499.4969, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 632.2021, 1710.9393, 499.8481, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 632.2021, 1705.9699, 499.8481, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 632.2021, 1704.6303, 499.8476, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 632.2022, 1703.7066, 498.5069, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 632.2022, 1703.7155, 499.4769, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 630.2025, 1701.7055, 498.5082, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 630.2025, 1701.7055, 497.5082, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 630.2025, 1701.7055, 499.4982, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 630.2020, 1701.7060, 499.8370, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 622.6524, 1701.7054, 497.5183, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 622.6524, 1701.7054, 498.5082, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 622.6524, 1701.7054, 499.5083, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 622.6618, 1701.7060, 499.8370, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 625.2826, 1701.7049, 499.8370, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 620.6523, 1712.4571, 497.5069, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 620.6523, 1712.4571, 498.4970, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 620.6523, 1712.4571, 499.4970, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 620.6527, 1712.4576, 499.8370, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 620.6529, 1709.6076, 497.5075, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 620.6526, 1704.6274, 497.5075, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 620.6524, 1703.7066, 498.5069, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 620.6524, 1703.7066, 499.5069, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 620.6524, 1703.7066, 499.8370, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 620.6524, 1708.5166, 499.8370, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(19464, 629.2084, 1715.4467, 496.9339, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 629.2084, 1709.5169, 496.9339, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 629.2084, 1705.1567, 496.9345, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 623.5384, 1705.1567, 496.9345, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 623.5384, 1715.4573, 496.9345, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 623.5384, 1710.7172, 496.9338, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 624.7885, 1705.1470, 496.9330, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 624.7885, 1711.0866, 496.9330, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 624.7885, 1715.4665, 496.9335, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 622.6519, 1700.7363, 497.5083, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 630.2020, 1700.7363, 497.5083, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 630.2030, 1715.1157, 502.0698, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18766, 630.6223, 1713.6694, 500.0310, 90.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18766, 630.6223, 1706.1898, 500.0317, 90.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18766, 625.6226, 1705.4699, 500.0317, 90.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18766, 625.6224, 1713.6694, 500.0304, 90.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18766, 621.6820, 1705.4699, 500.0310, 90.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18766, 621.6925, 1713.6694, 500.0320, 90.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 622.1127, 1715.1157, 502.0698, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 624.1334, 1715.1157, 500.8898, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 628.0739, 1715.1157, 500.8898, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 624.1326, 1715.1157, 501.2098, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 628.2028, 1715.1157, 501.2090, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 627.2022, 1715.1157, 503.2697, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 625.0923, 1715.1157, 503.2699, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 622.1235, 1712.1359, 500.8898, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 622.1235, 1712.1359, 501.8598, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 622.1235, 1712.1359, 502.8497, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 622.1235, 1712.1359, 503.8197, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 630.2036, 1712.1359, 503.8197, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 630.2036, 1712.1359, 502.8197, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 630.2036, 1712.1359, 501.8297, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 630.2036, 1712.1359, 500.8597, 0.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(1347, 620.6205, 1712.5432, 500.9993, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //CJ_WASTEBIN
    tmpobjid = CreateDynamicObject(18762, 630.2033, 1709.1473, 502.0698, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 629.2235, 1709.1473, 502.0698, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 628.2235, 1709.1473, 502.0698, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 622.1234, 1709.1473, 502.0698, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 623.1233, 1709.1473, 502.0698, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 624.1134, 1709.1473, 502.0698, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(18762, 626.1423, 1709.1463, 504.0697, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(19464, 628.1282, 1731.3970, 500.4255, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 625.1487, 1731.3974, 500.4244, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 625.1487, 1711.6470, 500.4244, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19464, 627.3182, 1711.6464, 500.4238, 0.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //wall104
    SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "man_parquet", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18766, 626.1232, 1711.1116, 504.1429, 90.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18766, 626.1226, 1713.2714, 504.1424, 90.0000, 90.0000, 90.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(1437, 628.6336, 1700.1871, 495.5811, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //DYN_LADDER_2
    tmpobjid = CreateDynamicObject(18766, 631.6427, 1705.4997, 500.0321, 90.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19789, 629.1984, 1708.3314, 500.5129, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube1mx1m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(19789, 628.2285, 1708.3314, 500.5129, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube1mx1m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFF335F3F);
    tmpobjid = CreateDynamicObject(1428, 629.3101, 1708.4044, 503.0358, 8.2999, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //DYN_LADDER
    tmpobjid = CreateDynamicObject(19789, 626.5082, 1714.2307, 505.5429, 0.0000, 0.0000, -167.5000, -1,100,-1,300.000,300.000); //Cube1mx1m
    SetDynamicObjectMaterial(tmpobjid, 0, 1736, "cj_ammo", "CJ_SLATEDWOOD2", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19789, 627.0746, 1714.3560, 504.5929, 0.0000, 0.0000, 167.3000, -1,100,-1,300.000,300.000); //Cube1mx1m
    SetDynamicObjectMaterial(tmpobjid, 0, 1736, "cj_ammo", "CJ_SLATEDWOOD2", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19789, 625.9557, 1714.2142, 504.5929, 0.0000, 0.0000, 117.4000, -1,100,-1,300.000,300.000); //Cube1mx1m
    SetDynamicObjectMaterial(tmpobjid, 0, 1736, "cj_ammo", "CJ_SLATEDWOOD2", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18766, 631.6629, 1713.6689, 500.0304, 90.0000, 90.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete10mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 3355, "cxref_savhus", "des_brick1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(18762, 622.1231, 1733.8671, 502.0698, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Concrete1mx1mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 16136, "des_telescopestuff", "ws_palebrickwall1", 0xFFFFFFFF);
}

Map_CsDeagle() {
    new tmpobjid;
    tmpobjid = CreateDynamicObject(19538, 70.6275, 2477.4343, 18.3309, -89.9000, 0.0000, 89.9999, -1,100,-1,300.000,300.000); //Plane62_5x125Conc1
    SetDynamicObjectMaterial(tmpobjid, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19538, 8.2573, 2474.3498, 18.3288, -89.9000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Plane62_5x125Conc1
    SetDynamicObjectMaterial(tmpobjid, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19538, -50.9649, 2527.5170, 18.3264, -89.9000, 0.0000, -90.9999, -1,100,-1,300.000,300.000); //Plane62_5x125Conc1
    SetDynamicObjectMaterial(tmpobjid, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19538, 11.4673, 2536.8486, 18.3376, -89.9000, 0.0000, 180.0000, -1,100,-1,300.000,300.000); //Plane62_5x125Conc1
    SetDynamicObjectMaterial(tmpobjid, 0, 4552, "ammu_lan2", "sl_lavicdtwall1", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19538, 8.2573, 2505.5979, 15.6857, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Plane62_5x125Conc1
    SetDynamicObjectMaterial(tmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19538, 8.2573, 2568.0297, 49.3958, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Plane62_5x125Conc1
    SetDynamicObjectMaterial(tmpobjid, 0, 14387, "dr_gsnew", "mp_gs_kitchfloor", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19538, 8.2573, 2509.8715, 49.3558, -179.9998, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Plane62_5x125Conc1
    SetDynamicObjectMaterial(tmpobjid, 0, 14387, "dr_gsnew", "mp_gs_kitchfloor", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19538, 8.2573, 2447.4633, 49.3558, -179.9998, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Plane62_5x125Conc1
    SetDynamicObjectMaterial(tmpobjid, 0, 14387, "dr_gsnew", "mp_gs_kitchfloor", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 48.6304, 2504.1799, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 33.6304, 2504.1799, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 16.0403, 2504.1799, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 16.0403, 2494.1682, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 6.0503, 2486.6267, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 7.9703, 2501.6083, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 7.9703, 2511.5886, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -2.0594, 2524.0712, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -7.0995, 2536.1416, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -12.0993, 2526.1687, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -22.3994, 2518.5888, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -32.4095, 2508.6086, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -22.4095, 2500.6279, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -13.5693, 2500.6279, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -5.4394, 2495.6386, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -15.4495, 2476.8591, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -24.6294, 2485.4785, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -24.6294, 2493.2478, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -36.2597, 2481.7463, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -41.2498, 2491.7336, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(10009, 65.4979, 2499.9934, 19.7973, 0.0000, 0.0000, 179.0000, -1,100,-1,300.000,300.000); //fer_cars3_sfe
    tmpobjid = CreateDynamicObject(19790, -48.8198, 2505.1760, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -48.5396, 2520.1679, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -38.5396, 2530.1594, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -30.8097, 2534.3496, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 21.0403, 2514.4404, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 31.0303, 2524.4204, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 44.2904, 2524.4204, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 44.2904, 2534.3503, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 17.0904, 2534.3295, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 7.1304, 2524.3298, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 34.2904, 2514.4389, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 57.9603, 2509.4492, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 68.1502, 2523.1201, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 68.1502, 2491.4589, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 56.2803, 2486.4965, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 54.0204, 2478.9172, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 44.0601, 2478.9172, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 39.0703, 2493.2055, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 26.7402, 2493.2055, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, 26.7402, 2482.7353, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -2.0694, 2481.8857, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19790, -8.9393, 2509.2709, 15.6784, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //Cube5mx5m
    SetDynamicObjectMaterial(tmpobjid, 0, 1706, "kbcouch1", "kbwood_panel4_128", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19449, 58.2187, 2499.5637, 22.9176, 0.0000, -89.9000, -89.9999, -1,100,-1,300.000,300.000); //wall089
    SetDynamicObjectMaterial(tmpobjid, 0, 10806, "airfence_sfse", "ws_griddyfence", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19449, 48.5787, 2499.5637, 22.9176, 0.0000, -89.9000, -89.9999, -1,100,-1,300.000,300.000); //wall089
    SetDynamicObjectMaterial(tmpobjid, 0, 10806, "airfence_sfse", "ws_griddyfence", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19449, 38.9486, 2499.5637, 22.9176, 0.0000, -89.9000, -89.9999, -1,100,-1,300.000,300.000); //wall089
    SetDynamicObjectMaterial(tmpobjid, 0, 10806, "airfence_sfse", "ws_griddyfence", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19449, 29.3187, 2499.5637, 22.9176, 0.0000, -89.9000, -89.9999, -1,100,-1,300.000,300.000); //wall089
    SetDynamicObjectMaterial(tmpobjid, 0, 10806, "airfence_sfse", "ws_griddyfence", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19449, 19.7087, 2499.5637, 22.9176, 0.0000, -89.9000, -89.9999, -1,100,-1,300.000,300.000); //wall089
    SetDynamicObjectMaterial(tmpobjid, 0, 10806, "airfence_sfse", "ws_griddyfence", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19449, 10.0887, 2499.5637, 22.9176, 0.0000, -89.9000, -89.9999, -1,100,-1,300.000,300.000); //wall089
    SetDynamicObjectMaterial(tmpobjid, 0, 10806, "airfence_sfse", "ws_griddyfence", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19449, 0.4787, 2499.5637, 22.9176, 0.0000, -89.9000, -89.9999, -1,100,-1,300.000,300.000); //wall089
    SetDynamicObjectMaterial(tmpobjid, 0, 10806, "airfence_sfse", "ws_griddyfence", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19449, -9.1512, 2499.5637, 22.9176, 0.0000, -89.9000, -89.9999, -1,100,-1,300.000,300.000); //wall089
    SetDynamicObjectMaterial(tmpobjid, 0, 10806, "airfence_sfse", "ws_griddyfence", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19449, -18.7611, 2499.5637, 22.9176, 0.0000, -89.9000, -89.9999, -1,100,-1,300.000,300.000); //wall089
    SetDynamicObjectMaterial(tmpobjid, 0, 10806, "airfence_sfse", "ws_griddyfence", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19449, -28.3911, 2499.5637, 22.9176, 0.0000, -89.9000, -89.9999, -1,100,-1,300.000,300.000); //wall089
    SetDynamicObjectMaterial(tmpobjid, 0, 10806, "airfence_sfse", "ws_griddyfence", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(10009, -38.3420, 2500.0319, 19.8050, 0.0000, 0.0000, 0.0000, -1,100,-1,300.000,300.000); //fer_cars3_sfe
}