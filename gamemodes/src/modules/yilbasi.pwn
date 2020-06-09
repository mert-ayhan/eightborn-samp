CMD:ayilbasi(playerid)
{
	if(!IsPlayerLoggedIn(playerid) || GetPlayerAdminLevel(playerid) < 5 || !IsAdminLoggedIn(playerid)) return 1;
	switch(GetSVarInt("YilbasiDurum"))
	{
	    case 0:
	    {
	        SetSVarInt("YilbasiDurum", 1);
	        Mesaj(playerid, BILGI_MESAJ, "Þuan oyuncular yýlbaþý baþarýmýný kazanabilir.");
	    }
	    case 1:
	    {
	        SetSVarInt("YilbasiDurum", 0);
	        Mesaj(playerid, BILGI_MESAJ, "Þuan oyuncular yýlbaþý baþarýmýný kazanamaz.");
	    }
	}
	return 1;
}

CMD:yilbasi(playerid)
{
	if(!IsPlayerLoggedIn(playerid)) return 1;
	if(!GetSVarInt("YilbasiDurum")) return Mesaj(playerid, HATA_MESAJ, "Þuan yýlbaþý baþarýmýný kazanamazsýnýz.");
	if(YilbasiKontrol(playerid)) return Mesaj(playerid, HATA_MESAJ, "Zaten yýlbaþý baþarýmý kazanmýþsýnýz.");
    if(!strcmp(Karakter[playerid][nick], "Yok")) return Mesaj(playerid, HATA_MESAJ, "Yýlbaþý baþarýmýný kazanmak için forum hesabýnýzý baðlayýn.");
	Mesaj(playerid, BILGI_MESAJ, "Yýlbaþý baþarýmýný kazandýnýz.");
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