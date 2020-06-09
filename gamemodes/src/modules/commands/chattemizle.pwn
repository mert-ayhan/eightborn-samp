CMD:chattemizle(playerid) {
    if(!IsPlayerLoggedIn(playerid)) return 1;
    for(new a; a < 35; a++) SendClientMessage(playerid, -1, "");
    return 1;
}