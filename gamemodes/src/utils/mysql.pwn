#include <YSI_Coding\y_hooks>

#define MYSQL_HOST "localhost"
#define MYSQL_USER "root"
#define MYSQL_PASS ""
#define MYSQL_DB   "samp"

stock Cache:mysql_query_(query[], bool:use_cache = false, conhandle= 1) return mysql_query(conhandle, query, use_cache);
#define mysql_query mysql_query_

new g_iHandle;

hook OnGameModeInit() {
    g_iHandle = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_DB, MYSQL_PASS);
	if (mysql_errno(g_iHandle) != 0) {
	    printf("[SQL] baðlantý hatasý! Lütfen baðlantý ayarlarýný kontrol edin...\a");
	}
	else {
		printf("[SQL] baglantisi basarili!");
		mysql_log(LOG_ERROR|LOG_WARNING);
		mysql_set_charset("latin5");
        //mysql_log(LOG_ALL);
	}
    return 1;
}