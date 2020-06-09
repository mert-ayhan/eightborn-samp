#include <YSI_Coding\y_hooks>

enum AltKarakterlerEnum{SQLid, Sifre[128], KarakterIsim[MAX_PLAYER_NAME+1], Seviye, Yas, Dil, Cinsiyet, Skin};
static AltKarakterler[MAX_PLAYERS][3][AltKarakterlerEnum];

enum AltKarakter_TDYerEnum{Skin, Ad, Soyad, Yas, Seviye, Irk, Cinsiyet};
static AltKarakter_TDYer[3][AltKarakter_TDYerEnum] = {
	{0,   2,  3,  6,  4,  7,  5},
	{8,  10, 11, 14, 12, 15, 13},
	{16, 18, 19, 22, 20, 23, 21}
};

new Text:AltKarakter_TD[5];
new PlayerText:AltKarakter_PTD[MAX_PLAYERS][8*3];

new TimerGirisKontrol[MAX_PLAYERS] = -1;

hook OnGameModeInit()
{
    AltKarakter_TD[0] = TextDrawCreate(-1.666664, -2.629656, "mdl-2021:arkaplan");
	TextDrawTextSize(AltKarakter_TD[0], 644.000000, 451.000000);
	TextDrawAlignment(AltKarakter_TD[0], 1);
	TextDrawColor(AltKarakter_TD[0], -1);
	TextDrawSetShadow(AltKarakter_TD[0], 0);
	TextDrawBackgroundColor(AltKarakter_TD[0], 255);
	TextDrawFont(AltKarakter_TD[0], 4);
	TextDrawSetProportional(AltKarakter_TD[0], 0);

	AltKarakter_TD[1] = TextDrawCreate(112.666702, 155.829589+30, "mdl-2021:kutular");
	TextDrawTextSize(AltKarakter_TD[1], 98.000000, 92.000000);
	TextDrawAlignment(AltKarakter_TD[1], 1);
	TextDrawColor(AltKarakter_TD[1], -1);
	TextDrawSetShadow(AltKarakter_TD[1], 0);
	TextDrawBackgroundColor(AltKarakter_TD[1], 255);
	TextDrawFont(AltKarakter_TD[1], 4);
	TextDrawSetProportional(AltKarakter_TD[1], 0);

	AltKarakter_TD[2] = TextDrawCreate(112.666702+150, 155.829589+30, "mdl-2021:kutular");
	TextDrawTextSize(AltKarakter_TD[2], 98.000000, 92.000000);
	TextDrawAlignment(AltKarakter_TD[2], 1);
	TextDrawColor(AltKarakter_TD[2], -1);
	TextDrawSetShadow(AltKarakter_TD[2], 0);
	TextDrawBackgroundColor(AltKarakter_TD[2], 255);
	TextDrawFont(AltKarakter_TD[2], 4);
	TextDrawSetProportional(AltKarakter_TD[2], 0);

	AltKarakter_TD[3] = TextDrawCreate(112.666702+300, 155.829589+30, "mdl-2021:kutular");
	TextDrawTextSize(AltKarakter_TD[3], 98.000000, 92.000000);
	TextDrawAlignment(AltKarakter_TD[3], 1);
	TextDrawColor(AltKarakter_TD[3], -1);
	TextDrawSetShadow(AltKarakter_TD[3], 0);
	TextDrawBackgroundColor(AltKarakter_TD[3], 255);
	TextDrawFont(AltKarakter_TD[3], 4);
	TextDrawSetProportional(AltKarakter_TD[3], 0);

	AltKarakter_TD[4] = TextDrawCreate(139.333389+300, 83.651893+30, "mdl-2021:kilitli");
	TextDrawTextSize(AltKarakter_TD[4], 42.000000, 62.000000);
	TextDrawAlignment(AltKarakter_TD[4], 1);
	TextDrawColor(AltKarakter_TD[4], -1);
	TextDrawSetShadow(AltKarakter_TD[4], 0);
	TextDrawBackgroundColor(AltKarakter_TD[4], 255);
	TextDrawFont(AltKarakter_TD[4], 4);
	TextDrawSetProportional(AltKarakter_TD[4], 0);
	
	return 1;
}

hook OnPlayerConnect(playerid)
{	
	AltKarakter_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 75.000030, 62.081466+30, "");
	PlayerTextDrawTextSize(playerid, AltKarakter_PTD[playerid][0], 100.000000, 99.000000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][0], -256);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][0], 5);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][0], 0);
	PlayerTextDrawSetPreviewModel(playerid, AltKarakter_PTD[playerid][0], 20001);
	PlayerTextDrawSetPreviewRot(playerid, AltKarakter_PTD[playerid][0], 0.000000, 0.000000, 15.000000, 1.000000);

	AltKarakter_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 111.999992, 251.236953+30, "mdl-2021:oyna");
	PlayerTextDrawTextSize(playerid, AltKarakter_PTD[playerid][1], 100.000000, 53.000000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, AltKarakter_PTD[playerid][1], true);

	AltKarakter_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 151.000091, 112.014801+30, "Michael");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][2], 0.400000, 1.600000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][2], -10092289);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][2], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][2], 1);

	AltKarakter_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 158.333312, 128.607360+30, "Denron");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][3], 0.400000, 1.600000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][3], -10092289);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][3], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][3], 1);

	AltKarakter_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 176.000167, 158.888931+30, "30");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][4], 0.300000, 1.500000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][4], 1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][4], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][4], 3);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][4], 1);

	AltKarakter_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 169.333389, 184.192565+30, "Erkek");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][5], 0.300999, 1.313778);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][5], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][5], 1);

	AltKarakter_PTD[playerid][6] = CreatePlayerTextDraw(playerid, 176.333419, 206.592544+30, "24");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][6], 0.300000, 1.500000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][6], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][6], 1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][6], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][6], 3);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][6], 1);

	AltKarakter_PTD[playerid][7] = CreatePlayerTextDraw(playerid, 163.000106, 231.481414+30, "Amerikan");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][7], 0.272666, 1.268149);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][7], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][7], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][7], 1);
	
	AltKarakter_PTD[playerid][8] = CreatePlayerTextDraw(playerid, 75.000030+150, 62.081466+30, "");
	PlayerTextDrawTextSize(playerid, AltKarakter_PTD[playerid][8], 100.000000, 99.000000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][8], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][8], -256);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][8], 5);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][8], 0);
	PlayerTextDrawSetPreviewModel(playerid, AltKarakter_PTD[playerid][8], 20001);
	PlayerTextDrawSetPreviewRot(playerid, AltKarakter_PTD[playerid][8], 0.000000, 0.000000, 15.000000, 1.000000);

	AltKarakter_PTD[playerid][9] = CreatePlayerTextDraw(playerid, 111.999992+150, 251.236953+30, "mdl-2021:oyna");
	PlayerTextDrawTextSize(playerid, AltKarakter_PTD[playerid][9], 100.000000, 53.000000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][9], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][9], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][9], 4);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][9], 0);
	PlayerTextDrawSetSelectable(playerid, AltKarakter_PTD[playerid][9], true);

	AltKarakter_PTD[playerid][10] = CreatePlayerTextDraw(playerid, 151.000091+150, 112.014801+30, "Michael");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][10], 0.400000, 1.600000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][10], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][10], -10092289);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][10], -1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][10], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][10], 1);

	AltKarakter_PTD[playerid][11] = CreatePlayerTextDraw(playerid, 158.333312+150, 128.607360+30, "Denron");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][11], 0.400000, 1.600000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][11], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][11], -10092289);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][11], -1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][11], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][11], 1);

	AltKarakter_PTD[playerid][12] = CreatePlayerTextDraw(playerid, 176.000167+150, 158.888931+30, "30");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][12], 0.300000, 1.500000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][12], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][12], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][12], 1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][12], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][12], 3);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][12], 1);

	AltKarakter_PTD[playerid][13] = CreatePlayerTextDraw(playerid, 169.333389+150, 184.192565+30, "Erkek");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][13], 0.300999, 1.313778);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][13], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][13], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][13], -1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][13], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][13], 1);

	AltKarakter_PTD[playerid][14] = CreatePlayerTextDraw(playerid, 176.333419+150, 206.592544+30, "24");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][14], 0.300000, 1.500000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][14], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][14], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][14], 1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][14], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][14], 3);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][14], 1);

	AltKarakter_PTD[playerid][15] = CreatePlayerTextDraw(playerid, 163.000106+150, 231.481414+30, "Amerikan");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][15], 0.272666, 1.268149);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][15], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][15], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][15], -1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][15], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][15], 1);
	
	AltKarakter_PTD[playerid][16] = CreatePlayerTextDraw(playerid, 75.000030+300, 62.081466+30, "");
	PlayerTextDrawTextSize(playerid, AltKarakter_PTD[playerid][16], 100.000000, 99.000000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][16], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][16], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][16], -256);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][16], 5);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][16], 0);
	PlayerTextDrawSetPreviewModel(playerid, AltKarakter_PTD[playerid][16], 20001);
	PlayerTextDrawSetPreviewRot(playerid, AltKarakter_PTD[playerid][16], 0.000000, 0.000000, 15.000000, 1.000000);

	AltKarakter_PTD[playerid][17] = CreatePlayerTextDraw(playerid, 111.999992+300, 251.236953+30, "mdl-2021:oyna");
	PlayerTextDrawTextSize(playerid, AltKarakter_PTD[playerid][17], 100.000000, 53.000000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][17], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][17], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][17], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][17], 4);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][17], 0);
	PlayerTextDrawSetSelectable(playerid, AltKarakter_PTD[playerid][17], true);

	AltKarakter_PTD[playerid][18] = CreatePlayerTextDraw(playerid, 151.000091+300, 112.014801+30, "Michael");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][18], 0.400000, 1.600000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][18], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][18], -10092289);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][18], -1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][18], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][18], 1);

	AltKarakter_PTD[playerid][19] = CreatePlayerTextDraw(playerid, 158.333312+300, 128.607360+30, "Denron");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][19], 0.400000, 1.600000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][19], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][19], -10092289);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][19], -1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][19], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][19], 1);

	AltKarakter_PTD[playerid][20] = CreatePlayerTextDraw(playerid, 176.000167+300, 158.888931+30, "30");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][20], 0.300000, 1.500000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][20], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][20], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][20], 1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][20], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][20], 3);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][20], 1);

	AltKarakter_PTD[playerid][21] = CreatePlayerTextDraw(playerid, 169.333389+300, 184.192565+30, "Erkek");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][21], 0.300999, 1.313778);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][21], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][21], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][21], -1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][21], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][21], 1);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][21], 1);

	AltKarakter_PTD[playerid][22] = CreatePlayerTextDraw(playerid, 176.333419+300, 206.592544+30, "24");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][22], 0.300000, 1.500000);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][22], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][22], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][22], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][22], 1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][22], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][22], 3);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][22], 1);

	AltKarakter_PTD[playerid][23] = CreatePlayerTextDraw(playerid, 163.000106+300, 231.481414+30, "Amerikan");
	PlayerTextDrawLetterSize(playerid, AltKarakter_PTD[playerid][23], 0.272666, 1.268149);
	PlayerTextDrawAlignment(playerid, AltKarakter_PTD[playerid][23], 1);
	PlayerTextDrawColor(playerid, AltKarakter_PTD[playerid][23], -1);
	PlayerTextDrawSetShadow(playerid, AltKarakter_PTD[playerid][23], 0);
	PlayerTextDrawSetOutline(playerid, AltKarakter_PTD[playerid][23], -1);
	PlayerTextDrawBackgroundColor(playerid, AltKarakter_PTD[playerid][23], 255);
	PlayerTextDrawFont(playerid, AltKarakter_PTD[playerid][23], 1);
	PlayerTextDrawSetProportional(playerid, AltKarakter_PTD[playerid][23], 1);

	for(new i = 0; i < 3; i++) {
		AltKarakterler[playerid][i][SQLid] = 0;
	}
	GetCharacters(playerid);
	return 1;
}

DEFINE_HOOK_REPLACEMENT(PlayerTextDraw, PTD);
hook OnPlayerClickPTD(playerid, PlayerText:playertextid) {
	if(playertextid == AltKarakter_PTD[playerid][1]) {
		Karakter[playerid][sqlid] = AltKarakterler[playerid][0][SQLid];
		format(Karakter[playerid][sifre], 128, "%s", AltKarakterler[playerid][0][Sifre]);
	    PlayerTextDrawSetString(playerid, AltKarakter_PTD[playerid][1], "mdl-2021:oyna1");
		TimerGirisKontrol[playerid] = SetTimerEx("GirisKontrol", 60000, false, "i", playerid);
		Dialog_Show(playerid, LoginDialog, DIALOG_STYLE_PASSWORD, ""C7"EIGHTBORN - "C8"Giriþ", "{FFFFFF}Hoþgeldiniz!\nKarakteriniz sistem tarafýndan veritabanýnda kayýtlý olarak algýlandý.\n60 saniye içerisinde giriþ yapmazsanýz otomatik olarak atýlacaksýnýz.\nGiriþ yapabilmek için lütfen þifrenizi giriniz.", "Giriþ", "Çýkýþ");
	} else if(playertextid == AltKarakter_PTD[playerid][9]) {
		Karakter[playerid][sqlid] = AltKarakterler[playerid][1][SQLid];
		if(!Karakter[playerid][sqlid]) {
			return Dialog_Show(playerid, SetCharacterName, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Alt Karakter", " \n{FFFFFF}Karakter adý girin:\n ", "Yarat", "Ýptal");
		}
		format(Karakter[playerid][sifre], 128, "%s", AltKarakterler[playerid][1][Sifre]);
		PlayerTextDrawSetString(playerid, AltKarakter_PTD[playerid][1], "mdl-2021:oyna1");
		TimerGirisKontrol[playerid] = SetTimerEx("GirisKontrol", 60000, false, "i", playerid);
		Dialog_Show(playerid, LoginDialog, DIALOG_STYLE_PASSWORD, ""C7"EIGHTBORN - "C8"Giriþ", "{FFFFFF}Hoþgeldiniz!\nKarakteriniz sistem tarafýndan veritabanýnda kayýtlý olarak algýlandý.\n60 saniye içerisinde giriþ yapmazsanýz otomatik olarak atýlacaksýnýz.\nGiriþ yapabilmek için lütfen þifrenizi giriniz.", "Giriþ", "Çýkýþ");
	} else if(playertextid == AltKarakter_PTD[playerid][17]) {
		Mesaj(playerid, HATA_MESAJ, ""NOKTA" Kilitli!");
	}
	return 1;
}

Dialog:LoginDialog(playerid, response, listitem, inputtext[])
{
	if(response)
	{
	    if(Buysa(Karakter[playerid][sifre],MD5_Hash(inputtext))) {
            static query[128];
			format(query, sizeof(query), "SELECT * FROM `karakterler` WHERE `id` = '%d' LIMIT 1", Karakter[playerid][sqlid]);
			mysql_function_query(g_iHandle, query, true, "OnQueryFinished", "dd", playerid, 1);
			Mesaj(playerid, BILGI_MESAJ, "Karakteriniz yükleniyor, lütfen bekleyin.");
		}
	    else
		{
			Dialog_Show(playerid, LoginDialog, DIALOG_STYLE_PASSWORD, ""C7"EIGHTBORN - "C8"Giriþ", "{FFFFFF}Hatalý bir þifre girdiniz!\nKarakteriniz sistem tarafýndan veritabanýnda kayýtlý olarak algýlandý.\n60 saniye içerisinde giriþ yapmazsanýz otomatik olarak atýlacaksýnýz.\nGiriþ yapabilmek için lütfen þifrenizi giriniz.", "Giriþ", "Çýkýþ");
			SetPVarInt(playerid, "GirisHakki", GetPVarInt(playerid, "GirisHakki"));
		}
	    if(GetPVarInt(playerid, "GirisHakki")== 3) Kick(playerid);
	}
	else Kick(playerid);
	return 1;
}

hook OnPlayerDisconnect(playerid, reason) {
	DeletePVar(playerid, "GirisHakki");
	return 1;
}

Dialog:SetCharacterName(playerid, response, listitem, inputtext[])
{
    if (response)
    {
		if(!_IsARPName(inputtext)) return Dialog_Show(playerid, SetCharacterName, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Alt Karakter", "{FFFFFF}Girdiðiniz ad roleplay kurallarýna uygun deðildir.\n{FFFFFF}Karakter adý girin:\n ", "Yarat", "Ýptal"); 
		if(GivePlayerSQLid(inputtext) != 0) return Dialog_Show(playerid, SetCharacterName, DIALOG_STYLE_INPUT, ""C7"EIGHTBORN - "C8"Alt Karakter", "{FFFFFF}Bu isimli karakter bulunmaktadýr.\n{FFFFFF}Karakter adý girin:\n ", "Yarat", "Ýptal"); 
		static query[256];
		format(query, sizeof(query), "INSERT INTO `karakterler` (`isim`,`sifre`,`Nickname`) VALUES ('%s','%s','%s')", inputtext, AltKarakterler[playerid][0][Sifre], GetUserNickname(playerid));
	    mysql_tquery(1, query);
	    Mesaj(playerid, BILGI_MESAJ, ""NOKTA" Baþarýyla alt karakter oluþturdunuz. Sunucuya tekrardan giriþ yapýn.");
	    defer KickTimer(playerid);
	}
    return 1;
}

timer KickTimer[100](playerid)
{
    Kick(playerid);
}

GetUserNickname(playerid)
{
	new playerName[MAX_PLAYER_NAME+1], query[256], Nickname[32] = "Yok";
	GetPlayerName(playerid, playerName, sizeof(playerName));
	mysql_format(1,query, sizeof(query), "SELECT `Nickname` FROM `karakterler` WHERE LOWER(`isim`) = LOWER('%e') AND `Nickname` != 'Yok' LIMIT 1", playerName);
	new Cache:cache = mysql_query(query,true);
	if (!cache_get_row_count())
	{
	    cache_delete(cache);
		return Nickname;
	}
	else
	{
		cache_get_row(0, 0, Nickname);
	    cache_delete(cache);
		return Nickname;
	}
}

static GetCharacters(playerid)
{
	static query[144], Nickname[32] = "Yok";
	format(Nickname, sizeof(Nickname), "%s", GetUserNickname(playerid));
	if(strcmp(Nickname,"Yok")) {
		mysql_format(1,query, sizeof(query), "SELECT * FROM `karakterler` WHERE `Nickname` = '%s' AND `kilit` = '0' ORDER BY level DESC LIMIT 3", Nickname);
		mysql_function_query(g_iHandle, query, true, "AltKarakterYukle", "d", playerid);
		return 1;
	}
	return 0;
}

function AltKarakterYukle(playerid) {
	static
	    rows,
	    fields;

	cache_get_data(rows, fields, g_iHandle);
	for (new i = 0; i < rows; i ++)
	{
		AltKarakterler[playerid][i][SQLid] = cache_get_field_content_int(i, "id");
		cache_get_field_content(i, "sifre", AltKarakterler[playerid][i][Sifre], g_iHandle, 128);
		cache_get_field_content(i, "isim", AltKarakterler[playerid][i][KarakterIsim], g_iHandle, MAX_PLAYER_NAME+1);
		AltKarakterler[playerid][i][Seviye] = cache_get_field_content_int(i, "level");
		AltKarakterler[playerid][i][Yas] = cache_get_field_content_int(i, "yas");
		AltKarakterler[playerid][i][Cinsiyet] = cache_get_field_content_int(i, "cinsiyet");
		AltKarakterler[playerid][i][Dil] = cache_get_field_content_int(i, "dil");
		AltKarakterler[playerid][i][Skin] = cache_get_field_content_int(i, "skin");
	}
	AltKarakterTDAyarla(playerid);
}

static AltKarakterTDAyarla(playerid) {
	static OyuncuAd[2][13],string[6];
	for(new i = 0; i < 3; i++) {
		if(AltKarakterler[playerid][i][SQLid] == 0) {
			PlayerTextDrawSetString(playerid, AltKarakter_PTD[playerid][AltKarakter_TDYer[i][Ad]], "Yok");
			PlayerTextDrawSetString(playerid, AltKarakter_PTD[playerid][AltKarakter_TDYer[i][Soyad]], "Yok");
			PlayerTextDrawSetString(playerid, AltKarakter_PTD[playerid][AltKarakter_TDYer[i][Yas]], "0");
			PlayerTextDrawSetString(playerid, AltKarakter_PTD[playerid][AltKarakter_TDYer[i][Seviye]], "0");
			PlayerTextDrawSetString(playerid, AltKarakter_PTD[playerid][AltKarakter_TDYer[i][Irk]], "  YOK");
			PlayerTextDrawSetString(playerid, AltKarakter_PTD[playerid][AltKarakter_TDYer[i][Cinsiyet]], "YOK");
			PlayerTextDrawSetPreviewModel(playerid,  AltKarakter_PTD[playerid][AltKarakter_TDYer[i][Skin]], 0);
		}
		else {
			strexplode(OyuncuAd, AltKarakterler[playerid][i][KarakterIsim], "_");
			PlayerTextDrawSetString(playerid, AltKarakter_PTD[playerid][AltKarakter_TDYer[i][Ad]], OyuncuAd[0]);
			PlayerTextDrawSetString(playerid, AltKarakter_PTD[playerid][AltKarakter_TDYer[i][Soyad]], OyuncuAd[1]);
			valstr(string, AltKarakterler[playerid][i][Yas]);
			PlayerTextDrawSetString(playerid, AltKarakter_PTD[playerid][AltKarakter_TDYer[i][Yas]], string);
			valstr(string, AltKarakterler[playerid][i][Seviye]);
			PlayerTextDrawSetString(playerid, AltKarakter_PTD[playerid][AltKarakter_TDYer[i][Seviye]], string);
			PlayerTextDrawSetString(playerid, AltKarakter_PTD[playerid][AltKarakter_TDYer[i][Irk]], GetUserRaceName(AltKarakterler[playerid][i][Dil]));
			PlayerTextDrawSetString(playerid, AltKarakter_PTD[playerid][AltKarakter_TDYer[i][Cinsiyet]], GetUserGenderName(AltKarakterler[playerid][i][Cinsiyet]));
			PlayerTextDrawSetPreviewModel(playerid,  AltKarakter_PTD[playerid][AltKarakter_TDYer[i][Skin]], AltKarakterler[playerid][i][Skin]);
		}
	}
}

static GetUserGenderName(gender) {
	static string[6] = "YOK";
	if(gender == CINSIYET_ERKEK) string = "ERKEK";
	else if(gender == CINSIYET_KADIN) string = "KADIN";
	return string;
}

static GetUserRaceName(race) {
	static string[12] = "  YOK";
	if(race == DIL_INGILIZCE) string = "AMERIKAN";
	else if(race == DIL_ALMANCA) string = "ALMAN";
	else if(race == DIL_ARAPCA) string =" ARAP";
	else if(race == DIL_CINCE) string = "  CIN";
	else if(race == DIL_FRANSIZCA) string = "FRANSIZ";
	else if(race == DIL_ISPANYOLCA) string = "ISPANYOL";
	else if(race == DIL_ITALYANCA) string = "ITALYAN";
	else if(race == DIL_JAPONCA) string = "JAPON";
	else if(race == DIL_RUSCA) string = "  RUS";
	else if(race == DIL_IBRANICE) string = "ISRAIL";
	else if(race == DIL_YUNANCA) string = "YUNAN";
	else if(race == DIL_ERMENICE) string = "ERMENI";
	else if(race == DIL_SLOVAKCA) string = "SLOVAK";
	else if(race == DIL_IRLANDACA) string = "IRLANDA";
	else if(race == DIL_PORTEKIZCE) string = "PORTEKIZ";
	else if(race == DIL_SIRPCA) string = " SIRP";
	else if(race == DIL_ARNAVUTCA) string = "ARNAVUT";
	return string;
}

GivePlayerSQLid(sqlplayersname[])
{
	static query[256];
	mysql_format(1,query, sizeof(query), "SELECT `id` FROM `karakterler` WHERE LOWER(`isim`) = LOWER('%e') LIMIT 1", sqlplayersname);
	new Cache:cache = mysql_query(query, true);
	if (!cache_get_row_count())
	{
	    cache_delete(cache);
		return 0;
	}
	else
	{
		static intid;
		intid = cache_get_row_int(0, 0);
	    cache_delete(cache);
		return intid;
	}
}

GetPlayerCharacterSQLid(playerid) {
	return AltKarakterler[playerid][0][SQLid];
}