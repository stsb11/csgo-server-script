#!/bin/sh
echo
echo Brownsoft Incorporated - CSGO Auto launcher
echo -------------------------------------------
echo
gamemode=""
gametype=""

echo Step 1 - select your game type.
echo [0] - Classic casual. Best of 15 rounds. Friendly fire off, no armour available, defuse kits for all.
echo [1] - Competitive Missions. Best of 30 rounds. Friendly fire on, armour available, have to buy defuse kits.
echo [2] - Arms race. Weapons upgraded by killing opponents.
echo [3] - Demolition. Weapons change each time an opponent is killed. 
echo [4] - Deathmatch. All vs all.
echo [5] - Battle Royale
echo [6] - Guardian. Defend an area against waves of bot enemies. IMPORTANT: Only works on Dust2, Cobblestone, Bank, Office and Overpass.
echo
echo -n "Enter your game type (E.g. 0): "
read gametype

#echo [0] - DEFAULT. Classic mode. Pick your own weapons, etc.
#echo [1] - Arms race. Weapons upgraded by killing opponents.
#echo [2] - Training tutorial. Irrelevant for online play. 
#echo [3] - Custom settings, where configured. Currently a deathmatch on the training map.
#echo [4] - Guardian. Protect the objective from waves of enemies with a specified weapon. 
#echo [5] - War games. Complete the objective to win.
#echo [6] - Danger Zone. Fortnite for CS-GO. 

#echo Step 2 - select your game mode. Normally, you want this to be 0.
#echo [0] - DEFAULT. Casual. Best of 15 rounds. Friendly fire off, no armour available, defuse kits for all. 
#echo [1] - Competitive Missions. Best of 30 rounds. Friendly fire on, armour available, have to buy defuse kits. 
#echo [2] - Competitive Wingman. 2 vs 2. 
#echo [3] - Competitive Weapons expert. Each weapon can only be purchased once.
#read gamemode

if [ "$gametype" -ne "5" ]; then
echo
echo Step 2 - Select your map pack
echo [0] - Dust II only
echo [1] - 2008 maps. Only Agency works. 
echo [2] - 2007 maps. Untested. Probably not working.
echo [3] - 2006 maps Untested. Probably not working. 
echo [4] - 2005 maps. Untested. Probably not working.
echo [5] - Operation Breakout. Does not work. 
echo [6] - Active Competition maps. Inferno, Train, Mirage, Nuke, Dust II, Overpass, Vertigo. 
echo [7] - Delta. Bomb disposal maps. Mirage, Inferno, Overpass, Nuke, Train, Cache.
echo [8] - Sigma. Bomb disposal maps. Anubis, Chlorine, Vertigo, Cobblestone, Canals.
echo [9] - Reserves. Canals and cache work. Aztec and Dust not working. 
echo [10] - Hostage maps. Agency, Assault, Militia, Italy, Office. 
echo [11] - Deathmatch. 
echo [12] - Arms Race. Baggage, Lake, Lunacy, Monastery, Safehouse, Shoots, St. Marc
echo [13] - Demolition. Bank, Lake, Safehouse, Sugarcane, St. Marc, Shortdust
echo [14] - Low Gravity. Lake, Safehouse, Dizzy, Lunacy and Shoots. 
echo
echo SKIRMISH MAPS - Weapons rotated by killing opponents. CAPITALS denote non-working maps. 
echo [15] - Skirmish: Stab Stab Zap. Knives and tazers. Safehouse, Lake, Rialto, AUSTRIA. 
echo [16] - Skirmish: Flying Scoutsman. Low gravity, sniping. Lake, Safehouse, Dizzy, Lunacy and Shoots. 
echo [17] - Skirmish: Trigger Discipline. Limited ammo. AUSTRIA, Inferno, THRILL, Mirage, Dust II and LITE.
echo [18] - Skirmish: Headshots. Agency, Inferno, BLACKGOLD, Cache, Cobblestone and Nuke. 
echo [19] - Skirmish: Hunter Gathers. Nuke, Dust II, INSERTION, THRILL, Canals, Cobblestone and Train.  
echo [20] - Skirmish: Heavy Assault. Dust 2, Mirage, Overpass, Shipped and Austria.
echo [21] - Skirmish: Arms Race. Lake, Baggage, Safehouse, St Marc, Shoots, Lunacy and Monastery
echo [22] - Skirmish: Demolition. Lake, Safehouse, Sugarcane, Bank, St Marc and ShortDust.
echo
echo -n "Please enter a choice (e.g 10 for the Hostage maps): "
read userchoice
echo


mapPack="mg_hostage"
map=""
if [ "$userchoice" = "1" ]; then
    mapPack="mg_op_op08"
    map="cs_agency"
elif [ "$userchoice" = "0" ]; then
    mapPack="mg_dust247"
    map="de_dust2"
elif [ "$userchoice" = "2" ]; then
    mapPack="mg_op_07"
elif [ "$userchoice" = "3" ]; then
    mapPack="mg_op_06"
elif [ "$userchoice" = "4" ]; then
    mapPack="mg_op_05"
elif [ "$userchoice" = "5" ]; then
    mapPack="mg_op_breakout"
elif [ "$userchoice" = "6" ]; then
    mapPack="mg_active"
    map="de_overpass"
elif [ "$userchoice" = "7" ]; then
    mapPack="mg_casualdelta"
    map="de_mirage"
elif [ "$userchoice" = "8" ]; then
    mapPack="mg_casualsigma"
    map="de_chlorine"
elif [ "$userchoice" = "9" ]; then
    mapPack="mg_reserves"
    map="de_canals"
elif [ "$userchoice" = "10" ]; then
    mapPack="mg_hostage"
    map="cs_assault"
elif [ "$userchoice" = "11" ]; then
    mapPack="mg_deathmatch"
elif [ "$userchoice" = "12" ]; then
    mapPack="mg_armsrace"
    map="de_safehouse"
elif [ "$userchoice" = "13" ]; then
    mapPack="mg_demolition"
    map="de_bank"
elif [ "$userchoice" = "14" ]; then
    mapPack="mg_lowgravity"
elif [ "$userchoice" = "15" ]; then
    mapPack="mg_skirmish_stabstabzap"
elif [ "$userchoice" = "16" ]; then
    mapPack="mg_skirmish_flyingscoutsman"
elif [ "$userchoice" = "17" ]; then
    mapPack="mg_skirmish_triggerdiscipline"
elif [ "$userchoice" = "18" ]; then
    mapPack="mg_skirmish_headshots"
elif [ "$userchoice" = "19" ]; then
    mapPack="mg_skirmish_huntergatherers"
elif [ "$userchoice" = "20" ]; then
    mapPack="mg_skirmish_heavyassaultsuit"
elif [ "$userchoice" = "21" ]; then
    mapPack="mg_skirmish_armsrace"
    map="ar_baggage"
elif [ "$userchoice" = "22" ]; then
    mapPack="mg_skirmish_demolition"
    map="de_lake"
fi

fi

nobots="-nobots"
if [ $gametype = "" ]; then
    gametype="0"
    gamemode="0"
elif [ $gametype = "0" ]; then
    gametype="0"
    gamemode="0"
elif [ $gametype = "1" ]; then
    gametype="0"
    gamemode="1"
elif [ $gametype = "2" ]; then
    gametype="1"
    gamemode="0"
elif [ $gametype = "3" ]; then
    gametype="1"
    gamemode="1"
elif [ $gametype = "4" ]; then
    gametype="1"
    gamemode="2"
elif [ $gametype = "6" ]; then
    gametype="4"
    gamemode="0"
    nobots=""
fi

#if [ $gamemode = "" ]; then
#    gamemode="0"
#fi

echo Launching CS-GO with $mapPack...
echo

if [ "$map" = "" ]; then
    echo No map specified for first round.
    ./srcds_run -game csgo -console -usercon +game_type $gametype +game_mode $gamemode +mapgroup $mapPack +sv_setsteamaccount YOUR_KEY_HERE -maxplayers_override 20 -net_port_try $nobots
elif [ "$gametype" = "5" ]; then
    ./srcds_run -game csgo -console -usercon +game_type 6 +game_mode 0 +sv_dz_team_count 3 + dz_shuffle_teams +map dz_blacksite +sv_setsteamaccount YOUR_KEY_HERE -maxplayers_override 20 -net_port_try $nobots
else
    echo Starting with $map first. 
    ./srcds_run -game csgo -console -usercon +game_type $gametype +game_mode $gamemode +mapgroup $mapPack +map $map +sv_setsteamaccount YOUR_KEY_HERE -maxplayers_override 20 -net_port_try $nobots
fi
