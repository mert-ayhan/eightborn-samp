#include <YSI_Coding\y_hooks>

static erkekSkin[3] = { 25900, 25901, 25902 };
static kadinSkin[16] = { 26400, 26401, 26402, 26403, 26404, 26405, 26406, 26407, 26408, 26409, 26410, 26411, 26412, 26413, 26414, 26415 };

hook OnPlayerDisconnect(playerid, reason) {
	DeletePVar(playerid, "Soyundu");
	return 1;
}

DEFINE_HOOK_REPLACEMENT(Selection, Sel);
hook OnPlayerModelSelEx(playerid, response, extraid, modelid) {
	if(extraid == MENU_SOYUN_ERKEK || extraid == MENU_SOYUN_KADIN) {
		if(response) {
		    SetPVarInt(playerid, "Soyundu", 1);
  			SetPlayerSkin(playerid, modelid);
		}
        return Y_HOOKS_BREAK_RETURN_1;
	}
	return 1;
}

CMD:soyun(playerid) {
	if(IsPlayerLoggedIn(playerid)) {
		if(GetPVarInt(playerid, "Soyundu") == 1) {
  			SetPVarInt(playerid, "Soyundu", 0);
  			SetPlayerSkin(playerid, Karakter[playerid][skin]);
		} else {
			if(Karakter[playerid][cinsiyet] == CINSIYET_ERKEK) ShowModelSelectionMenuEx(playerid, erkekSkin, sizeof(erkekSkin), "EIGHTBORN - Soyun", MENU_SOYUN_ERKEK);
		   	else ShowModelSelectionMenuEx(playerid, kadinSkin, sizeof(kadinSkin), "EIGHTBORN - Soyun", MENU_SOYUN_KADIN);
		}
	}
	return 1;
}
