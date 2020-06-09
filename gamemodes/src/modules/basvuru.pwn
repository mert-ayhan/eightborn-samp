#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
    SetSVarInt("BasvuruDurum", 1);
    return 1;
}

hook OnPlayerConnect(playerid) {
    /*if(Karakter[playerid][sqlid]) {
		if(SQLGuvenlikAyar(Karakter[playerid][sqlid]) && !SQLGuvenlikDurum(Karakter[playerid][sqlid])) {
			for(new a; a < 35; a++) SendClientMessage(playerid, -1, "");
		    SendClientMessage(playerid, COLOR_LIGHTRED, "Lütfen oyuna girmek için güvenlik durumunuzu aktifleþtirin.");
			KickEx(playerid);
		}
	}*/
    static userName[MAX_PLAYER_NAME+1];
    GetPlayerName(playerid, userName, sizeof(userName));
	if(!GivePlayerSQLid(userName))
	{
		for(new a; a < 35; a++) SendClientMessage(playerid, -1, "");
		if(GetSVarInt("BasvuruDurum")) {
			if(!_IsARPName(Isim(playerid)))
			{
				SendClientMessage(playerid, -1, "{B3B3B3}[EIGHTBORN] {ffffff}Adýnýz roleplay kurallarýna uygun deðildir, lütfen deðiþtirerek tekrar girin.");
				KickEx(playerid);
				return 1;
			}
			Dialog_Show(playerid, BasvuruDialog_1, DIALOG_STYLE_MSGBOX, ""C7"EIGHTBORN - "C8"Baþvuru", "{FFFFFF}Sunucumuzda kayýtlý hesabýnýz bulunamadý.\nYeni bir karakter açmak için sunucumuza baþvurmak ister misiniz?\n{B3B3B3}((Baþvurmadan önce forumda bulunan sunucu kurallarýna göz atmayý unutmayýn..))", "Evet", "Hayýr");
		}
		else {
			SendClientMessage(playerid, COLOR_LIGHTRED, "Baþvurular kapalý durumdadýr, baþvurularýn açýlmasýný bekleyiniz.");
			SendClientMessage(playerid, COLOR_LIGHTRED, "Site: www.eightbornrpg.com");
			KickEx(playerid);
		}
	}
    return 1;
}

hook OnPlayerDisconnect(playerid, reason) {
    DeletePVar(playerid, "Basvuru");
    DeletePVar(playerid, "Soru1");
	DeletePVar(playerid, "Soru2");
	DeletePVar(playerid, "Soru3");
	DeletePVar(playerid, "Rol");
    DeletePVar(playerid, "BasvuruYapiyor");
    DeletePVar(playerid, "BasvuruBakiyor");
    return 1;
}

CMD:basvurudurum(playerid) {
    if(!IsPlayerLoggedIn(playerid) || GetPlayerAdminLevel(playerid) < 5 || !IsAdminLoggedIn(playerid)) return 1;
    if(GetSVarInt("BasvuruDurum") == 1) {
        SetSVarInt("BasvuruDurum", 0);
        Mesaj(playerid, BILGI_MESAJ, "Baþvurularý kapadýnýz.");
    } else {
        SetSVarInt("BasvuruDurum", 1);
        Mesaj(playerid, BILGI_MESAJ, "Baþvurularý açtýnýz.");
    }
    return 1;
}

Dialog:BasvuruDialog_1(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		Dialog_Show(playerid, BasvuruDialog_2, DIALOG_STYLE_MSGBOX, ""C7"EIGHTBORN - "C8"Baþvuru", "{FFFFFF}Size bir kaç soru soracaðýz ve verdiðiniz cevaplar oyundaki adminlere gönderilecek.\nEðer baþvurunuz kabul edilirse oyuna baþlayacaksýnýz ve baþvurunuz kabul edilmeden oyundan çýkarsanýz baþvurunuz iptal olacaktýr.", "Devam", "");
        SetPVarInt(playerid, "BasvuruYapiyor", 1);
	}
	else Kick(playerid);
	return 1;
}

Dialog:BasvuruDialog_2(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        Dialog_Show(playerid, BasvuruDialog_3, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Baþvuru [TEST]", "{FFFFFF}Sunucumuzda belirlenen 2. derece güvenli bölgelerden biri deðildir?\n{B3B3B3}A) Market Caddesi\n{B3B3B3}B) Starfish\n{B3B3B3}C) Meslek Bölgeleri\n{B3B3B3}D) Santa Maria Sahili\n{B3B3B3}E) Pizza Stack ve çevresi", "Devam", "");
	}
    return 1;
}

Dialog:BasvuruDialog_3(playerid, response, listitem, inputtext[])
{
    if(response)
    {
		if(listitem == 0) return Dialog_Show(playerid, BasvuruDialog_3, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Baþvuru [TEST]", "{FFFFFF}Sunucumuzda belirlenen 2. derece güvenli bölgelerden biri deðildir?\n{B3B3B3}A) Market Caddesi\n{B3B3B3}B) Starfish\n{B3B3B3}C) Meslek Bölgeleri\n{B3B3B3}D) Santa Maria Sahili\n{B3B3B3}E) Pizza Stack ve çevresi", "Devam", "");
        if(listitem == 5) SetPVarString(playerid, "Soru1", "Doðru");
		else SetPVarString(playerid, "Soru1", "Yanlýþ");
        Dialog_Show(playerid, BasvuruDialog_4, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Baþvuru [TEST]", "{FFFFFF}Aþaðýdakilerden hangisi karþý taraf silah çektiðinde emotesiz çýkarabileceðiniz silah deðildir?\n{B3B3B3}A) Shotgun\n{B3B3B3}B) Deagle\n{B3B3B3}C) Tec-9\n{B3B3B3}D) Uzi\n{B3B3B3}E) Pistol", "Devam", "");
    }
    return 1;
}

Dialog:BasvuruDialog_4(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        if(listitem == 0) return Dialog_Show(playerid, BasvuruDialog_4, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Baþvuru [TEST]", "{FFFFFF}Aþaðýdakilerden hangisi karþý taraf silah çýkarttýðýnda emotesiz çýkarabileceðiniz bir silah deðildir?\n{B3B3B3}A) Shotgun\n{B3B3B3}B) Deagle\n{B3B3B3}C) Tec-9\n{B3B3B3}D) Uzi\n{B3B3B3}E) Pistol", "Devam", "");
		if(listitem == 1) SetPVarString(playerid, "Soru2", "Doðru");
		else SetPVarString(playerid, "Soru2", "Yanlýþ");
        Dialog_Show(playerid, BasvuruDialog_5, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Baþvuru [TEST]", "{FFFFFF}Sunucumuzda gasp rolü yapabilmek kaç seviye gereklidir ve maksimum ne kadar para alabilirsiniz?\n{B3B3B3}A) Seviye: 1 - Para: 500$\n{B3B3B3}B) Seviye: 2 - Para: Yüzde 5\n{B3B3B3}C) Seviye: 1 - Para: 1000$\n{B3B3B3}D) Seviye: 2 - Para: Yüzde 5\n{B3B3B3}E) Seviye: 3 - Para: Yüzde 10", "Devam", "");
    }
    return 1;
}

Dialog:BasvuruDialog_5(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        if(listitem == 0) return Dialog_Show(playerid, BasvuruDialog_5, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Baþvuru [TEST]", "{FFFFFF}Sunucumuzda gasp rolü yapabilmek kaç seviye gereklidir ve maksimum ne kadar para alabilirsiniz?\n{B3B3B3}A) Seviye: 1 - Para: 500$\n{B3B3B3}B) Seviye: 2 - Para: Yüzde 5\n{B3B3B3}C) Seviye: 1 - Para: 1000$\n{B3B3B3}D) Seviye: 2 - Para: Yüzde 5\n{B3B3B3}E) Seviye: 3 - Para: Yüzde 10", "Devam", "");
		if(listitem == 5) SetPVarString(playerid, "Soru3", "Doðru");
        else SetPVarString(playerid, "Soru3", "Yanlýþ");
		/*new sorusay = 0;
		new mstring[16];
		GetPVarString(playerid, "Soru1", mstring, 16);
		if(Buysa(mstring, "Doðru")) sorusay++;
		GetPVarString(playerid, "Soru2", mstring, 16);
		if(Buysa(mstring, "Doðru")) sorusay++;
		GetPVarString(playerid, "Soru3", mstring, 16);
		if(Buysa(mstring, "Doðru")) sorusay++;
		if(sorusay >= 2) {
		    SendClientMessage(playerid, -1, "{B3B3B3}[BAÞVURU] {FFFFFF}Testi baþarýyla geçtiniz.");
	    	SetPVarInt(playerid, "Basvuru", 0);
			ShowPlayerDialog(playerid, 274, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Kayýt", "{FFFFFF}Sunucuda kullanacaðýnýz þifreyi girin:", "Tamam" , "");
		}
		else {
            SendClientMessage(playerid, -1, "{B3B3B3}[BAÞVURU] {FFFFFF}Lütfen kurallarý tekrar gözden geçirin.");
		    SetPVarInt(playerid, "Basvuru", 0);
	        KickEx(playerid);
		}*/
    	Dialog_Show(playerid, BasvuruDialog_6, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Baþvuru [INPUT]", "{FFFFFF}Sunucumuzda izleyeceðiniz rolü kýsaca anlatýn.", "Devam", "");
    }
    return 1;
}

Dialog:BasvuruDialog_6(playerid, response, listitem, inputtext[])
{
	if(response)
	{
	    SetPVarString(playerid, "Rol", inputtext);
	    SetPVarInt(playerid, "Basvuru", 1);
        ShowMainScreen(playerid);
	    SendClientMessage(playerid, -1, ""C2"[BAÞVURU] "C1"Baþvurunuz online yetkililere gönderilmiþtir, lütfen baþvurunuzun onaylanmasýný bekleyin.");
        foreach(new i : Player) {
            if(GetPlayerAdminLevel(i) >= 1 || GetPlayerHelperLevel(i) >= 2) 
                SendClientMessage(i, -1, ""C2"[BAÞVURU] Baþvuru geldi. /basvurular");
        }
	}
	return 1;
}

Dialog:BasvuruDialog_7(playerid, response, listitem, inputtext[])
{
	if(response)
	{
	    new pID = GetPVarInt(playerid, "BasvuruBakiyor");
	    if(GetPVarInt(pID, "Basvuru") == 0) return 1;
	    SendClientMessageEx(playerid, -1, "{B3B3B3}[BAÞVURU] {FFFFFF}%s oyuncunun baþvurusunu kabul ettiniz.", OyuncuAdiniBul(pID));
	    SendClientMessage(pID, -1, "{B3B3B3}[BAÞVURU] {FFFFFF}Baþvurunuz kabul edildi.");
	    SetPVarInt(pID, "Basvuru", 0);
		Dialog_Show(pID, BasvuruDialog_8, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Kayýt", "{FFFFFF}Sunucuda kullanacaðýnýz þifreyi girin:", "Tamam" , "");
	}
	else
	{
	    new pID = GetPVarInt(playerid, "BasvuruBakiyor");
	    if(GetPVarInt(pID, "Basvuru") == 0) return 1;
	    SendClientMessageEx(playerid, -1, "{B3B3B3}[BAÞVURU] {FFFFFF}%s oyuncunun baþvurusunu reddettiniz.", OyuncuAdiniBul(pID));
	    SendClientMessage(pID, -1, "{B3B3B3}[BAÞVURU] {FFFFFF}Baþvurunuz reddedildi.");
	    SetPVarInt(pID, "Basvuru", 0);
	    KickEx(pID);
	}
	return 1;
}

Dialog:BasvuruDialog_8(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        new query[128], userName[MAX_PLAYER_NAME+1];
        GetPlayerName(playerid, userName, sizeof(userName));
        format(query, sizeof(query), "INSERT INTO `karakterler` (`isim`, `sifre`) VALUES ('%s', MD5('%s'))", userName, inputtext);
        mysql_tquery(1, query);
        SendClientMessage(playerid, -1, "{B3B3B3}[KAYIT] {FFFFFF}Baþarýyla kayýt oldunuz lütfen sunucuya tekrar giriþ yapýn.");
        KickEx(playerid);
    }
    return 1;
}

CMD:basvurular(playerid)
{
	if(!IsPlayerLoggedIn(playerid) || (GetPlayerAdminLevel(playerid) < 1 && GetPlayerHelperLevel(playerid) < 2)) return 1;
	SendClientMessage(playerid, -1, "_________________Baþvurular________________ (/basvurubak)");
	foreach(new i : Player)
	{
	    if(GetPVarInt(i, "Basvuru") == 1) SendClientMessageEx(playerid, -1, ""C2"[BAÞVURU] "C1"Isim: "C2"%s "C1"baþvuruID: "C2"%d",OyuncuAdiniBul(i), i);
	}
	return 1;
}

CMD:basvurubak(playerid, params[])
{
    if(!IsPlayerLoggedIn(playerid) || (GetPlayerAdminLevel(playerid) < 1 && GetPlayerHelperLevel(playerid) < 2)) return 1;
	new pID;
	if(sscanf(params,"u",pID)) return Mesaj(playerid, KULLANIM_MESAJ, "/basvurubak [oyuncuID]");
	if(!IsPlayerConnected(pID) || GetPVarInt(pID, "Basvuru") == 0) return Mesaj(playerid, HATA_MESAJ, "Hatalý oyuncuid belirttiniz.");
	new string[256], sorular[3][7], rol[128];
	GetPVarString(pID, "Soru1", sorular[0], 7);
	GetPVarString(pID, "Soru2", sorular[1], 7);
	GetPVarString(pID, "Soru3", sorular[2], 7);
	GetPVarString(pID, "Rol", rol, sizeof(rol));
	format(string, sizeof(string), ""C1"%s(%d)", OyuncuAdiniBul(pID), pID);
	format(string, sizeof(string), "%s\n"C1"Soru 1:\t\t"C2" %s", string, sorular[0]);
	format(string, sizeof(string), "%s\n"C1"Soru 2:\t\t"C2" %s", string, sorular[1]);
	format(string, sizeof(string), "%s\n"C1"Soru 3:\t\t"C2" %s", string, sorular[2]);
	format(string, sizeof(string), "%s\n"C1"Ýzleyeceði Rol:", string);
	format(string, sizeof(string), "%s\n"C2"%s", string, rol);
	SetPVarInt(playerid, "BasvuruBakiyor", pID);
	Dialog_Show(playerid, BasvuruDialog_7, DIALOG_STYLE_MSGBOX, ""C7"EIGHTBORN - "C8"Baþvuru", string, "Kabul Et", "Reddet");
	return 1;
}