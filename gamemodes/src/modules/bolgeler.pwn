#include <YSI_Coding\y_hooks>

static PlayerText:Bolge_PTD[MAX_PLAYERS];
static Text:Bolge_TD[2];

enum ZonesEnum { Name[32], Float:MinX, Float:MinY, Float:MaxX, Float:MaxY, Color};
static ZonesPositions[20][ZonesEnum] = {
    { "Verona Mall", 1048.953125, -1564.4375, 1195.953125, -1416.4375, 0x85BD6FAA },
    { "LSMD/LSFD Çevre", 1127.0, -1417.4375, 1338.0, -1286.4375, 0x85BD6FAA },
    { "lsmd lfd çevre", 1217.0, -1286.4375, 1338.0, -1240.4375, 0x85BD6FAA },
    { "Market Caddesi", 649.0, -1390.5, 1049.0, -1326.5, 0x85BD6FAA },
    { "Grotti", 503.0, -1330.5, 624.0, -1263.5, 0x85BD6FAA },
    { "FBI", 1485.0, -1410.1501159667969, 1584.0, -1309.1501159667969, 0x85BD6FAA },
    { "LSPD ÇEVRE", 1429.9609375, -1728.0, 1587.9609375, -1582.5703125, 0x85BD6FAA },
    { "State Of Los Santos", 1392.03125, -1864.5703125, 1564.03125, -1727.5703125, 0x85BD6FAA },
    { "HAVAALANI", 1354.0, -2706.5, 2147.0, -2185.5, 0x85BD6FAA },
    { "Meslek Bölgesi", 2147.0, -2706.5, 2335.0, -2185.5, 0x85BD6FAA },
    { "LSPA", 2409.0, -2149.5, 2710.0, -2057.5, 0x85BD6FAA },
    { "K9 UNIT LSPD", 2493.9287109375, -1563.928726196289, 2539.9287109375, -1512.928726196289, 0x85BD6FAA },
    { "LSPD DENIZ", 128.1077880859375, -1976.2696533203125, 180.1077880859375, -1800.2696533203125, 0x85BD6FAA },
    { "Starfish", 345.11065673828125, -2094.2923583984375, 412.11065673828125, -1891.2923583984375, 0x85BD6FAA },
    { "BANK", 1443.8196411132812, -1027.132080078125, 1526.8196411132812, -982.132080078125, 0x85BD6FAA },
    { "WILD WINOS", 2014.0, -1742.5, 2075.0, -1681.5, 0x1700FFAA },
    { "Azadole", 1398.9375, -784.9453125, 1557.9375, -584.9453125, 0xFF9700AA },
    { "Altes", 583.2500610351562, -526.5592956542969, 716.2500610351562, -425.5592956542969, 0xDC0000AA },
    { "Grande", 1067.0, -1277.0, 1215.0, -1154.0, 0x8300FFAA },
    { "Raven Crew", 2100.0, -1035.0, 2220.0, -938.0, 0x00F0FFAA }
};

static Gangzones[sizeof(ZonesPositions)];
static Zones[sizeof(ZonesPositions)];

hook OnGameModeInit() {
    Bolge_TD[0] = TextDrawCreate(516.666870, 315.689056, "Bolge_:");
    TextDrawLetterSize(Bolge_TD[0], 0.400333, 1.608295);
    TextDrawAlignment(Bolge_TD[0], 1);
    TextDrawColor(Bolge_TD[0], -1);
    TextDrawSetShadow(Bolge_TD[0], 0);
    TextDrawBackgroundColor(Bolge_TD[0], 255);
    TextDrawFont(Bolge_TD[0], 0);
    TextDrawSetProportional(Bolge_TD[0], 1);

    Bolge_TD[1] = TextDrawCreate(514.666687, 312.370635, "box");
    TextDrawLetterSize(Bolge_TD[1], 0.000000, 2.733334);
    TextDrawTextSize(Bolge_TD[1], 630.500000, 0.000000);
    TextDrawAlignment(Bolge_TD[1], 1);
    TextDrawColor(Bolge_TD[1], -1);
    TextDrawUseBox(Bolge_TD[1], 1);
    TextDrawBoxColor(Bolge_TD[1], 200);
    TextDrawSetShadow(Bolge_TD[1], 0);
    TextDrawBackgroundColor(Bolge_TD[1], 255);
    TextDrawFont(Bolge_TD[1], 1);
    TextDrawSetProportional(Bolge_TD[1], 1);

    for(new i = 0; i < sizeof(Gangzones); i++)
    {
        Gangzones[i] = GangZoneCreate(ZonesPositions[i][MinX], ZonesPositions[i][MinY], ZonesPositions[i][MaxX], ZonesPositions[i][MaxY]);
        Zones[i] = CreateDynamicRectangle(ZonesPositions[i][MinX], ZonesPositions[i][MinY], ZonesPositions[i][MaxX], ZonesPositions[i][MaxY]);
    }
    return 1;
}

hook OnPlayerConnect(playerid) {
    Bolge_PTD[playerid] = CreatePlayerTextDraw(playerid, 554.800720, 317.863220, "Altes");
    PlayerTextDrawLetterSize(playerid, Bolge_PTD[playerid], 0.312999, 1.409185);
    PlayerTextDrawAlignment(playerid, Bolge_PTD[playerid], 1);
    PlayerTextDrawColor(playerid, Bolge_PTD[playerid], 2023127295);
    PlayerTextDrawSetShadow(playerid, Bolge_PTD[playerid], 0);
    PlayerTextDrawSetOutline(playerid, Bolge_PTD[playerid], 1);
    PlayerTextDrawBackgroundColor(playerid, Bolge_PTD[playerid], 255);
    PlayerTextDrawFont(playerid, Bolge_PTD[playerid], 1);
    PlayerTextDrawSetProportional(playerid, Bolge_PTD[playerid], 1);

    DeletePVar(playerid, "BolgeHudDurum");
    return 1;
}

hook OnPlayerSpawn(playerid) {
    for(new i = 0; i < sizeof(Gangzones); i++)
    {
        GangZoneShowForPlayer(playerid, Gangzones[i], ZonesPositions[i][Color]);
    }
    return 1;
}

hook OnPlayerEnterDA(playerid, areaid) {
    if(!GetPVarInt(playerid, "BolgeHudDurum")) {
        static aID;
        aID = -1;
        for(new i = 0; i < sizeof(Zones); i++) {
            if(areaid == Zones[i]) {
                aID = i;
                break;
            }
        }
        if(aID != -1) {
            PlayerTextDrawColor(playerid, Bolge_PTD[playerid], ZonesPositions[aID][Color]);
            if(ZonesPositions[aID][Color] == 0x85BD6FAA) PlayerTextDrawSetString(playerid, Bolge_PTD[playerid], "Guvenli Bolge");
            else PlayerTextDrawSetString(playerid, Bolge_PTD[playerid], ZonesPositions[aID][Name]);
            for(new i = 0; i < sizeof(Bolge_TD); i++) {
                TextDrawShowForPlayer(playerid, Bolge_TD[i]);
            }
            PlayerTextDrawShow(playerid, Bolge_PTD[playerid]);
        }
    }
}

hook OnPlayerLeaveDA(playerid, areaid) {
    static aID;
    aID = -1;
    for(new i = 0; i < sizeof(Zones); i++) {
        if(areaid == Zones[i]) {
            aID = i;
            break;
        }
    }
    if(aID != -1) {
        for(new i = 0; i < sizeof(Bolge_TD); i++) {
            TextDrawHideForPlayer(playerid, Bolge_TD[i]);
        }
        PlayerTextDrawHide(playerid, Bolge_PTD[playerid]);
    }
}

CMD:bolgehudkapat(playerid) {
    if(!IsPlayerLoggedIn(playerid)) return 1;
    if(GetPVarInt(playerid, "BolgeHudDurum")) {
        SetPVarInt(playerid, "BolgeHudDurum", 0);
        Mesaj(playerid, BILGI_MESAJ, "Artýk bölge hudunu görüyorsunuz.");
    } else {
        SetPVarInt(playerid, "BolgeHudDurum", 1);
        Mesaj(playerid, BILGI_MESAJ, "Artýk bölge hudunu görmüyorsunuz.");
    }
    return 1;
}