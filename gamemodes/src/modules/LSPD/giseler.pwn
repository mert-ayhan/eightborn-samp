CMD:giseler(playerid)
{
    if(!IsPlayerLoggedIn(playerid)) return 1;
    if(Birlik[Karakter[playerid][birlik]][ftip] == LSPD && Karakter[playerid][rutbe] <= 16)
    {
        new string[128];
		if(Veriler[gisedurum] == 0)
		{
		    Veriler[gisedurum] = 1;
			foreach(new i : Player)
			{
				if(Karakter[i][birlik] == Karakter[playerid][birlik])
				{
				    format(string, sizeof(string), "* LSPD: %s tarafýndan giþeler kapatýldý.", OyuncuAdiniBul(playerid));
					SendClientMessage(i, 0x0080FFFF, string);
				}
			}
		}
		else
		{
			Veriler[gisedurum] = 0;
			foreach(new i : Player)
			{
				if(Karakter[i][birlik] == Karakter[playerid][birlik])
				{
				    format(string, sizeof(string), "* LSPD: %s tarafýndan giþeler açýldý.", OyuncuAdiniBul(playerid));
					SendClientMessage(i, 0x0080FFFF, string);
				}
			}
		}
	}
	else
	{
	    Mesaj(playerid, HATA_MESAJ, "Bu komutu yalnýzca LSPD üyeleri kullanabilir.");
	}
	return 1;
}