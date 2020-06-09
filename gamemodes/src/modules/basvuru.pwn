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
		    SendClientMessage(playerid, COLOR_LIGHTRED, "L�tfen oyuna girmek i�in g�venlik durumunuzu aktifle�tirin.");
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
				SendClientMessage(playerid, -1, "{B3B3B3}[EIGHTBORN] {ffffff}Ad�n�z roleplay kurallar�na uygun de�ildir, l�tfen de�i�tirerek tekrar girin.");
				KickEx(playerid);
				return 1;
			}
			Dialog_Show(playerid, BasvuruDialog_1, DIALOG_STYLE_MSGBOX, ""C7"EIGHTBORN - "C8"Ba�vuru", "{FFFFFF}Sunucumuzda kay�tl� hesab�n�z bulunamad�.\nYeni bir karakter a�mak i�in sunucumuza ba�vurmak ister misiniz?\n{B3B3B3}((Ba�vurmadan �nce forumda bulunan sunucu kurallar�na g�z atmay� unutmay�n..))", "Evet", "Hay�r");
		}
		else {
			SendClientMessage(playerid, COLOR_LIGHTRED, "Ba�vurular kapal� durumdad�r, ba�vurular�n a��lmas�n� bekleyiniz.");
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
        Mesaj(playerid, BILGI_MESAJ, "Ba�vurular� kapad�n�z.");
    } else {
        SetSVarInt("BasvuruDurum", 1);
        Mesaj(playerid, BILGI_MESAJ, "Ba�vurular� a�t�n�z.");
    }
    return 1;
}

Dialog:BasvuruDialog_1(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		Dialog_Show(playerid, BasvuruDialog_2, DIALOG_STYLE_MSGBOX, ""C7"EIGHTBORN - "C8"Ba�vuru", "{FFFFFF}Size bir ka� soru soraca��z ve verdi�iniz cevaplar oyundaki adminlere g�nderilecek.\nE�er ba�vurunuz kabul edilirse oyuna ba�layacaks�n�z ve ba�vurunuz kabul edilmeden oyundan ��karsan�z ba�vurunuz iptal olacakt�r.", "Devam", "");
        SetPVarInt(playerid, "BasvuruYapiyor", 1);
	}
	else Kick(playerid);
	return 1;
}

Dialog:BasvuruDialog_2(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        Dialog_Show(playerid, BasvuruDialog_3, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Ba�vuru [TEST]", "{FFFFFF}Sunucumuzda belirlenen 2. derece g�venli b�lgelerden biri de�ildir?\n{B3B3B3}A) Market Caddesi\n{B3B3B3}B) Starfish\n{B3B3B3}C) Meslek B�lgeleri\n{B3B3B3}D) Santa Maria Sahili\n{B3B3B3}E) Pizza Stack ve �evresi", "Devam", "");
	}
    return 1;
}

Dialog:BasvuruDialog_3(playerid, response, listitem, inputtext[])
{
    if(response)
    {
		if(listitem == 0) return Dialog_Show(playerid, BasvuruDialog_3, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Ba�vuru [TEST]", "{FFFFFF}Sunucumuzda belirlenen 2. derece g�venli b�lgelerden biri de�ildir?\n{B3B3B3}A) Market Caddesi\n{B3B3B3}B) Starfish\n{B3B3B3}C) Meslek B�lgeleri\n{B3B3B3}D) Santa Maria Sahili\n{B3B3B3}E) Pizza Stack ve �evresi", "Devam", "");
        if(listitem == 5) SetPVarString(playerid, "Soru1", "Do�ru");
		else SetPVarString(playerid, "Soru1", "Yanl��");
        Dialog_Show(playerid, BasvuruDialog_4, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Ba�vuru [TEST]", "{FFFFFF}A�a��dakilerden hangisi kar�� taraf silah �ekti�inde emotesiz ��karabilece�iniz silah de�ildir?\n{B3B3B3}A) Shotgun\n{B3B3B3}B) Deagle\n{B3B3B3}C) Tec-9\n{B3B3B3}D) Uzi\n{B3B3B3}E) Pistol", "Devam", "");
    }
    return 1;
}

Dialog:BasvuruDialog_4(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        if(listitem == 0) return Dialog_Show(playerid, BasvuruDialog_4, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Ba�vuru [TEST]", "{FFFFFF}A�a��dakilerden hangisi kar�� taraf silah ��kartt���nda emotesiz ��karabilece�iniz bir silah de�ildir?\n{B3B3B3}A) Shotgun\n{B3B3B3}B) Deagle\n{B3B3B3}C) Tec-9\n{B3B3B3}D) Uzi\n{B3B3B3}E) Pistol", "Devam", "");
		if(listitem == 1) SetPVarString(playerid, "Soru2", "Do�ru");
		else SetPVarString(playerid, "Soru2", "Yanl��");
        Dialog_Show(playerid, BasvuruDialog_5, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Ba�vuru [TEST]", "{FFFFFF}Sunucumuzda gasp rol� yapabilmek ka� seviye gereklidir ve maksimum ne kadar para alabilirsiniz?\n{B3B3B3}A) Seviye: 1 - Para: 500$\n{B3B3B3}B) Seviye: 2 - Para: Y�zde 5\n{B3B3B3}C) Seviye: 1 - Para: 1000$\n{B3B3B3}D) Seviye: 2 - Para: Y�zde 5\n{B3B3B3}E) Seviye: 3 - Para: Y�zde 10", "Devam", "");
    }
    return 1;
}

Dialog:BasvuruDialog_5(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        if(listitem == 0) return Dialog_Show(playerid, BasvuruDialog_5, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Ba�vuru [TEST]", "{FFFFFF}Sunucumuzda gasp rol� yapabilmek ka� seviye gereklidir ve maksimum ne kadar para alabilirsiniz?\n{B3B3B3}A) Seviye: 1 - Para: 500$\n{B3B3B3}B) Seviye: 2 - Para: Y�zde 5\n{B3B3B3}C) Seviye: 1 - Para: 1000$\n{B3B3B3}D) Seviye: 2 - Para: Y�zde 5\n{B3B3B3}E) Seviye: 3 - Para: Y�zde 10", "Devam", "");
		if(listitem == 5) SetPVarString(playerid, "Soru3", "Do�ru");
        else SetPVarString(playerid, "Soru3", "Yanl��");
		/*new sorusay = 0;
		new mstring[16];
		GetPVarString(playerid, "Soru1", mstring, 16);
		if(Buysa(mstring, "Do�ru")) sorusay++;
		GetPVarString(playerid, "Soru2", mstring, 16);
		if(Buysa(mstring, "Do�ru")) sorusay++;
		GetPVarString(playerid, "Soru3", mstring, 16);
		if(Buysa(mstring, "Do�ru")) sorusay++;
		if(sorusay >= 2) {
		    SendClientMessage(playerid, -1, "{B3B3B3}[BA�VURU] {FFFFFF}Testi ba�ar�yla ge�tiniz.");
	    	SetPVarInt(playerid, "Basvuru", 0);
			ShowPlayerDialog(playerid, 274, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Kay�t", "{FFFFFF}Sunucuda kullanaca��n�z �ifreyi girin:", "Tamam" , "");
		}
		else {
            SendClientMessage(playerid, -1, "{B3B3B3}[BA�VURU] {FFFFFF}L�tfen kurallar� tekrar g�zden ge�irin.");
		    SetPVarInt(playerid, "Basvuru", 0);
	        KickEx(playerid);
		}*/
    	Dialog_Show(playerid, BasvuruDialog_6, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Ba�vuru [INPUT]", "{FFFFFF}Sunucumuzda izleyece�iniz rol� k�saca anlat�n.", "Devam", "");
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
	    SendClientMessage(playerid, -1, ""C2"[BA�VURU] "C1"Ba�vurunuz online yetkililere g�nderilmi�tir, l�tfen ba�vurunuzun onaylanmas�n� bekleyin.");
        foreach(new i : Player) {
            if(GetPlayerAdminLevel(i) >= 1 || GetPlayerHelperLevel(i) >= 2) 
                SendClientMessage(i, -1, ""C2"[BA�VURU] Ba�vuru geldi. /basvurular");
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
	    SendClientMessageEx(playerid, -1, "{B3B3B3}[BA�VURU] {FFFFFF}%s oyuncunun ba�vurusunu kabul ettiniz.", OyuncuAdiniBul(pID));
	    SendClientMessage(pID, -1, "{B3B3B3}[BA�VURU] {FFFFFF}Ba�vurunuz kabul edildi.");
	    SetPVarInt(pID, "Basvuru", 0);
		Dialog_Show(pID, BasvuruDialog_8, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Kay�t", "{FFFFFF}Sunucuda kullanaca��n�z �ifreyi girin:", "Tamam" , "");
	}
	else
	{
	    new pID = GetPVarInt(playerid, "BasvuruBakiyor");
	    if(GetPVarInt(pID, "Basvuru") == 0) return 1;
	    SendClientMessageEx(playerid, -1, "{B3B3B3}[BA�VURU] {FFFFFF}%s oyuncunun ba�vurusunu reddettiniz.", OyuncuAdiniBul(pID));
	    SendClientMessage(pID, -1, "{B3B3B3}[BA�VURU] {FFFFFF}Ba�vurunuz reddedildi.");
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
        SendClientMessage(playerid, -1, "{B3B3B3}[KAYIT] {FFFFFF}Ba�ar�yla kay�t oldunuz l�tfen sunucuya tekrar giri� yap�n.");
        KickEx(playerid);
    }
    return 1;
}

CMD:basvurular(playerid)
{
	if(!IsPlayerLoggedIn(playerid) || (GetPlayerAdminLevel(playerid) < 1 && GetPlayerHelperLevel(playerid) < 2)) return 1;
	SendClientMessage(playerid, -1, "_________________Ba�vurular________________ (/basvurubak)");
	foreach(new i : Player)
	{
	    if(GetPVarInt(i, "Basvuru") == 1) SendClientMessageEx(playerid, -1, ""C2"[BA�VURU] "C1"Isim: "C2"%s "C1"ba�vuruID: "C2"%d",OyuncuAdiniBul(i), i);
	}
	return 1;
}

CMD:basvurubak(playerid, params[])
{
    if(!IsPlayerLoggedIn(playerid) || (GetPlayerAdminLevel(playerid) < 1 && GetPlayerHelperLevel(playerid) < 2)) return 1;
	new pID;
	if(sscanf(params,"u",pID)) return Mesaj(playerid, KULLANIM_MESAJ, "/basvurubak [oyuncuID]");
	if(!IsPlayerConnected(pID) || GetPVarInt(pID, "Basvuru") == 0) return Mesaj(playerid, HATA_MESAJ, "Hatal� oyuncuid belirttiniz.");
	new string[256], sorular[3][7], rol[128];
	GetPVarString(pID, "Soru1", sorular[0], 7);
	GetPVarString(pID, "Soru2", sorular[1], 7);
	GetPVarString(pID, "Soru3", sorular[2], 7);
	GetPVarString(pID, "Rol", rol, sizeof(rol));
	format(string, sizeof(string), ""C1"%s(%d)", OyuncuAdiniBul(pID), pID);
	format(string, sizeof(string), "%s\n"C1"Soru 1:\t\t"C2" %s", string, sorular[0]);
	format(string, sizeof(string), "%s\n"C1"Soru 2:\t\t"C2" %s", string, sorular[1]);
	format(string, sizeof(string), "%s\n"C1"Soru 3:\t\t"C2" %s", string, sorular[2]);
	format(string, sizeof(string), "%s\n"C1"�zleyece�i Rol:", string);
	format(string, sizeof(string), "%s\n"C2"%s", string, rol);
	SetPVarInt(playerid, "BasvuruBakiyor", pID);
	Dialog_Show(playerid, BasvuruDialog_7, DIALOG_STYLE_MSGBOX, ""C7"EIGHTBORN - "C8"Ba�vuru", string, "Kabul Et", "Reddet");
	return 1;
}