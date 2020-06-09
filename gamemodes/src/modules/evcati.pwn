CMD:ecati(playerid) return cmd_evcati(playerid);
CMD:evcati(playerid) {
	if(!IsPlayerLoggedIn(playerid)) return 1;
	new mesafe = EvIceridenMesafesi(playerid);
 	if(mesafe == 0) {
	 	foreach (new i : Houses) { 
			if(Ev[i][caticikisX] != 0) {
   				if(IsPlayerInRangeOfPoint(playerid, 3, Ev[i][caticikisX], Ev[i][caticikisY], Ev[i][caticikisZ]) && GetPlayerInterior(playerid) == Ev[i][caticikisint] && GetPlayerVirtualWorld(playerid) == Ev[i][caticikisvw]) {
					if(Ev[i][ekilit]) return Mesaj(playerid, HATA_MESAJ, "Ev kilitli durumdadýr.");
					TogglePlayerControllable(playerid, false);
					SetPlayerPos(playerid, Ev[i][catigirisX], Ev[i][catigirisY], Ev[i][catigirisZ]);
					SetPlayerInterior(playerid, Ev[i][catigirisint]);
					SetPlayerVirtualWorld(playerid, Ev[i][catigirisvw]);
					SetTimerEx("UnfreezeTimer", 3500, false, "u", playerid);
					return 1;
				}
			}
		}
	 	Hata(playerid, "Evin çatýsýnda bulunmuyorsunuz.");
	} else {
 		if(Ev[mesafe][catigirisX] == 0) return Mesaj(playerid, HATA_MESAJ, "Bu evin çatýsý bulunmuyor.");
		if(IsPlayerInRangeOfPoint(playerid, 3, Ev[mesafe][catigirisX], Ev[mesafe][catigirisY], Ev[mesafe][catigirisZ]) && GetPlayerInterior(playerid) == Ev[mesafe][catigirisint] && GetPlayerVirtualWorld(playerid) == Ev[mesafe][catigirisvw]) {
			TogglePlayerControllable(playerid, false);
			SetPlayerPos(playerid, Ev[mesafe][caticikisX], Ev[mesafe][caticikisY], Ev[mesafe][caticikisZ]);
			SetPlayerInterior(playerid, Ev[mesafe][caticikisint]);
			SetPlayerVirtualWorld(playerid, Ev[mesafe][caticikisvw]);
			SetTimerEx("UnfreezeTimer", 3500, false, "u", playerid);
		}
 	}
	return 1;
}

CMD:evcatiduzenle(playerid, params[]) return cmd_ecatiduzenle(playerid, params);
CMD:ecatiduzenle(playerid, params[])
{
    if(!IsPlayerLoggedIn(playerid) || !IsAdminLoggedIn(playerid) || GetPlayerAdminLevel(playerid) < 5) return 1;
    new houseID, type;
    if(sscanf(params,"dd",houseID,type)) { Mesaj(playerid, KULLANIM_MESAJ, "/ecatiduzenle [evID] [1-2]"); SendClientMessage(playerid, -1, ""C3"1:Giriþ-2:Çýkýþ"); return 1; }
    if(type != 1 && type != 2) { Mesaj(playerid, KULLANIM_MESAJ, "/ecatiduzenle [evID] [1-2]"); SendClientMessage(playerid, -1, ""C3"1:Giriþ-2:Çýkýþ"); return 1;}
    if(type == 1)
    {
        new Float:pPos[4];
        GetPlayerPos(playerid, pPos[0], pPos[1], pPos[2]);
        Ev[houseID][catigirisX] = pPos[0];
        Ev[houseID][catigirisY] = pPos[1];
        Ev[houseID][catigirisZ] = pPos[2];
        Ev[houseID][catigirisint] = GetPlayerInterior(playerid);
        Ev[houseID][catigirisvw] = GetPlayerVirtualWorld(playerid);
        Mesaj(playerid, BILGI_MESAJ, "%d idli evin çatý giriþini ayarladýnýz.", houseID);
    }
    else
    {
        new Float:pPos[4];
        GetPlayerPos(playerid, pPos[0], pPos[1], pPos[2]);
        Ev[houseID][caticikisX] = pPos[0];
        Ev[houseID][caticikisY] = pPos[1];
        Ev[houseID][caticikisZ] = pPos[2];
        Ev[houseID][caticikisint] = GetPlayerInterior(playerid);
        Ev[houseID][caticikisvw] = GetPlayerVirtualWorld(playerid);
        Mesaj(playerid, BILGI_MESAJ, "%d idli evin çatý çýkýþýný ayarladýnýz.", houseID);
    }
    EvKaydet(houseID);
	return 1;
}