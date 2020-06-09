CMD:abirlikbanka(playerid, params[]) {
    if(!IsPlayerLoggedIn(playerid) || GetPlayerAdminLevel(playerid) < 6 || !IsAdminLoggedIn(playerid)) return 1;
    static birlikID;
    if(sscanf(params, "d", birlikID)) return Mesaj(playerid, KULLANIM_MESAJ, "/abirlikbanka [birlikID]");
    Mesaj(playerid, BILGI_MESAJ, "%s(%d) birli�in kasas�ndaki para %d$.", Birlik[birlikID][fisim], birlikID, Birlik[birlikID][kasa]);
    return 1;
}

CMD:abirlikbankaduzenle(playerid, params[]) {
    if(!IsPlayerLoggedIn(playerid) || GetPlayerAdminLevel(playerid) < 6 || !IsAdminLoggedIn(playerid)) return 1;
    static birlikID, birlikPara;
    if(sscanf(params, "dd", birlikID, birlikPara)) return Mesaj(playerid, KULLANIM_MESAJ, "/abirlikbankaduzenle [birlikID] [para]");
    Birlik[birlikID][kasa] = birlikPara;
    Mesaj(playerid, BILGI_MESAJ, "%s(%d) birli�in kasas�ndaki paray� %d$ olarak ayarlad�n�z.", Birlik[birlikID][fisim], birlikID, Birlik[birlikID][kasa]);
    BirlikKaydet(birlikID);
    return 1;
}