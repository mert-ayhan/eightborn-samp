static seaVehicles[10] = {430, 446, 452, 453, 454, 472, 473, 484, 493, 595};

IsSeaVehicle(vehicleid) {
    for(new i = 0; i < sizeof(seaVehicles); i++) {
        if(GetVehicleModel(vehicleid) == seaVehicles[i])
            return 1;
    }
    return 0;
}
