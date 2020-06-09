#include <YSI_Coding\y_hooks>

hook OnGameModeInit() {
	SetSVarInt("CekilisOyuncu", -1);
	return 1;
}

hook OnPlayerDisconnect(playerid, reason) {
    DeletePVar(playerid, "CekilisKatildi");
	DeletePVar(playerid, "BiletSayi");
    return 1;
}

CMD:cekilis(playerid) {
 	if(!IsPlayerLoggedIn(playerid)) return 1;
    if(!GetSVarInt("CekilisDurum")) return Mesaj(playerid, HATA_MESAJ, "Çekiliþe katýlým açýk deðildir.");
	if(GetPVarInt(playerid, "CekilisKatildi")) { Mesaj(playerid, HATA_MESAJ, "Zaten çekiliþe katýlmýþsýnýz."); Mesaj(playerid, IPUCU_MESAJ, "Bilet sayýnýz: %d.", GetPVarInt(playerid, "BiletSayi")); return 1; }
	if(GetPlayerLevel(playerid) < 10) SetPVarInt(playerid, "BiletSayi", 1);
	else SetPVarInt(playerid, "BiletSayi", floatround(float(GetPlayerLevel(playerid)/10), floatround_floor)+1);
	Mesaj(playerid, BILGI_MESAJ, "Baþarýyla çekiliþe katýldýnýz, bilet sayýnýz: %d.", GetPVarInt(playerid, "BiletSayi"));
	SetPVarInt(playerid, "CekilisKatildi", 1);
	return 1;
}

CMD:acekilis(playerid, params[]) {
	if(!IsPlayerLoggedIn(playerid) || GetPlayerAdminLevel(playerid) < 5 || !IsAdminLoggedIn(playerid)) return 1;
	static string[16];
	if(sscanf(params,"s[16]",string)) return Mesaj(playerid, KULLANIM_MESAJ, "/acekilis [ac, kapat, sonuclandir]");
	if(!strcmp(string, "ac", true)) {
		if(GetSVarInt("CekilisDurum")) return Mesaj(playerid, HATA_MESAJ, "Çekiliþe katýlým zaten açýk durumdadýr.");
        SetSVarInt("CekilisDurum", 1);
        Mesaj(playerid, BILGI_MESAJ, "Çekiliþe katýlýmý açtýnýz.");
        SendClientMessageToAll(-1, "{ff7f50}[ÇEKÝLÝÞ] {FFFFFF}Çekiliþe katýlým açýldý. [/cekilis]");
	} 
	else if(!strcmp(string, "kapat", true)) {
		if(!GetSVarInt("CekilisDurum")) return Mesaj(playerid, HATA_MESAJ, "Çekiliþe katýlým zaten kapalý durumdadýr.");
        SetSVarInt("CekilisDurum", 0);
        Mesaj(playerid, BILGI_MESAJ, "Çekiliþe katýlýmý kapattýnýz.");
        SendClientMessageToAll(-1, "{ff7f50}[ÇEKÝLÝÞ] {FFFFFF}Çekiliþe katýlým kapatýldý.");
	} 
	else if(!strcmp(string, "sonuclandir", true)) {
		if(GetSVarInt("CekilisDurum")) return Mesaj(playerid, HATA_MESAJ, "Çekiliþi baþlatmak için katýlýmý kapatmanýz gerekmektedir.");
		SetSVarInt("CekilisSure", 11);
		defer CountDownTimer();
	}
	return 1;
}

CMD:abiletver(playerid, params[]) {
	if(!IsPlayerLoggedIn(playerid) || GetPlayerAdminLevel(playerid) < 5 || !IsAdminLoggedIn(playerid)) return 1;
	static userID;
	if(sscanf(params,"d",userID)) return Mesaj(playerid, KULLANIM_MESAJ, "/abiletver [oyuncuID]");
	if(!IsPlayerLoggedIn(userID)) return Mesaj(playerid, HATA_MESAJ, "Hatalý id belirttiniz.");
	static playerName[MAX_PLAYER_NAME+1];
	GetPlayerName(userID, playerName, sizeof(playerName));
	Mesaj(playerid, BILGI_MESAJ, "%s isimli oyuncuya bir bilet verdiniz.", playerName);
	SetPVarInt(userID, "BiletSayi", GetPVarInt(playerid, "BiletSayi") + 1);
	return 1;
}

CMD:aacekilisoyuncu(playerid, params[]) {
	if(!IsPlayerLoggedIn(playerid) || GetPlayerAdminLevel(playerid) < 5 || !IsAdminLoggedIn(playerid)) return 1;
	static userID;
	if(sscanf(params,"d",userID)) return Mesaj(playerid, KULLANIM_MESAJ, "/acekilisoyuncu [oyuncuID] (-1:normal çekiliþ)");
	if(!IsPlayerLoggedIn(playerid) && userID != -1) return Mesaj(playerid, HATA_MESAJ, "Bu idli oyuncu bulunmamaktadýr.");
	SetSVarInt("CekilisOyuncu", userID);
	if(userID != -1) {
		static playerName[MAX_PLAYER_NAME+1];
		GetPlayerName(userID, playerName, sizeof(playerName));
		Mesaj(playerid, BILGI_MESAJ, "Çekiliþi kazanacak oyuncuyu %s(%d) olarak belirlediniz.", playerName, userID);
	}
	else {
		Mesaj(playerid, BILGI_MESAJ, "Çekiliþi tüm oyuncular kazanabilir.");
	}
	return 1;
}

timer CountDownTimer[1000]()
{
    SetSVarInt("CekilisSure", GetSVarInt("CekilisSure")-1);
	foreach(new i : Player) {
		SendClientMessageEx(i, -1, "{ff7f50}[ÇEKÝLÝÞ] {FFFFFF}%d..",GetSVarInt("CekilisSure"));
	}
	if(GetSVarInt("CekilisSure") != 1) {
		defer CountDownTimer();
	}
	else {
		if(GetSVarInt("CekilisOyuncu") == -1) {
			new userID=-1, lastID, biletler[MAX_PLAYERS*2] = {-1, ...};
			foreach(new i : Player) {
				if(GetPVarInt(i, "CekilisKatildi")) {
					for(new j = 0; j < GetPVarInt(i, "BiletSayi"); j++) {
						for(new k = 0; k < sizeof(biletler); k++) {
							if(biletler[k] == -1) {
								biletler[k] = i;
								lastID = k;
								break;
							}
						}
					}
				}
			}
			while(!IsPlayerConnected(userID)) {
				userID = biletler[random(lastID+1)];
			}
			static playerName[MAX_PLAYER_NAME+1];
			GetPlayerName(userID, playerName, sizeof(playerName));
			foreach(new i : Player) {
				SendClientMessageEx(i, -1, "{ff7f50}[ÇEKÝLÝÞ] {FFFFFF}Kazanan: %s(%d). Tebrikler!",playerName, userID);
				DeletePVar(i, "CekilisKatildi");
			}
		}
		else {
			static playerName[MAX_PLAYER_NAME+1];
			GetPlayerName(GetSVarInt("CekilisOyuncu"), playerName, sizeof(playerName));
			foreach(new i : Player) {
				SendClientMessageEx(i, -1, "{ff7f50}[ÇEKÝLÝÞ] {FFFFFF}Kazanan: %s(%d). Tebrikler!",playerName,GetSVarInt("CekilisOyuncu"));
				DeletePVar(i, "CekilisKatildi");
			}
		}
		SetSVarInt("CekilisOyuncu", -1);
	}
}