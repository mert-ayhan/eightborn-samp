#include <YSI_Coding\y_hooks>

enum GiseEnum {
    objeID,
    Float:objeX,
    Float:objeY,
    Float:objeZ,
    Float:objerX,
    Float:objerY,
    Float:objerZ,
    Float:objeorX,
    Float:objeorY,
    Float:objeorZ,
    obje,
    durum
};

new Gise[16][GiseEnum] = {
    {968, 1748.54895, 519.50812, 27.64986, 0.00000, 90.00000, -18.20000, 0.00000, 0.00000, -18.20000},
    {968, 1740.12134, 522.22717, 27.64986, 0.00000, 90.00000, -18.20000, 0.00000, 0.00000, -18.20000},
    {968, 1737.41199, 523.18591, 27.64990, 0.00000, 90.00000, 161.76006, 0.00000, 0.00000, 161.76006}, 
    {968, 1728.53882, 526.06335, 27.64990, 0.00000, 90.00000, 161.76006, 0.00000, 0.00000, 161.76006},
    {968, 606.89355, 337.17392, 18.88173, 0.00000, 90.00000, 35.34000, 0.00000, 0.00000, 35.34000},
    {968, 618.00531, 345.02548, 18.88173, 0.00000, 90.00000, 215.64017, 0.00000, 0.00000, 215.64017},
    {968, -204.93137, 253.61270, 11.88400, 0.00000, 90.00000, -15.12000, 0.00000, 0.00000, -15.12000},
    {968, -191.62480, 250.10329, 11.88400, 0.00000, 90.00000, 165.06007, 0.00000, 0.00000, 165.06007},
    {968, -945.59979, -265.09021, 36.56960, 0.00000, -90.00000, -11.99999, 0.00000, 0.00000, -11.99999},
    {968, -959.57751, -264.96500, 36.42434, 0.00000, -90.00000, 168.30022, 0.00000, 0.00000, 168.30022},
    {968, -99.50238, -926.18854, 19.26866, 0.00000, 90.00000, -24.06001, 0.00000, 0.00000, -24.06001},
    {968, -87.71337, -933.23334, 19.26866, 0.00000, 90.00000, -204.53981, 0.00000, 0.00000, -204.53981},
    {968, 64.05585, -1530.18420, 4.92613, 0.00000, 90.00000, 83.65998, 0.00000, 0.00000, 83.65998},
    {968, 39.86787, -1532.86694, 5.04603, 0.00000, 90.00000, 262.16006, 0.00000, 0.00000, 262.16006},
    {968, 606.61639, -1202.37683, 17.84930, 0.00000, 90.00000, 22.29999, 0.00000, 0.00000, 22.29999},
    {968, 626.58527, -1193.91968, 18.01152, 0.00000, 90.00000, 29.49999, 0.00000, 0.00000, 29.49999}
};

hook OnGameModeInit() {
    for(new i = 0; i < sizeof(Gise); i++) {
        Gise[i][obje] = CreateDynamicObject(Gise[i][objeID], Gise[i][objeX], Gise[i][objeY], Gise[i][objeZ], Gise[i][objerX], Gise[i][objerY], Gise[i][objerZ]);
    }
    return 1;
}

CMD:gise(playerid) {
    if(!IsPlayerLoggedIn(playerid)) return 1;
    if(Veriler[gisedurum] == 1) return Mesaj(playerid, HATA_MESAJ, "Giþeler Los Santos Polis Departmaný tarafýndan kapatýlmýþ.");
	if(IsPlayerInAnyVehicle(playerid))
	{
		for(new i = 0; i < sizeof(Gise); i++)
		{    
		    if(IsPlayerInRangeOfPoint(playerid, 10.0, Gise[i][objeX], Gise[i][objeY], Gise[i][objeZ]))
		    {
		        if(!Gise[i][durum])
		        {
		    		if(Karakter[playerid][para] >= 15)
					{
						if(!Karakter[playerid][isbasi] && !Karakter[playerid][medisbasi] && !Karakter[playerid][fdisbasi]) GivePlayerCash(playerid, -15);
						Gise[i][durum] = true;
						SetDynamicObjectRot(Gise[i][obje], Gise[i][objeorX], Gise[i][objeorY], Gise[i][objeorZ]);
                        Streamer_Update(playerid);
                        defer GiseTimer(i);
					}
					else Mesaj(playerid, HATA_MESAJ, "Üzerinizde yeterli miktarda nakit bulunmuyor.");
				}
		   	    break;
		   	}
		}
	}
    return 1;
}

timer GiseTimer[4000](object) {
    SetDynamicObjectRot(Gise[object][obje], Gise[object][objerX], Gise[object][objerY], Gise[object][objerZ]);
    Gise[object][durum] = false;
}