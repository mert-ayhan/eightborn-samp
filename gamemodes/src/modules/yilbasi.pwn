CMD:ayilbasi(playerid)
{
	if(!IsPlayerLoggedIn(playerid) || GetPlayerAdminLevel(playerid) < 5 || !IsAdminLoggedIn(playerid)) return 1;
	switch(GetSVarInt("YilbasiDurum"))
	{
	    case 0:
	    {
	        SetSVarInt("YilbasiDurum", 1);
	        Mesaj(playerid, BILGI_MESAJ, "�uan oyuncular y�lba�� ba�ar�m�n� kazanabilir.");
	    }
	    case 1:
	    {
	        SetSVarInt("YilbasiDurum", 0);
	        Mesaj(playerid, BILGI_MESAJ, "�uan oyuncular y�lba�� ba�ar�m�n� kazanamaz.");
	    }
	}
	return 1;
}

CMD:yilbasi(playerid)
{
	if(!IsPlayerLoggedIn(playerid)) return 1;
	if(!GetSVarInt("YilbasiDurum")) return Mesaj(playerid, HATA_MESAJ, "�uan y�lba�� ba�ar�m�n� kazanamazs�n�z.");
	if(YilbasiKontrol(playerid)) return Mesaj(playerid, HATA_MESAJ, "Zaten y�lba�� ba�ar�m� kazanm��s�n�z.");
    if(!strcmp(Karakter[playerid][nick], "Yok")) return Mesaj(playerid, HATA_MESAJ, "Y�lba�� ba�ar�m�n� kazanmak i�in forum hesab�n�z� ba�lay�n.");
	Mesaj(playerid, BILGI_MESAJ, "Y�lba�� ba�ar�m�n� kazand�n�z.");
	static query[128];
    format(query, sizeof(query), "INSERT INTO `hesaplar` (`forumnick`,`yilbasi`) VALUES ('%s','1') ON DUPLICATE KEY UPDATE `yilbasi` = '1'", Karakter[playerid][nick]);
    mysql_tquery(1,query);
	return 1;
}

static YilbasiKontrol(playerid)
{
	static query[128], YilbasiDurum = 0;
    format(query, sizeof(query), "SELECT `yilbasi` FROM `hesaplar` WHERE `forumnick` = '%s'", Karakter[playerid][nick]);
    new Cache:cache = mysql_query(query,true);
	if(!cache_get_row_count())
	{
		cache_delete(cache);
		return 0;
	}
	YilbasiDurum = cache_get_row_int(0, 0);
	cache_delete(cache);
    return YilbasiDurum;
}