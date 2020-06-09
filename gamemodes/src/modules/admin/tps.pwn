CMD:tps(playerid)
{
	if(!IsPlayerLoggedIn(playerid) || GetPlayerAdminLevel(playerid) < 1 || !IsAdminLoggedIn(playerid)) return 1;
	TPSGoster(playerid, 1);
	return 1;
}

TPSGoster(playerid, sayfa)
{
	if(sayfa == 1) Dialog_Show(playerid, TPSDialog_1, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Teleport", "Ýleri>>\nArea 51\nIdlewood\nGanton\nIdlegas\nGrove\nBinco\nAlhambra\nUnity Station\nSarý Hastane\nBeyaz Hastane\nJefferson Motel\nLas Colinas", "Seç", "Kapat");
	else if(sayfa == 2) Dialog_Show(playerid, TPSDialog_2, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Teleport", "Ýleri>>\nGeri<<\nEast Beach\nLiman\nVinewood\nStar Caddesi\nTemple Benzinlik\nTemple Caddesi\nGrotti\nRichman\nMullholland\nRodeo\nMarket\nVerona Mall\nStar Fish\nVerona Beach\nLS Airport\nEl Corona\nGlen Park\nPig Pen\nSanta Maria", "Seç", "Kapat");
	else if(sayfa == 3) Dialog_Show(playerid, TPSDialog_3, DIALOG_STYLE_LIST, ""C7"EIGHTBORN - "C8"Teleport", "Geri<<\nSanta Maria Giþeler\nETL News\nAngel Pine\nBlueberry\nFort Carson\nDillimore\nPalomino Creek\nMontgomery\nLas Venturas Havalimaný\nLas Venturas Social Club", "Seç", "Kapat");
}

Dialog:TPSDialog_1(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        switch(listitem)
        {
            case 0: TPSGoster(playerid, 2);
            case 1: SetPlayerPos(playerid, 213.5800,1863.9900,13.1400);
            case 2: SetPlayerPos(playerid, 2085.6519,-1765.0425,13.3939);
            case 3: SetPlayerPos(playerid, 2276.3391,-1741.3467,13.5469);
            case 4: SetPlayerPos(playerid, 1942.9052,-1760.5789,13.3828);
            case 5: SetPlayerPos(playerid, 2493.4543,-1671.3441,13.3359);
            case 6: SetPlayerPos(playerid, 2250.0168,-1657.0605,15.2834);
            case 7: SetPlayerPos(playerid, 1821.5282,-1682.4032,13.3828);
            case 8: SetPlayerPos(playerid, 1745.9878,-1854.4780,13.4141);
            case 9: SetPlayerPos(playerid, 2002.5201,-1445.5900,13.5615);
			case 10: SetPlayerPos(playerid, 1195.6749,-1324.7709,13.3984);
            case 11: SetPlayerPos(playerid, 2219.8982,-1141.3464,25.7969);
            case 12: SetPlayerPos(playerid, 2642.7495,-1070.1512,69.4531);
        }
    }
    return 1;
}

Dialog:TPSDialog_2(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        switch(listitem)
        {
            case 0: TPSGoster(playerid, 3);
            case 1: TPSGoster(playerid, 1);
            case 2: SetPlayerPos(playerid, 2881.3704,-1520.6306,11.0749);
            case 3: SetPlayerPos(playerid, 2315.5437,-2331.3821,13.3828);
            case 4: SetPlayerPos(playerid, 1422.8052,-846.6373,48.8872);
            case 5: SetPlayerPos(playerid, 1090.5967,-1144.8284,23.6563);
            case 6: SetPlayerPos(playerid, 990.0784,-931.3077,42.1797);
            case 7: SetPlayerPos(playerid, 1162.6918,-947.5692,43.0375);
            case 8: SetPlayerPos(playerid, 547.4802,-1267.2344,17.2422);
            case 9: SetPlayerPos(playerid, 304.4738,-1212.9967,75.7604);
			case 10: SetPlayerPos(playerid, 961.0637,-818.3125,96.6128);
            case 11: SetPlayerPos(playerid, 423.2009,-1469.2828,30.4063);
            case 12: SetPlayerPos(playerid, 958.3329,-1400.3340,13.2065);
            case 13: SetPlayerPos(playerid, 1129.1370,-1435.1317,15.7969);
            case 14: SetPlayerPos(playerid, 369.8339,-2043.9065,7.6719);
            case 15: SetPlayerPos(playerid, 837.5933,-1823.7123,12.2073);
            case 16: SetPlayerPos(playerid, 1664.6566,-2319.1694,13.3828);
            case 17: SetPlayerPos(playerid, 1961.9532,-2062.1545,13.3952);
            case 18: SetPlayerPos(playerid, 1970.3823,-1201.5756,25.5932);
            case 19: SetPlayerPos(playerid, 2420.1982,-1234.3525,24.4311);
            case 20: SetPlayerPos(playerid, 194.0353,-1825.4421,4.1227);
        }
    }
    return 1;
}

Dialog:TPSDialog_3(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        switch(listitem)
        {
            case 0: TPSGoster(playerid, 2);
            case 1: SetPlayerPos(playerid, 194.0353,-1825.4421,4.1227);
            case 2: SetPlayerPos(playerid, 912.6611,-993.7659,37.9901);
            case 3: SetPlayerPos(playerid, -2149.0713,-2408.5942,30.4688);
            case 4: SetPlayerPos(playerid, 62.8391,-210.2986,1.4566);
            case 5: SetPlayerPos(playerid, -69.3999,1197.7831,19.5938);
            case 6: SetPlayerPos(playerid, 681.6653,-578.6064,16.1874);
            case 7: SetPlayerPos(playerid, 2293.9976,40.8318,26.3359);
            case 8: SetPlayerPos(playerid, 1289.2483,247.5840,19.4063);
            case 9: SetPlayerPos(playerid, 1704.6399,1445.6410,10.8188);
			case 10: SetPlayerPos(playerid, 1470.1125,2773.7920,10.6719);
        }
    }
    return 1;
}