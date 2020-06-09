

/*

		Spalvotø checkpoint kûrimo include/Coloured checkpoint include
		Autorius/Author "Bebras" 2014 ©
		v0.1

		Thanks to Vince from forum.sa-mp.com for the idea!
								
*/




/*

		native CreateColouredCheckpoint(Float:x,Float:y,Float:z,color);
		native DestroyColouredCheckpoint(cpid);
		native IsPlayerInAnyColouredCheckpoint(playerid);
		native IsPlayerInColouredCheckpoint(playerid,cpid);
		native ChangeColouredCheckpointColour(cpid,newcolor);
*/

#include <YSI_Coding\y_hooks>

#define CHECKPOINT_COLOUR_BLACK			1
#define CHECKPOINT_COLOUR_BLUE			2
#define CHECKPOINT_COLOUR_GREEN			3
#define CHECKPOINT_COLOUR_GREY			4
#define CHECKPOINT_COLOUR_ORANGE		5
#define CHECKPOINT_COLOUR_WHITE			6
#define CHECKPOINT_COLOUR_YELLOW		7
#define CHECKPOINT_COLOUR_RED			8

#define CHECKPOINT_COLOR_BLACK 			CHECKPOINT_COLOUR_BLACK
#define CHECKPOINT_COLOR_BLUE 			CHECKPOINT_COLOUR_BLUE
#define CHECKPOINT_COLOR_GREEN 			CHECKPOINT_COLOUR_GREEN
#define CHECKPOINT_COLOR_GREY 			CHECKPOINT_COLOUR_GREY
#define CHECKPOINT_COLOR_ORANGE 		CHECKPOINT_COLOUR_ORANGE
#define CHECKPOINT_COLOR_WHITE 			CHECKPOINT_COLOUR_WHITE 
#define CHECKPOINT_COLOR_YELLOW 		CHECKPOINT_COLOUR_YELLOW
#define CHECKPOINT_COLOR_RED	 		CHECKPOINT_COLOUR_RED

#define COLOURED_CHECKPOINT_DIAMETER	1.0
#define COLOURED_CHECKPOINT_HEIGHT		2.0

#define MAX_COLOURED_CHECKPOINTS				2000


forward OnPlayerExitColouredCheckpoint(playerid,cpid);
forward OnPlayerEnterColouredCheckpoint(playerid,cpid);

enum E_COLOURED_CHECKPOINTS {
	ObjectId,
	AreaId
};


static CCPData[MAX_COLOURED_CHECKPOINTS][E_COLOURED_CHECKPOINTS];

#if !defined _inc_streamer
	static bool:IsPlayerInCCP[MAX_PLAYERS][MAX_COLOURED_CHECKPOINTS];
#endif

stock CreateColouredCheckpoint(Float:x,Float:y,Float:z,color,virtualworld=-1,int=-1) 
{
	for(new i = 0; i < sizeof(CCPData); i++)
	{
		if(IsValidDynamicObject(CCPData[i][ObjectId])) continue;


		CCPData[i][ObjectId] = CreateDynamicObject(1317, x, y, z, 0.0, 0.0, 0.0,virtualworld,int,.streamdistance=2.0);
		SetDynamicObjectMaterial(CCPData[i][ObjectId], 0, 18646, "matcolours", CCP_GetColourName(color), CCP_GetColourARGB(color));
		CCPData[i][AreaId] = CreateDynamicCylinder(x,y,z,z + COLOURED_CHECKPOINT_HEIGHT, COLOURED_CHECKPOINT_DIAMETER,virtualworld,int);

		return i;
	}
	return -1;
}
stock DestroyColouredCheckpoint(cpid)
{
	if(-1 < cpid < MAX_COLOURED_CHECKPOINTS)
	{
		DestroyDynamicArea(CCPData[cpid][AreaId]);
		return DestroyDynamicObject(CCPData[cpid][ObjectId]);
	}
	return 0;
}

stock IsPlayerInAnyColouredCheckpoint(playerid)
{
	for(new i = 0; i < sizeof(CCPData); i++)
	{
		if(!IsValidDynamicObject(CCPData[i][ObjectId])) continue;
		if(IsPlayerInDynamicArea(playerid, CCPData[i][AreaId]))
			return true;
	}
	return false;
}
stock IsPlayerInColouredCheckpoint(playerid,cpid)
{
	if(-1 > cpid > MAX_COLOURED_CHECKPOINTS) return false;
	if(!IsValidDynamicObject(CCPData[cpid][ObjectId])) return false;
	return IsPlayerInDynamicArea(playerid, CCPData[cpid][AreaId]);
}

stock GetColouredCheckpointAreaID(cpid) {
	return CCPData[cpid][AreaId];
}

stock ChangeColouredCheckpointColour(cpid,newcolor)
{
	if(-1 > cpid > MAX_COLOURED_CHECKPOINTS) return 0;
	SetDynamicObjectMaterial(CCPData[cpid][ObjectId], 0, 18646, "matcolours", CCP_GetColourName(newcolor), CCP_GetColourARGB(newcolor));
	return 1;
}	

//////////////////////////////////////////////////////////////////////////////////////////////////
////////////						Internal STUFF 								      ////////////
//////////////////////////////////////////////////////////////////////////////////////////////////


DEFINE_HOOK_REPLACEMENT(DynamicArea, DA);
hook OnPlayerEnterDA(playerid, areaid)
{
	for(new i = 0; i < MAX_COLOURED_CHECKPOINTS; i++)
	{
		if(!IsValidDynamicObject(CCPData[i][ObjectId])) continue;
		if(CCPData[i][AreaId] != areaid) continue;
		
		OnPlayerEnterColouredCheckpoint(playerid, i);
	}
}

hook OnPlayerLeaveDA(playerid, areaid)
{
	for(new i = 0; i < sizeof(CCPData); i++)
	{
		if(!IsValidDynamicObject(CCPData[i][ObjectId])) continue;
		if(CCPData[i][AreaId] != areaid) continue;
		OnPlayerExitColouredCheckpoint(playerid, i);
	}
}

CCP_GetColourName(color)
{
	new s[7];
	switch(color)
	{
		case CHECKPOINT_COLOUR_BLACK: 		s = "black";
		case CHECKPOINT_COLOUR_BLUE: 		s = "blue";
		case CHECKPOINT_COLOUR_GREEN:		s = "green";
		case CHECKPOINT_COLOUR_GREY:		s = "grey";
		case CHECKPOINT_COLOUR_ORANGE:		s = "orange";
		case CHECKPOINT_COLOUR_WHITE:		s = "white";
		case CHECKPOINT_COLOUR_YELLOW:		s = "yellow";
		case CHECKPOINT_COLOUR_RED:			s = "red";
	}
	return s;
}
CCP_GetColourARGB(color)
{
	switch(color)
	{
		case CHECKPOINT_COLOUR_BLACK: 		return 0xAA000000;
		case CHECKPOINT_COLOUR_BLUE: 		return 0xAA0000FF;
		case CHECKPOINT_COLOUR_GREEN:		return 0xAA5CB85C;
		case CHECKPOINT_COLOUR_GREY:		return 0xAAC0C0C0;
		case CHECKPOINT_COLOUR_ORANGE:		return 0xAAFF8000;
		case CHECKPOINT_COLOUR_WHITE:		return 0xAAFFFFFF;
		case CHECKPOINT_COLOUR_YELLOW:		return 0xAAFFFF00;
		case CHECKPOINT_COLOUR_RED:			return 0xAAD9534F;
	}
	return 0;
}

HexToIntegerEx(string[])
{
  if (string[0]==0) return 0;
  new i;
  new cur=1;
  new res=0;
  for (i=strlen(string);i>0;i--)
  {
    if (string[i-1]<58) res=res+cur*(string[i-1]-48); else res=res+cur*(string[i-1]-65+10);
    cur=cur*16;
  }
  return res;
}

#pragma unused CCP_GetColourName
#pragma unused CCP_GetColourARGB
#pragma unused HexToIntegerEx
