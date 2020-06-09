CMD:yaslandir(playerid, params[]) {
    new string[6];
    if(sscanf(params,"s[6]",string)) { Mesaj(playerid, KULLANIM_MESAJ, "/yaslandir [kabul]"); Mesaj(playerid, IPUCU_MESAJ, "Karakterinizi yaþlandýrýrsanýz karakterinizin yaþý 1 artacaktýr. Geri dönüþü yoktur!"); return 1; }
    if(!strcmp("kabul",string)) {
        Karakter[playerid][yas]++;
        Mesaj(playerid, BILGI_MESAJ, "Karakterinizi yaþlandýrdýnýz.");
    }
    return 1;
}