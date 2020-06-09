GetHealthDots(playerid)
{
    new
        dots[64], Float: HP;
 
    GetPlayerHealth(playerid, HP);
 
    if(HP >= 100)
        dots = "••••••••••";
    else if(HP >= 90)
        dots = "•••••••••{660000}•";
    else if(HP >= 80)
        dots = "••••••••{660000}••";
    else if(HP >= 70)
        dots = "•••••••{660000}•••";
    else if(HP >= 60)
        dots = "••••••{660000}••••";
    else if(HP >= 50)
        dots = "•••••{660000}•••••";
    else if(HP >= 40)
        dots = "••••{660000}••••••";
    else if(HP >= 30)
        dots = "•••{660000}•••••••";
    else if(HP >= 20)
        dots = "••{660000}••••••••";
    else if(HP >= 10)
        dots = "•{660000}•••••••••";
    else if(HP >= 0)
        dots = "{660000}••••••••••";
 
    return dots;
}