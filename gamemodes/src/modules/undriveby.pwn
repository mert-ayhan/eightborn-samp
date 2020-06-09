#include <YSI_Coding\y_hooks>

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
    if(PRESSED(KEY_CROUCH) && GetPlayerState(playerid) == PLAYER_STATE_PASSENGER && GetPlayerWeapon(playerid)) {
        if(!GetPVarInt(playerid, "IsDriveby")) {
            SetPVarInt(playerid, "IsDriveby", 1);
        }
        else {
            ApplyAnimation(playerid,"PED","CAR_GETIN_RHS",4.1,0,0,0,0,1,1);
            SetPVarInt(playerid, "IsDriveby", 0);
        }
    }
    return 1;
}

hook OnPlayerDisconnect(playerid, reason) {
    DeletePVar(playerid, "IsDriveby");
    return 1;
}

hook OnPlayerUpdate(playerid) {
    if(GetPlayerState(playerid) == PLAYER_STATE_PASSENGER && GetPlayerWeapon(playerid) == WEAPON_AK47)
        SetPlayerArmedWeapon(playerid, 0);
    return 1;
}