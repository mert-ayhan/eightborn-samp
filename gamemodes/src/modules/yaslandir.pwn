CMD:yaslandir(playerid, params[]) {
    new string[6];
    if(sscanf(params,"s[6]",string)) { Mesaj(playerid, KULLANIM_MESAJ, "/yaslandir [kabul]"); Mesaj(playerid, IPUCU_MESAJ, "Karakterinizi yaşlandırırsanız karakterinizin yaşı 1 artacaktır. Geri dönüşü yoktur!"); return 1; }
    if(!strcmp("kabul",string)) {
        Karakter[playerid][yas]++;
        Mesaj(playerid, BILGI_MESAJ, "Karakterinizi yaşlandırdınız.");
    }
    return 1;
}