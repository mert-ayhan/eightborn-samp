CMD:hesapla(playerid, params[]) {
	if(!Girdi[playerid]) return 1;
	if(isnull(params)) return Kullanim(playerid, "/hesapla [iþlem]");
	new string[128];
	format(string, sizeof(string), "%s", params);
	new s_string[8] = "";
	new array[16][8];
	for(new i=0;i<strlen(string);i++) {
		if(string[i] != '+' && string[i] != '-' && string[i] != '*' && string[i] != '/') {
			format(s_string, 8, "%s%c", s_string, string[i]);
			if(i == strlen(string)-1) {
				for(new j=0;j<sizeof(array);j++) {
					if(isnull(array[j])) {
					    format(array[j], 8, "%s", s_string);
						format(s_string, 8, "");
					    break;
					}
				}
			}
		} else {
			for(new j=0;j<sizeof(array);j++) {
				if(isnull(array[j])) {
				    format(array[j], 8, "%s", s_string);
					format(s_string, 8, "");
					format(array[j+1], 8, "%c", string[i]);
				    break;
				}
			}
		}
	}
	do {
		for(new i=0;!isnull(array[i]);i++) {
			if(strfind(array[i], "/") != -1) {
      			for(new j=0;!isnull(array[j]);j++) {
					if(!strcmp(array[j],"/")) {
			   			new temp_result = strval(array[j-1]) / strval(array[j+1]);
						format(array[j-1], 8, "%d", temp_result);
						for(new k=i;!isnull(array[k]);k++) {
							array[k] = array[k+2];
						}
						break;
					}
				}
				break;
			}
		}
		for(new i=0;!isnull(array[i]);i++) {
			if(strfind(array[i], "*") != -1) {
				for(new j=0;!isnull(array[j]);j++) {
					if(!strcmp(array[j],"*")) {
			   			new temp_result = strval(array[j-1]) * strval(array[j+1]);
						format(array[j-1], 8, "%d", temp_result);
						for(new k=i;!isnull(array[k]);k++) {
							array[k] = array[k+2];
						}
						break;
					}
				}
				break;
			}
		}
	 	for(new i=0;!isnull(array[i]);i++) {
			if(strfind(array[i], "-") != -1) {
				for(new j=0;!isnull(array[j]);j++) {
					if(!strcmp(array[j],"-")) {
			   			new temp_result = strval(array[j-1]) - strval(array[j+1]);
						format(array[j-1], 8, "%d", temp_result);
						for(new k=i;!isnull(array[k]);k++) {
							array[k] = array[k+2];
						}
						break;
					}
				}
				break;
			}
		}
		for(new i=0;!isnull(array[i]);i++) {
			if(strfind(array[i], "+") != -1) {
				for(new j=0;!isnull(array[j]);j++) {
					if(!strcmp(array[j],"+")) {
						new temp_result = strval(array[j-1]) + strval(array[j+1]);
						format(array[j-1], 8, "%d", temp_result);
						for(new k=i;!isnull(array[k]);k++) {
							array[k] = array[k+2];
						}
						break;
					}
				}
				break;
			}
		}
	} while(!isnull(array[1]));
	Mesaj(playerid, BILGI_MESAJ, "[HESAP MAKÝNESÝ] {FFFFFF}%s = %d", params, strval(array[0]));
	return 1;
}