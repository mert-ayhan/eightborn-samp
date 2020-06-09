static airVehicles[20] = {417, 425, 447, 460, 469, 476, 487, 488, 497, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593};

IsAirVehicle(vehicleid) {
    for(new i = 0; i < sizeof(airVehicles); i++) {
        if(GetVehicleModel(vehicleid) == airVehicles[i])
            return 1;
    }
    return 0;
}
