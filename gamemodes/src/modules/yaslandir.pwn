CMD:yaslandir(playerid, params[]) {
    new string[6];
    if(sscanf(params,"s[6]",string)) { Mesaj(playerid, KULLANIM_MESAJ, "/yaslandir [kabul]"); Mesaj(playerid, IPUCU_MESAJ, "Karakterinizi ya�land�r�rsan�z karakterinizin ya�� 1 artacakt�r. Geri d�n��� yoktur!"); return 1; }
    if(!strcmp("kabul",string)) {
        Karakter[playerid][yas]++;
        Mesaj(playerid, BILGI_MESAJ, "Karakterinizi ya�land�rd�n�z.");
    }
    return 1;
}