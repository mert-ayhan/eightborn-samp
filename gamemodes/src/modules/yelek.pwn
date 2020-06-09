#include <YSI_Coding\y_hooks>

#define YELEK_INDEX 8

enum YelekEnum {
    BirlikID,
    YelekIsim[32],
    YelekObje
};

new Yelek[2][YelekEnum] = {
    {105, "Çaylak Yelek", -2065},
    {105, "Tam Yelek", -2066}
};

CMD:yelek(playerid, params[]) {
    if(!IsPlayerLoggedIn(playerid) || GetPlayerFactionType(playerid) != MC) return 1;
    new string[6];
    if(sscanf(params,"s[6]",string)) { Mesaj(playerid, KULLANIM_MESAJ, "/yelek [fonksiyon]"); SendClientMessage(playerid, -1, ""C3"Kullanýlabilir fonksiyonlar: giy, cikar"); return 1; }
    if(!strcmp(string,"giy")) {
        if(GetPVarInt(playerid, "YelekGiyiyor")) return Mesaj(playerid, HATA_MESAJ, "Zaten yelek giyiyorsunuz.");
        new stringex[128];
        for(new i = 0; i < sizeof(Yelek); i++) {
            if(Yelek[i][BirlikID] == Karakter[playerid][birlik]) {
                format(stringex, sizeof(stringex), "%s%s\n", stringex, Yelek[i][YelekIsim]);
            }
        }
        if(isnull(stringex)) return Mesaj(playerid, HATA_MESAJ, "Birliðinize ait yelek bulunmamaktadýr.");
        Dialog_Show(playerid, YelekDialog, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Yelek", stringex, "Giy", "Ýptal");
    } else if(!strcmp(string,"cikar")) {
        if(!GetPVarInt(playerid, "YelekGiyiyor")) return Mesaj(playerid, HATA_MESAJ, "Yelek giymiyorsunuz.");
        Mesaj(playerid, BILGI_MESAJ, "Yeleði çýkardýnýz.");
        RemovePlayerAttachedObject(playerid, YELEK_INDEX);
        DeletePVar(playerid, "YelekGiyiyor");
    } else { Mesaj(playerid, KULLANIM_MESAJ, "/yelek [fonksiyon]"); SendClientMessage(playerid, -1, ""C3"Kullanýlabilir fonksiyonlar: giy, cikar"); return 1; }
    return 1;
}

Dialog:YelekDialog(playerid, response, listitem, inputtext[])
{
	if(response) {
        new count = -1;
        for(new i = 0; i < sizeof(Yelek); i++) {
            if(Yelek[i][BirlikID] == Karakter[playerid][birlik]) {
                count++;
                if(listitem == count) {
                    new Float:arr[9] = {0.0 , 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0};
                    GetYelekPos(playerid, arr);
                    SetPlayerAttachedObject(playerid, YELEK_INDEX, Yelek[i][YelekObje], 1, arr[0], arr[1], arr[2], arr[3], arr[4], arr[5], arr[6], arr[7], arr[8]);
                    EditAttachedObject(playerid, YELEK_INDEX);
                    SetPVarInt(playerid, "YelekDuzenliyor", 1);
                    break;
                }
            }
        }
    }
    return 1;
}

hook OnPlayerDisconnect(playerid, reason) {
    DeletePVar(playerid, "YelekGiyiyor");
    DeletePVar(playerid, "YelekDuzenliyor");
    return 1;
}

GetYelekPos(playerid, Float:arr[]) {
    new query[128];
	format(query, sizeof(query), "SELECT `yelek` FROM `karakterler` WHERE `id` = '%d'", Karakter[playerid][sqlid]);
	new Cache:result = mysql_query(query, true);
    format(query, sizeof(query), "");
	cache_get_row(0, 0, query);
	cache_delete(result);
    if(!isnull(query)) {
        new exarr[9][12];
        strexplode(exarr, query, "|");
        for(new i = 0; i < sizeof(exarr); i++)
            arr[i] = floatstr(exarr[i]);
    }
}

UpdateYelekPos(playerid, string[]) {
    new query[256];
	format(query, sizeof(query), "UPDATE `karakterler` SET `yelek` = '%s' WHERE `id` = '%d'", string, Karakter[playerid][sqlid]);
	mysql_tquery(1, query);
}