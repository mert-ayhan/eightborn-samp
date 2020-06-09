#include <YSI\y_hooks>

hook OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	if(newinteriorid == 1 || newinteriorid == 7 || newinteriorid == 4 || newinteriorid == 6) SetTimerEx("DAMM_TMR_DisableAmmu", 1000, 0, "i", playerid);
	return 1;
}

forward DAMM_TMR_DisableAmmu(playerid);
public DAMM_TMR_DisableAmmu(playerid)
{
	if(!IsPlayerInsideInterior(playerid)) SetTimerEx("DAMM_TMR_DisableAmmu", 1000, 0, "i", playerid);
	else SetPlayerShopName(playerid, "FDPIZZA");
    return 1;
}

stock IsPlayerInsideInterior(playerid)
{
	new Float:playerpos[3];
	GetPlayerPos(playerid, playerpos[0], playerpos[1], playerpos[2]);
	if(playerpos[2] > 500) return 1; // High in the sky, they are inside an interior
	return 0;
}
