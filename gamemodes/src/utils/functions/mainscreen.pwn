#include <YSI_Coding\y_hooks>

new Text:Login[1];

hook OnGameModeInit() { 
    Login[0] = TextDrawCreate(-0.666635, -3.044439, "mdl-2002:menu");
	TextDrawLetterSize(Login[0], 0.000000, 0.000000);
	TextDrawTextSize(Login[0], 642.000000, 454.000000);
	TextDrawAlignment(Login[0], 1);
	TextDrawColor(Login[0], -1);
	TextDrawSetShadow(Login[0], 0);
	TextDrawSetOutline(Login[0], 0);
	TextDrawBackgroundColor(Login[0], 255);
	TextDrawFont(Login[0], 4);
	TextDrawSetProportional(Login[0], 0);
	TextDrawSetShadow(Login[0], 0);
}

ShowMainScreen(playerid) {
    new randomekran = random(1);
	switch(randomekran)
	{
		case 0: TextDrawShowForPlayer(playerid, Login[0]);
	}
}

HideMainScreen(playerid) {
    TextDrawHideForPlayer(playerid, Login[0]);
}