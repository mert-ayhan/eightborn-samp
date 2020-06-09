//-------------------------------------------------
//
// Player download redirection sample
//
// (c) 2017 SA-MP Team
//
//-------------------------------------------------

#pragma tabsize 0

#include <a_samp>
#include <core>
#include <float>
#include <strlib>

#include "../include/gl_common.inc"

new baseurl[] = "https://eightbornrpg.com/fastdl-samp-models/";
new bool:muzikcal[MAX_PLAYERS]=false;

//-------------------------------------------------

public OnPlayerRequestDownload(playerid, type, crc)
{
	new fullurl[256+1];
	new dlfilename[64+1];
	new foundfilename=0;
	
	if(!IsPlayerConnected(playerid)) return 0;
	
	if(type == DOWNLOAD_REQUEST_TEXTURE_FILE) {
		foundfilename = FindTextureFileNameFromCRC(crc,dlfilename,64);
	}
	else if(type == DOWNLOAD_REQUEST_MODEL_FILE) {
	    foundfilename = FindModelFileNameFromCRC(crc,dlfilename,64);
	}

	if(foundfilename) {
	    format(fullurl,256,"%s/%s",baseurl,dlfilename);
	    strreplace(fullurl, " ", "%20");
	    RedirectDownload(playerid,fullurl);
	}
	
	if(!muzikcal[playerid]) {
	    PlayAudioStreamForPlayer(playerid, "http://www.convertmp3.io/fetch/?video=https://youtu.be/LSwXh1Y5thY");
		for(new i; i<25; i++)
		{
		    SendClientMessage(playerid, -1, "");
		}
		SendClientMessage(playerid, -1, "{f9f9f9}[EIGHTBORN] {5cb85c}Modeller yükleniyor..");
		muzikcal[playerid] = true;
	}
	
	return 0;
}

//-------------------------------------------------
