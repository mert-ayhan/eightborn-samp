static KartTur[4][6] = { "Ma�a", "Kupa", "Karo", "Sinek" },
    KartSayi[13][3] = { "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K" };

CMD:kart(playerid) {
    if(!IsPlayerLoggedIn(playerid)) return 1;
    new string[128];
	format(string, sizeof(string), "* %s kart�n� a�ar. (( %s %s ))", OyuncuAdiniBul(playerid), KartTur[random(4)], KartSayi[random(13)]);
	ProxDetector(15.0, playerid, string, COLOR_DO, COLOR_DO, COLOR_DO, COLOR_DO, COLOR_DO);
    return 1;
}

CMD:kart2(playerid) {
    if(!IsPlayerLoggedIn(playerid)) return 1;
    new tur = random(4),
        tur2 = random(4),
        sayi = random(13),
        sayi2 = random(13),
	    string[128];
    while(tur2 == tur && sayi == sayi2) {
        tur2 = random(4);
        sayi2 = random(13);
    }
	format(string, sizeof(string), "* %s kartlar�n� a�ar. (( %s %s, %s %s ))", OyuncuAdiniBul(playerid), KartTur[tur], KartSayi[sayi], KartTur[tur2], KartSayi[sayi2]);
	ProxDetector(15.0, playerid, string, COLOR_DO, COLOR_DO, COLOR_DO, COLOR_DO, COLOR_DO);
    return 1;
}

CMD:akart(playerid, params[]) {
    if(!IsPlayerLoggedIn(playerid) || !IsAdminLoggedIn(playerid) || GetPlayerAdminLevel(playerid) < 5) return 1;
    new tur, kart[3], string[128];
    if(sscanf(params,"ds[3]",tur,kart)) { 
        Mesaj(playerid, KULLANIM_MESAJ, "/akart [t�r] [kart]"); 
        Mesaj(playerid, IPUCU_MESAJ, "T�rler: 1: Ma�a, 2: Kupa, 3: Karo, 4: Sinek");
        Mesaj(playerid, IPUCU_MESAJ, "Kartlar: A, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K");
        return 1;
    }
    format(string, sizeof(string), "* %s kartlar�n� a�ar. (( %s %s ))", OyuncuAdiniBul(playerid), KartTur[tur-1], kart);
	ProxDetector(15.0, playerid, string, COLOR_DO, COLOR_DO, COLOR_DO, COLOR_DO, COLOR_DO);
    return 1;
}

CMD:akart2(playerid, params[]) {
    if(!IsPlayerLoggedIn(playerid) || !IsAdminLoggedIn(playerid) || GetPlayerAdminLevel(playerid) < 5) return 1;
    new tur1, tur2, kart1[3], kart2[3], string[128];
    if(sscanf(params,"ds[3]ds[3]",tur1,kart1,tur2,kart2)) { 
        Mesaj(playerid, KULLANIM_MESAJ, "/akart2 [t�r1] [kart1] [t�r2] [kart2]"); 
        Mesaj(playerid, IPUCU_MESAJ, "T�rler: 1: Ma�a, 2: Kupa, 3: Karo, 4: Sinek");
        Mesaj(playerid, IPUCU_MESAJ, "Kartlar: A, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K");
        return 1;
    }
    format(string, sizeof(string), "* %s kartlar�n� a�ar. (( %s %s, %s %s ))", OyuncuAdiniBul(playerid), KartTur[tur1-1], kart1, KartTur[tur2-1], kart2);
	ProxDetector(15.0, playerid, string, COLOR_DO, COLOR_DO, COLOR_DO, COLOR_DO, COLOR_DO);
    return 1;
}