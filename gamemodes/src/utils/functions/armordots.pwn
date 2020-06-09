GetArmorDots(playerid)
{
    new
        dots[64], Float: AR;
 
    GetPlayerArmour(playerid, AR);
 
    if(AR >= 100)
        dots = "••••••••••";
    else if(AR >= 90)
        dots = "•••••••••{666666}•";
    else if(AR >= 80)
        dots = "••••••••{666666}••";
    else if(AR >= 70)
        dots = "•••••••{666666}•••";
    else if(AR >= 60)
        dots = "••••••{666666}••••";
    else if(AR >= 50)
        dots = "•••••{666666}•••••";
    else if(AR >= 40)
        dots = "••••{666666}••••••";
    else if(AR >= 30)
        dots = "•••{666666}•••••••";
    else if(AR >= 20)
        dots = "••{666666}••••••••";
    else if(AR >= 10)
        dots = "•{666666}•••••••••";
    else if(AR >= 0)
        dots = "{666666}••••••••••";
 
    return dots;
}