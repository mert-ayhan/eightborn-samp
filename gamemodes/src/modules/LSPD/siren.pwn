#include <YSI_Coding\y_hooks>

enum _vehDat
{
	_vehModel,
    Float:_attPos
}

new attInfo[212][_vehDat] =
{
		{400, 0.85},
       	{401, 0.8},
        {402, 0.79},
        {403, 2.15},
        {404, -1.0},
        {405, 0.73},
        {406, -1.0},
        {407, -1.0},
        {408, -1.0},
        {409, 0.8},
        {410, 0.899999},
        {411, 0.699999},
        {412, 0.699999},
        {413, 1.149999},
        {414, 2.4},
        {415, 0.61},
        {416, -1.0},
        {417, -1.0},
        {418, 1.1},
        {419, 0.699999},
        {420, -1.0},
        {421, 0.699999},
        {422, -1.0},
        {423, -1.0},
        {424, -1.0},
        {425, -1.0},
        {426, 0.85},
        {427, -1.0},
        {428, 1.6},
        {429, -1.0},
        {430, -1.0},
        {431, -1.0},
        {432, -1.0},
        {433, -1.0},
        {434, 0.8},
        {435, -1.0},
        {436, 0.8},
        {437, -1.0},
        {438, -1.0},
        {439, -1.0},
        {440, 1.269999},
        {441, -1.0},
        {442, 0.92},
        {443, -1.0},
        {444, -1.0},
        {445, 0.86},
        {446, -1.0},
        {447, -1.0},
        {448, -1.0},
        {449, -1.0},
        {450, -1.0},
        {451, 0.569999},
        {452, -1.0},
        {453, -1.0},
        {454, -1.0},
        {455, -1.0},
        {456, -1.0},
        {457, -1.0},
        {458, 0.759999},
        {459, -1.0},
        {460, -1.0},
        {461, -1.0},
        {462, -1.0},
        {463, -1.0},
        {464, -1.0},
        {465, -1.0},
        {466, 0.86},
        {467, 0.86},
        {468, -1.0},
        {469, -1.0},
        {470, 1.1},
        {471, -1.0},
        {472, -1.0},
        {473, -1.0},
        {474, 0.839999},
        {475, 0.699999},
        {476, -1.0},
        {477, 0.699999},
        {478, -1.0},
        {479, 1.0},
        {480, -1.0},
        {481, -1.0},
        {482, 1.0},
        {483, 1.049999},
        {484, -1.0},
        {485, -1.0},
        {486, -1.0},
        {487, -1.0},
        {488, -1.0},
        {489, 1.1},
        {490, -1.0},
        {491, 0.699999},
        {492, 0.87},
        {493, -1.0},
        {494, 0.74},
        {495, 1.039999},
        {496, 0.839999},
        {497, -1.0},
        {498, -1.0},
        {499, -1.0},
        {500, 1.0},
        {501, -1.0},
        {502, -1.0},
        {503, -1.0},
        {504, 0.899999},
        {505, -1.0},
        {506, -1.0},
        {507, 0.81},
        {508, -1.0},
        {509, -1.0},
        {510, -1.0},
        {511, -1.0},
        {512, -1.0},
        {513, -1.0},
        {514, 1.549999},
        {515, 1.47},
        {516, 0.86},
        {517, 0.86},
        {518, 0.699999},
        {519, -1.0},
        {520, -1.0},
        {521, -1.0},
        {522, -1.0},
        {523, -1.0},
        {524, -1.0},
        {525, -1.0},
        {526, 0.68},
        {527, 0.85},
        {528, 1.1},
        {529, 0.92},
        {530, -1.0},
        {531, -1.0},
        {532, -1.0},
        {533, -1.0},
        {534, 0.649999},
        {535, -1.0},
        {536, -1.0},
        {537, -1.0},
        {538, -1.0},
        {539, -1.0},
        {540, 0.73},
        {541, 0.639999},
        {542, 0.85},
        {543, -1.0},
        {544, -1.0},
        {545, 0.769999},
        {546, 0.85},
        {547, 0.899999},
        {548, -1.0},
        {549, 0.709999},
        {550, 0.74},
        {551, 0.899999},
        {552, -1.0},
        {553, -1.0},
        {554, 0.894999},
        {555, -1.0},
        {556, -1.0},
        {557, -1.0},
        {558, 0.87},
        {559, 0.759999},
        {560, 0.87},
        {561, 0.87},
        {562, 0.8},
        {563, -1.0},
        {564, -1.0},
        {565, 0.699999},
        {566, 0.85},
        {567, -1.0},
        {568, -1.0},
        {569, -1.0},
        {570, -1.0},
        {571, -1.0},
        {572, -1.0},
        {573, -1.0},
        {574, -1.0},
        {575, -1.0},
        {576, 0.899999},
        {577, -1.0},
        {578, -1.0},
        {579, 1.24},
        {580, 1.059999},
        {581, -1.0},
        {582, -1.0},
        {583, -1.0},
        {584, -1.0},
        {585, 1.0},
        {586, -1.0},
        {587, 0.73},
        {588, -1.0},
        {589, 1.1},
        {590, -1.0},
        {591, -1.0},
        {592, -1.0},
        {593, -1.0},
        {594, -1.0},
        {595, -1.0},
        {596, 0.894999},
        {597, 0.894999},
        {598, 0.894999},
        {599, -1.0},
        {600, -1.0},
        {601, -1.0},
        {602, 0.709999},
        {603, 0.68},
        {604, -1.0},
        {605, -1.0},
        {606, -1.0},
        {607, -1.0},
        {608, -1.0},
        {609, -1.0},
        {610, -1.0},
        {611, -1.0}
};

enum _vehicleInfo
{
        attachObject,
        bool:useAttach
}

new vehicleInfo[MAX_VEHICLES][_vehicleInfo];

CMD:siren(playerid, params[]) {
    if(!IsPlayerLoggedIn(playerid) || GetPlayerFactionType(playerid) != LSPD) return 1;
    if(!Karakter[playerid][isbasi]) return Mesaj(playerid, HATA_MESAJ, "Ýþbaþýnda deðilsiniz.");
    if(!IsPlayerInAnyVehicle(playerid)) return Mesaj(playerid, HATA_MESAJ, "Aracýn içinde deðilsiniz.");
    new vehicleid = GetPlayerVehicleID(playerid);
    if(vehicleInfo[vehicleid][useAttach]) {
        DestroyDynamicObject(vehicleInfo[vehicleid][attachObject]);
        vehicleInfo[vehicleid][useAttach] = false;
        Streamer_Update(playerid);
		PlayerPlaySound(playerid, 1055, 0.0, 0.0, 0.0);
        return 1;
    }
    new type;
    if(sscanf(params,"d",type)) { Mesaj(playerid, KULLANIM_MESAJ, "/siren [fonksiyon]"); SendClientMessage(playerid, -1, "Geçerli fonksiyonlar: [1: tepe lambasý, 2: siren]"); return 1; }
    if(type == 1) {
        if(attInfo[GetVehicleModel(vehicleid) - 400][_attPos] != -1.0)
        {
            //new Float:vPos[3];
            //GetVehiclePos(vehicleid, vPos[0], vPos[1], vPos[2]);
            vehicleInfo[vehicleid][attachObject] =  CreateDynamicObject(18646, 10, 10, 10, 0, 0, 0);
            vehicleInfo[vehicleid][useAttach] = true;
            AttachDynamicObjectToVehicle(vehicleInfo[vehicleid][attachObject], vehicleid, -0.0, -0.39, attInfo[GetVehicleModel(vehicleid) - 400][_attPos]+ 0.1, 0.0, 0.0, 0.0);
            PlayerPlaySound(playerid, 1054, 0.0, 0.0, 0.0);
            //EditDynamicObject(playerid, vehicleInfo[vehicleid][attachObject]);
            //SetPVarInt(playerid, "SirenDuzenliyor", 1);
        }
        else
        {
            Mesaj(playerid, HATA_MESAJ, "Bu araca siren ekleyemezsiniz.");
        }
    } else if(type == 2) {
        if(attInfo[GetVehicleModel(vehicleid) - 400][_attPos] != -1.0)
        {               
            vehicleInfo[vehicleid][attachObject] =  CreateDynamicObject(19419, 10.0, 10.0, 10.0, 0, 0, 0);
            vehicleInfo[vehicleid][useAttach] = true;
            AttachDynamicObjectToVehicle(vehicleInfo[vehicleid][attachObject], vehicleid, -0.0, -0.39, attInfo[GetVehicleModel(vehicleid) - 400][_attPos], 0.0, 0.0, 0.0);
            PlayerPlaySound(playerid, 1054, 0.0, 0.0, 0.0);
            //EditDynamicObject(playerid, vehicleInfo[vehicleid][attachObject]);
        }
        else
        {
            Mesaj(playerid, HATA_MESAJ, "Bu araca siren ekleyemezsiniz.");
        }
    } else  { Mesaj(playerid, KULLANIM_MESAJ, "/siren [fonksiyon]"); SendClientMessage(playerid, -1, "Geçerli fonksiyonlar: [1: tepe lambasý, 2: siren]"); return 1; }
    return 1;
}

CMD:fbisiren(playerid, params[]) {
    if(!IsPlayerLoggedIn(playerid) || GetPlayerFactionType(playerid) != FBI) return 1;
    if(!IsPlayerInAnyVehicle(playerid)) return Mesaj(playerid, HATA_MESAJ, "Aracýn içinde deðilsiniz.");
    new vehicleid = GetPlayerVehicleID(playerid);
    if(vehicleInfo[vehicleid][useAttach]) {
        DestroyDynamicObject(vehicleInfo[vehicleid][attachObject]);
        vehicleInfo[vehicleid][useAttach] = false;
        Streamer_Update(playerid);
		PlayerPlaySound(playerid, 1055, 0.0, 0.0, 0.0);
        return 1;
    }
    new type;
    if(sscanf(params,"d",type)) { Mesaj(playerid, KULLANIM_MESAJ, "/fbisiren [fonksiyon]"); SendClientMessage(playerid, -1, "Geçerli fonksiyonlar: [1: tepe lambasý, 2: siren]"); return 1; }
    if(type == 1) {
        if(attInfo[GetVehicleModel(vehicleid) - 400][_attPos] != -1.0)
        {               
            vehicleInfo[vehicleid][attachObject] =  CreateDynamicObject(18646, 10.0, 10.0, 10.0, 0, 0, 0);
            vehicleInfo[vehicleid][useAttach] = true;
            AttachDynamicObjectToVehicle(vehicleInfo[vehicleid][attachObject], vehicleid, -0.0, -0.39, attInfo[GetVehicleModel(vehicleid) - 400][_attPos]+ 0.1, 0.0, 0.0, 0.0);
            PlayerPlaySound(playerid, 1054, 0.0, 0.0, 0.0);
            //EditDynamicObject(playerid, vehicleInfo[vehicleid][attachObject]);
        }
        else
        {
            Mesaj(playerid, HATA_MESAJ, "Bu araca siren ekleyemezsiniz.");
        }
    } else if(type == 2) {
        if(attInfo[GetVehicleModel(vehicleid) - 400][_attPos] != -1.0)
        {               
            vehicleInfo[vehicleid][attachObject] =  CreateDynamicObject(19419, 10.0, 10.0, 10.0, 0, 0, 0);
            vehicleInfo[vehicleid][useAttach] = true;
            AttachDynamicObjectToVehicle(vehicleInfo[vehicleid][attachObject], vehicleid, -0.0, -0.39, attInfo[GetVehicleModel(vehicleid) - 400][_attPos], 0.0, 0.0, 0.0);
            PlayerPlaySound(playerid, 1054, 0.0, 0.0, 0.0);
            //EditDynamicObject(playerid, vehicleInfo[vehicleid][attachObject]);
        }
        else
        {
            Mesaj(playerid, HATA_MESAJ, "Bu araca siren ekleyemezsiniz.");
        }
    } else  { Mesaj(playerid, KULLANIM_MESAJ, "/fbisiren [fonksiyon]"); SendClientMessage(playerid, -1, "Geçerli fonksiyonlar: [1: tepe lambasý, 2: siren]"); return 1; }
    return 1;
}

/*DEFINE_HOOK_REPLACEMENT(DynamicObject, DO);
hook OnPlayerEditDO(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz) {
    new Float:oldX, Float:oldY, Float:oldZ, Float:oldRotX, Float:oldRotY, Float:oldRotZ;
	GetObjectPos(objectid, oldX, oldY, oldZ);
	GetObjectRot(objectid, oldRotX, oldRotY, oldRotZ);
    if(response == EDIT_RESPONSE_FINAL && GetPVarInt(playerid, "SirenDuzenliyor")) {
        AttachDynamicObjectToVehicle(objectid, GetPlayerVehicleID(playerid), x-oldX, y-oldY, z-oldZ, rx, ry, rz);
    }
}

hook OnPlayerDisconnect(playerid, reason) {
    DeletePVar(playerid, "SirenDuzenliyor");
    return 1;
}*/