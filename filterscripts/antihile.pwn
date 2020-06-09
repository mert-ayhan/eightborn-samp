#include <a_samp>
#include <socket>
#include <strlib>

#define SOCKET_PORT 7776
#define VERSION "v 1.0.4"

new Socket:gSocket;
new ConnectionAllowedIPS[MAX_PLAYERS+50][16];
new playerIP[MAX_PLAYERS][16];

public OnFilterScriptInit()
{
	printf("\t[AC] Anti Hile Kontrolü Yüklendi! %s", VERSION);
	gSocket = socket_create(TCP);
    if(is_socket_valid(gSocket)) {
		socket_set_max_connections(gSocket, sizeof(ConnectionAllowedIPS));
		if(socket_listen(gSocket, SOCKET_PORT) == 0) {
			SetTimer("relistenServerSockets", 10000, false);
		}
		printf("BASARILI! - Socket baglantisi saglandi!");
	} else {
		printf("HATA! - Socket baglantisi saglanamadi!");
	}
	
	for(new i = 0; i < sizeof(ConnectionAllowedIPS); i++) {
        ConnectionAllowedIPS[i] = "0.0.0.0";
	}
	return 1;
}

forward CloseSocketConnection();
public CloseSocketConnection()
{
    if(is_socket_valid(gSocket)) {
        socket_stop_listen(gSocket);
        socket_destroy(gSocket);
 	}
    return 1;
}

public OnFilterScriptExit()
{
	if(is_socket_valid(gSocket)) {
		socket_stop_listen(gSocket);
        socket_destroy(gSocket);
 	}
	return 1;
}

public onSocketReceiveData(Socket:id, remote_clientid, data[], data_len) {
	new newData[3][64];
	strexplode(newData, data, "|");
	if(isequal(newData[0], "101")) {
		strtrim(newData[1]);
		strtrim(newData[2]);
		if(isequal(newData[2], VERSION) && !IsIPAllowed(newData[1])) {
		    for(new i = 0; i < sizeof(ConnectionAllowedIPS); i++) {
				if(isequal(ConnectionAllowedIPS[i], "0.0.0.0")) {
	                format(ConnectionAllowedIPS[i], 16, "%s", newData[1]);
	                printf("\t[AC] %s IP Listesine Eklendi!",newData[1]);
	                break;
				}
			}
		}
	}
	return 1;
}

public OnPlayerConnect(playerid) {
	new playerName[MAX_PLAYER_NAME+1];
	GetPlayerName(playerid, playerName, sizeof(playerName));
	GetPlayerIp(playerid, playerIP[playerid], 16);
	new canConnect = IsPlayerIPAllowed(playerid);
	if(!canConnect) {
	    SendClientMessage(playerid, -1, "{FF8A0D}[E-RP] {F9F9F9}Sunucuya giriþ yapabilmek için anti hileyi açmanýz gerekiyor!");
	    SendClientMessage(playerid, -1, "{FF8A0D}[E-RP] {F9F9F9}Anti hileniz mevcutsa ve oyuna giriþte bu hatayý alýyorsanýz:");
	    SendClientMessage(playerid, -1, "{FF8A0D}[E-RP] {F9F9F9}Anti hileyi programlar kýsmýndan kaldýrýp forum üzerinden yeninden indirin ve kurulum yapýn!");
	    SendClientMessage(playerid, -1, "{F9F9F9}( Anti hileyi internet sitemizden indirebilirsiniz {FF8A0D} www.eightbornrpg.com {F9F9F9})");
	    SetTimerEx("KickEx", 500, false, "i", playerid);
	}
	return 1;
}

public OnPlayerDisconnect(playerid) {
	for(new i = 0; i < sizeof(ConnectionAllowedIPS); i++) {
        if(isequal(ConnectionAllowedIPS[i], playerIP[playerid])) {
			ConnectionAllowedIPS[i] = "0.0.0.0";
			printf("\t[AC] %s IP Listesinden Çýkarýldý!",playerIP[playerid]);
			break;
		}
	}
	return 1;
}

forward KickEx(playerid);
public KickEx(playerid) {
	Kick(playerid);
}

forward relistenServerSockets();
public relistenServerSockets()
{
    socket_listen(gSocket, SOCKET_PORT);
}

IsPlayerIPAllowed(playerid) {
	new canConnect = false;
	for(new i = 0; i < sizeof(ConnectionAllowedIPS); i++) {
        if(isequal(ConnectionAllowedIPS[i], playerIP[playerid])) {
			canConnect = true;
			break;
		}
	}
	return canConnect;
}

IsIPAllowed(IP[]) {
	new canConnect = false;
	for(new i = 0; i < sizeof(ConnectionAllowedIPS); i++) {
        if(isequal(ConnectionAllowedIPS[i], IP)) {
			canConnect = true;
			break;
		}
	}
	return canConnect;
}
