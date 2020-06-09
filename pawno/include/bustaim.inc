/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//BustAim
//
//Trys to detect players who are using aimbot
//Detects ProAim
//
//License:Public Domain 
//Enjoy!
//
//Credits:
//Yashas
//RedShirt
//niCe
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define BustAim:: BustAim_

#if !defined BUSTAIM_MAX_VISIBLE_RANGE
	#define BUSTAIM_MAX_VISIBLE_RANGE 220
#endif
#if !defined BUSTAIM_PROAIM_ALLOWABLE_DIST
	#define BUSTAIM_PROAIM_ALLOWABLE_DIST 6
#endif
#if !defined BUSTAIM_TRIGGER_LONGRANGE
	#define BUSTAIM_TRIGGER_LONGRANGE 5
#endif
#if !defined BUSTAIM_TRIGGER_NO_MISS
	#define BUSTAIM_TRIGGER_NO_MISS 8
#endif
#if !defined BUSTAIM_TRIGGER_RANDOM_AIM
	#define BUSTAIM_TRIGGER_RANDOM_AIM 5
#endif
#if !defined BUSTAIM_TRIGGER_PROAIM
	#define BUSTAIM_TRIGGER_PROAIM 3
#endif
#define BUSTAIM_AIMBOT_PROAIM 2
#define BUSTAIM_LONG_RANGE_HITS 3
#define BUSTAIM_RANDOM_AIM 4
#define BUSTAIM_NO_MISS 5
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
forward OnPlayerUseAimbot(playerid,hitid,weaponid,type,percentage);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
static BustAim_g_ContinousShotCount[MAX_PLAYERS];
static BustAim_g_MissingAimCount[MAX_PLAYERS];
static BustAim_g_ProaimTeleCount[MAX_PLAYERS];
static BustAim_g_ShotsFired[MAX_PLAYERS];
static BustAim_g_ShotsHit[MAX_PLAYERS];

static BustAim_g_LongRangeHits[MAX_PLAYERS];
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
stock IsPlayerAimingAtPlayer(playerid,Float:x, Float:y, Float:z)
{
 if (IsPlayerAimingAt(playerid, x, y, z-0.75, 0.25)) return true;
 if (IsPlayerAimingAt(playerid, x, y, z-0.25, 0.25)) return true;
 if (IsPlayerAimingAt(playerid, x, y, z+0.25, 0.25)) return true;
 if (IsPlayerAimingAt(playerid, x, y, z+0.75, 0.25)) return true;
 return false;
}
Float:DistanceCameraTargetToLocation(Float:CamX, Float:CamY, Float:CamZ, Float:ObjX, Float:ObjY, Float:ObjZ, Float:FrX, Float:FrY, Float:FrZ)
{

	new Float:TGTDistance;

	TGTDistance = floatsqroot((CamX - ObjX) * (CamX - ObjX) + (CamY - ObjY) * (CamY - ObjY) + (CamZ - ObjZ) * (CamZ - ObjZ));

	new Float:tmpX, Float:tmpY, Float:tmpZ;

	tmpX = FrX * TGTDistance + CamX;
	tmpY = FrY * TGTDistance + CamY;
	tmpZ = FrZ * TGTDistance + CamZ;

	return floatsqroot((tmpX - ObjX) * (tmpX - ObjX) + (tmpY - ObjY) * (tmpY - ObjY) + (tmpZ - ObjZ) * (tmpZ - ObjZ));
}
stock Float:GetPointAngleToPoint(Float:x2, Float:y2, Float:X, Float:Y) {

  new Float:DX, Float:DY;
  new Float:angle;

  DX = floatabs(floatsub(x2,X));
  DY = floatabs(floatsub(y2,Y));

  if (DY == 0.0 || DX == 0.0) {
    if(DY == 0 && DX > 0) angle = 0.0;
    else if(DY == 0 && DX < 0) angle = 180.0;
    else if(DY > 0 && DX == 0) angle = 90.0;
    else if(DY < 0 && DX == 0) angle = 270.0;
    else if(DY == 0 && DX == 0) angle = 0.0;
  }
  else {
    angle = atan(DX/DY);

    if(X > x2 && Y <= y2) angle += 90.0;
    else if(X <= x2 && Y < y2) angle = floatsub(90.0, angle);
    else if(X < x2 && Y >= y2) angle -= 90.0;
    else if(X >= x2 && Y > y2) angle = floatsub(270.0, angle);
  }

  return floatadd(angle, 90.0);
}
stock GetXYInFrontOfPoint(&Float:x, &Float:y, Float:angle, Float:distance)
{
	x += (distance * floatsin(-angle, degrees));
	y += (distance * floatcos(-angle, degrees));
}
stock IsPlayerAimingAt(playerid, Float:x, Float:y, Float:z, Float:radius)
{
  	new Float:camera_x,Float:camera_y,Float:camera_z,Float:vector_x,Float:vector_y,Float:vector_z;
  	GetPlayerCameraPos(playerid, camera_x, camera_y, camera_z);
	GetPlayerCameraFrontVector(playerid, vector_x, vector_y, vector_z);

	new Float:vertical, Float:horizontal;

	switch (GetPlayerWeapon(playerid))
	{
		  case 34,35,36: {
		  if (DistanceCameraTargetToLocation(camera_x, camera_y, camera_z, x, y, z, vector_x, vector_y, vector_z) < radius) return true;
		  return false;
		  }
		  case 30,31: {vertical = 4.0; horizontal = -1.6;}
		  case 33: {vertical = 2.7; horizontal = -1.0;}
		  default: {vertical = 6.0; horizontal = -2.2;}
	}

	new Float:angle = GetPointAngleToPoint(0, 0, floatsqroot(vector_x*vector_x+vector_y*vector_y), vector_z) - 270.0;
	new Float:resize_x, Float:resize_y, Float:resize_z = floatsin(angle+vertical, degrees);
	GetXYInFrontOfPoint(resize_x, resize_y, GetPointAngleToPoint(0, 0, vector_x, vector_y)+horizontal, floatcos(angle+vertical, degrees));
	if (DistanceCameraTargetToLocation(camera_x, camera_y, camera_z, x, y, z, resize_x, resize_y, resize_z) < radius) return true;
	return false;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    BustAim_g_ShotsFired[playerid]++;
    if(hitid != INVALID_PLAYER_ID && hittype == BULLET_HIT_TYPE_PLAYER)
    {        
        BustAim_g_ShotsHit[playerid]++;
        new Float:hidX,Float:hidY,Float:hidZ;
		new Float:fOriginX, Float:fOriginY, Float:fOriginZ;
	    new Float:fHitPosX, Float:fHitPosY, Float:fHitPosZ;
	    GetPlayerPos(hitid,hidX,hidY,hidZ);
	    GetPlayerLastShotVectors(playerid, fOriginX, fOriginY, fOriginZ, fHitPosX, fHitPosY, fHitPosZ);
	    GetPlayerPos(playerid,fOriginX, fOriginY, fOriginZ);
	    new Float:dist_hid_pid = floatsqroot((hidX-fOriginX)*(hidX-fOriginX) + (hidY-fOriginY)*(hidY-fOriginY) + (hidY-fOriginY)*(hidZ-fOriginZ));
		new Float:dist_hit_pid = floatsqroot((fHitPosX-fOriginX)*(fHitPosX-fOriginX) + (fHitPosY-fOriginY)*(fHitPosY-fOriginY) + (fHitPosZ-fOriginZ)*(fHitPosZ-fOriginZ));
		new Float:hidVelocityX,Float:hidVelocityY,Float:hidVelocityZ;
		GetPlayerVelocity(hitid,hidVelocityX,hidVelocityY,hidVelocityZ);
		new Float:hitidVelocity = floatsqroot(hidVelocityX*hidVelocityX + hidVelocityY*hidVelocityY + hidVelocityZ*hidVelocityZ);

		if(hitidVelocity > 5) 	BustAim_g_ContinousShotCount[playerid]++;
		if(dist_hid_pid > BUSTAIM_MAX_VISIBLE_RANGE) {  BustAim_g_LongRangeHits[playerid]++; }
		if(!IsPlayerAimingAt(playerid,hidX,hidY,hidZ,1.2))
		{
			BustAim_g_MissingAimCount[playerid]++;
            if(GetPlayerTargetPlayer(playerid) == hitid)
	        {
				if((dist_hid_pid - dist_hit_pid) > BUSTAIM_PROAIM_ALLOWABLE_DIST)
			    {
			        if(!IsPlayerAimingAtPlayer(playerid,hidX,hidY,hidZ))	{ if(++BustAim_g_ProaimTeleCount[playerid] > BUSTAIM_TRIGGER_PROAIM) if(CallLocalFunction("OnPlayerUseAimbot","iiiii",playerid,hitid,weaponid,BUSTAIM_AIMBOT_PROAIM,100)) BustAim_g_ProaimTeleCount[playerid]=0; }
			        else	{	if(++BustAim_g_ProaimTeleCount[playerid] > BUSTAIM_TRIGGER_PROAIM)	if(CallLocalFunction("OnPlayerUseAimbot","iiiii",playerid,hitid,weaponid,BUSTAIM_AIMBOT_PROAIM,50)) BustAim_g_ProaimTeleCount[playerid]=0; }
			    }
	        }
		}
        if(BustAim_g_LongRangeHits[playerid] > BUSTAIM_TRIGGER_LONGRANGE) {	if(CallLocalFunction("OnPlayerUseAimbot","iiiii",playerid,hitid,weaponid,BUSTAIM_LONG_RANGE_HITS,50)) BustAim_g_LongRangeHits[playerid] = 0; }
        if(BustAim_g_ContinousShotCount[playerid] > BUSTAIM_TRIGGER_NO_MISS) { if(CallLocalFunction("OnPlayerUseAimbot","iiiii",playerid,hitid,weaponid,BUSTAIM_NO_MISS,30)) BustAim_g_ContinousShotCount[playerid] = 0; }
        if(BustAim_g_MissingAimCount[playerid] > BUSTAIM_TRIGGER_RANDOM_AIM) {	if(CallLocalFunction("OnPlayerUseAimbot","iiiii",playerid,hitid,weaponid,BUSTAIM_RANDOM_AIM,80)) BustAim_g_MissingAimCount[playerid] = 0; }
    }
    else BustAim_g_ContinousShotCount[playerid] = BustAim_g_MissingAimCount[playerid] = BustAim_g_LongRangeHits[playerid] = 0;
    return CallLocalFunction("BustAim_OnPlayerWeaponShot","iiiifff",playerid,weaponid,hittype,hitid,fX,fY,fZ);
}
stock BustAim::ResetPlayerProfile(playerid)
{
    BustAim_g_ShotsCount[playerid] = BustAim_g_ShotsFired[playerid] = BustAim_g_ContinousShotCount[playerid] = BustAim_g_LongRangeHits[playerid] = BustAim_g_MissingAimCount[playerid] = 0;
}
stock BustAim::GetPlayerProfile(playerid,&allshots,&hitshots,&cont_shots,&long_range_shots,&missing_aim_count)
{
	akkshots = BustAim_g_ShotsCount[playerid];
	hitshots = BustAim_g_ShotsFired[playerid];
	cont_shots = BustAim_g_ContinousShotCount[playerid];
	long_range_shots = BustAim_g_LongRangeHits[playerid];
	missing_aim_count = BustAim_g_MissingAimCount[playerid];
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#if defined _ALS_OnPlayerWeaponShot
#undef OnPlayerWeaponShot
#else
#define _ALS_OnPlayerWeaponShot
#endif

#define OnPlayerWeaponShot BustAim_OnPlayerWeaponShot
forward BustAim_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);