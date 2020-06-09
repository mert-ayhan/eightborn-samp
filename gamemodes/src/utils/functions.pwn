#include "src/utils/functions/main.pwn"

stock KickEx(playerid) SetTimerEx("KickExTimer", 10, false, "i", playerid);
function KickExTimer(playerid) return Kick(playerid);

stock OyuncuAdiniBul(playerid, type = 0)
{
	new string[MAX_PLAYER_NAME+1];
	if(playerid == -1 || !IsPlayerConnected(playerid))
	{
		string = "NULL";
		return string;
	}
	if(!type)
	{
  		GetPlayerName(playerid, string, sizeof(string));
	 	strreplace(string, "_", " ");
 		if(IsPlayerMasked(playerid)) format(string, sizeof(string), "Maskeli(%d)", Karakter[playerid][maskeno]);
		else if(IsPlayerFBIMasked(playerid)) format(string, sizeof(string), "Tanýnmýyor");
	}
	else if(type)
	{
	    GetPlayerName(playerid, string, sizeof(string));
	    strreplace(string, "_", " ");
	}
	return string;
}

IsPlayerNearDynamicObject(playerid, objectid, Float:range = 5.0) {

    static
        Float:fX,
        Float:fY,
        Float:fZ;

    GetDynamicObjectPos(objectid, fX, fY, fZ);

    return (IsPlayerInRangeOfPoint(playerid, range, fX, fY, fZ));
}

IsPlayerNearPlayer(playerid, targetid, Float:radius)
{
    static
        Float:fX,
        Float:fY,
        Float:fZ;

    GetPlayerPos(targetid, fX, fY, fZ);

    return (GetPlayerInterior(playerid) == GetPlayerInterior(targetid) && GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(targetid)) && IsPlayerInRangeOfPoint(playerid, radius, fX, fY, fZ);
}