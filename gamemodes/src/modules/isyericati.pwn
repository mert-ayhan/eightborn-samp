CMD:isyericati(playerid, params[]) return cmd_icati(playerid, params);
CMD:icati(playerid, params[]) {
	if(!IsPlayerLoggedIn(playerid)) return 1;
	new mesafe = IsyeriIceridenMesafesi(30.0, playerid);
 	if(mesafe == 0) {
	 	foreach (new i : Business) { 
			if(Isyeri[i][caticikisX] != 0) {
   				if(IsPlayerInRangeOfPoint(playerid, 3, Isyeri[i][caticikisX], Isyeri[i][caticikisY], Isyeri[i][caticikisZ]) && GetPlayerInterior(playerid) == Isyeri[i][caticikisint] && GetPlayerVirtualWorld(playerid) == Isyeri[i][caticikisvw]) {
					if(Isyeri[i][ikilit]) return Mesaj(playerid, HATA_MESAJ, "��yeri kilitli durumdad�r.");
					TogglePlayerControllable(playerid, false);
					SetPlayerPos(playerid, Isyeri[i][catigirisX], Isyeri[i][catigirisY], Isyeri[i][catigirisZ]);
					SetPlayerInterior(playerid, Isyeri[i][catigirisint]);
					SetPlayerVirtualWorld(playerid, Isyeri[i][catigirisvw]);
					SetTimerEx("UnfreezeTimer", 3500, false, "u", playerid);
					return 1;
				}
			}
		}
	 	Hata(playerid, "��yerinin �at�s�nda bulunmuyorsunuz.");
	} else {
 		if(Isyeri[mesafe][catigirisX] == 0) return Hata(playerid, "Bu i�yerinin �at�s� bulunmuyor.");
		if(IsPlayerInRangeOfPoint(playerid, 3, Isyeri[mesafe][catigirisX], Isyeri[mesafe][catigirisY], Isyeri[mesafe][catigirisZ]) && GetPlayerInterior(playerid) == Isyeri[mesafe][catigirisint] && GetPlayerVirtualWorld(playerid) == Isyeri[mesafe][catigirisvw]) {
			TogglePlayerControllable(playerid, false);
			SetPlayerPos(playerid, Isyeri[mesafe][caticikisX], Isyeri[mesafe][caticikisY], Isyeri[mesafe][caticikisZ]);
			SetPlayerInterior(playerid, Isyeri[mesafe][caticikisint]);
			SetPlayerVirtualWorld(playerid, Isyeri[mesafe][caticikisvw]);
			SetTimerEx("UnfreezeTimer", 3500, false, "u", playerid);
		}
 	}
	return 1;
}

CMD:isyericatiduzenle(playerid, params[]) return cmd_icatiduzenle(playerid, params);
CMD:icatiduzenle(playerid, params[])
{
    if(!IsPlayerLoggedIn(playerid) || !IsAdminLoggedIn(playerid) || GetPlayerAdminLevel(playerid) < 5) return 1;
    new businessID, type;
    if(sscanf(params,"dd",businessID,type)) { Mesaj(playerid, KULLANIM_MESAJ, "/icatiduzenle [i�yeriID] [1-2]"); SendClientMessage(playerid, -1, ""C3"1:Giri�-2:��k��"); return 1; }
    if(type != 1 && type != 2) { Mesaj(playerid, KULLANIM_MESAJ, "/icatiduzenle [i�yeriID] [1-2]"); SendClientMessage(playerid, -1, ""C3"1:Giri�-2:��k��"); return 1;}
    if(type == 1)
    {
        new Float:pPos[4];
        GetPlayerPos(playerid, pPos[0], pPos[1], pPos[2]);
        Isyeri[businessID][catigirisX] = pPos[0];
        Isyeri[businessID][catigirisY] = pPos[1];
        Isyeri[businessID][catigirisZ] = pPos[2];
        Isyeri[businessID][catigirisint] = GetPlayerInterior(playerid);
        Isyeri[businessID][catigirisvw] = GetPlayerVirtualWorld(playerid);
        Mesaj(playerid, BILGI_MESAJ, "%d idli i�yerinin �at� giri�ini ayarlad�n�z.", businessID);
    }
    else
    {
        new Float:pPos[4];
        GetPlayerPos(playerid, pPos[0], pPos[1], pPos[2]);
        Isyeri[businessID][caticikisX] = pPos[0];
        Isyeri[businessID][caticikisY] = pPos[1];
        Isyeri[businessID][caticikisZ] = pPos[2];
        Isyeri[businessID][caticikisint] = GetPlayerInterior(playerid);
        Isyeri[businessID][caticikisvw] = GetPlayerVirtualWorld(playerid);
        Mesaj(playerid, BILGI_MESAJ, "%d idli i�yerinin �at� ��k���n� ayarlad�n�z.", businessID);
    }
    IsyeriKaydet(businessID);
	return 1;
}