CMD:yardim(playerid) {
    SendClientMessage(playerid, -1, ""C7"| Yard�m |");
    SendClientMessage(playerid, -1, ""C9"/rolyardim, /karakteryardim, /etkilesimyardim, /evyardim, /isyeriyardim, /genelyardim");
    SendClientMessage(playerid, -1, ""C9"/aksesuaryardim, /aracyardim, /birlikyardim, /meslek, /grup");
    return 1;
}

CMD:etkilesimyardim(playerid) {
    SendClientMessage(playerid, -1, ""C7"| Etkile�im Yard�m |");
    SendClientMessage(playerid, -1, ""C9"/ehliyetgoster, /dlisansgoster, /hlisansgoster, /surukle, /gozbagla, /kimlikgoster");
    return 1;
}

CMD:karakteryardim(playerid) {
    SendClientMessage(playerid, -1, ""C7"| Karakter Yard�m |");
    SendClientMessage(playerid, -1, ""C9"/karakter, /kiyafetlerim, /telefon, /durum, /ozellik");
    return 1;
}

CMD:rolyardim(playerid) {
    SendClientMessage(playerid, -1, ""C7"| Rol Yard�m |");
    SendClientMessage(playerid, -1, ""C9"/me, /do, /b, /s, /c, /w, /animasyonlar1, /animasyonlar2");
    return 1;
}

CMD:genelyardim(playerid) {
    SendClientMessage(playerid, -1, ""C7"| Genel Yard�m |");
    SendClientMessage(playerid, -1, ""C9"/pm, /admins, /helpers, /rapor, /soru, /hudkapat, /hedefsifirla, /gorevde, /forumadi, /chattemizle");
    SendClientMessage(playerid, -1, ""C9"/vwsifirla, /konusmatarzi, /yuruyus, /masasandalye, /yayinkapat, /reklamkapat, /bolgehudkapat");
    return 1;
}

CMD:aksesuaryardim(playerid) {
    SendClientMessage(playerid, -1, ""C7"| Aksesuar Yard�m |");
    SendClientMessage(playerid, -1, ""C9"/aksesuar");
    return 1;
}