CMD:animasyonlar(playerid, params[]) return cmd_animlist(playerid, params);
CMD:anims(playerid, params[]) return cmd_animlist(playerid, params);
CMD:animasyon(playerid, params[]) return cmd_animlist(playerid, params);
CMD:anim(playerid, params[]) return cmd_animlist(playerid, params);
CMD:animhelp(playerid, params[]) return cmd_animlist(playerid, params);
CMD:animlist(playerid, params[])
{
    if(!IsPlayerLoggedIn(playerid)) return 1;
    new type;
    if(sscanf(params,"d",type)) return Mesaj(playerid, KULLANIM_MESAJ, "/animasyonlar [1-2]");
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
        if(type == 1)
        {
           	SendClientMessage(playerid, -1, ""C13"| Animasyonlar 1 |");
		    SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /yuru, /chat, /drunk, /sit, /nisan, /bar, /fight, /yuvarlanma");
		    SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /fall , /cover, /no, /elsalla, /fuckyou, /riot, /crossarms");
		    SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /handsup, /cry, /tired, /eluzat, /robman, /vurulma, /gsign");
		    SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /kalk, /yerindesay, /blind, /dance, /elyika, /flykick, /taichi");
		    SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /vomit, /cagir, /bomb, /drink, /lean, /lay, /elkaldir, /smoke");
		    SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /kiss, /medic, /selam, /crack, /jump, /durus, /bagir, /saygi");
		    SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /kvur, /anlasma, /rap, /bat, /buddy, /carry, /swat, /otb, /shop");
        }
        else if(type == 2)
        {
       		SendClientMessage(playerid, -1, ""C13"| Animasyonlar 2 |");
		    SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /fall2, /fallback, /injured, /akick, /push, /lowbodypush, /handsup2, /bomb2, /getarrested");
		    SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /basket, /headbutt, /sprayanim, /lookout, /cellin, /cellout, /laugh, /sup");
			SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" deal, /groundsit, /fucku, /strip, /hide, /eat, /chairsit, /reload, /lcarjack1, /lcarjack2");
		    SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /koface, /kostomach, /rollfall, /carjacked1, /carjacked2, /rcarjack1, /rcarjack2");
		    SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /lifejump, /exhaust, /leftslap, /carlock, /hoodfrisked, /lightcig, /tapcig, /box, /lay2, /chant, /finger");
		    SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /shouting, /knife, /copanim, /elbow, /kneekick, /airkick, /gkick, /gpunch, /fstance, /lowthrow");
		    SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /pee, /poli, /sit, /breathless, /cross, /ped, /jiggy, /gesture, /highthrow, /aim");
		    SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /sleep, /smoke2, /chora, /relax, /crabs, /stop, /wash, /mourn, /fuck, /tosteal");
		    SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /followme, /greeting, /still, /hitch, /palmbitch, /cpranim, /giftgiving, /slap2, /pump, /cheer");
		    SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /dj, /entrenar, /foodeat, /wave, /slapass, /dealer, /dealstance, /gwalk, /inbedright, /inbedleft");
			SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /wank, /sexy, /bj, /getup, /follow, /stand, /slapped, /slapass, /yes, /celebrate, /win, /checkout");
			SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /thankyou, /invite1, /scratch, /nod, /carsmoke, /benddown, /shakehead, /angry");
			SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" /cockgun, /bar2, /liftup, /putdown, /die, /joint, /bed, /lranim");
			SendClientMessage(playerid, -1, ""C13"[ANIM]"C1" Animasyonlarý durdurmak için /clearanim komutunu kullanabilirsiniz.");
        }
    }
    return 1;
}