#include <a_samp>
#include <socket>
#include <strlib>
#include <foreach>

#define SOCKET_PORT 7779

new Socket:gSocket;

public OnFilterScriptInit()
{
	print("\tMarket Yüklendi!");
	gSocket = socket_create(TCP);
    if(is_socket_valid(gSocket)) {
		socket_set_max_connections(gSocket, 1);
		if(socket_listen(gSocket, SOCKET_PORT) == 0) {
			SetTimer("relistenServerSockets", 10000, false);
		}
		printf("BASARILI! - Socket baglantisi saglandi!");
	} else {
		printf("HATA! - Socket baglantisi saglanamadi!");
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
	strexplode(newData, data, ":");
	if(isequal(newData[0], "1")) {
		strtrim(newData[1]);
		new playerName[MAX_PLAYER_NAME+1], isOnline[6] = "false";
		foreach(Player, i) {
			GetPlayerName(i, playerName, sizeof(playerName));
			if(isequal(newData[1], playerName)) {
			    isOnline = "true";
				break;
			}
		}
		socket_sendto_remote_client(id, remote_clientid, isOnline);
	}
	else if(isequal(newData[0], "2")) {
		strtrim(newData[1]);
		new playerName[MAX_PLAYER_NAME+1];
		foreach(Player, i) {
			GetPlayerName(i, playerName, sizeof(playerName));
			if(isequal(newData[1], playerName)) {
			    CallRemoteFunction("OyuncuOzellikSifirla", "i", i);
				break;
			}
		}
		socket_sendto_remote_client(id, remote_clientid, isOnline);
	}
	return 1;
}

forward relistenServerSockets();
public relistenServerSockets()
{
    socket_listen(gSocket, SOCKET_PORT);
}
