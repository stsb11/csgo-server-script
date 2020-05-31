#!/bin/sh
echo
echo Brownsoft Incorporated - CSGO Auto launcher
echo -------------------------------------------
echo
key=`cat /home/mjs/key.txt`
gamemode=""
gametype=""

echo "Step 1 - select your game type. Default is 'Classic casual'."
echo "[0] - Classic casual. Best of 15 rounds. Friendly fire off, no armour available, defuse kits for all."
echo "[1] - Competitive Missions. Best of 30 rounds. Friendly fire on, armour available, have to buy defuse kits."
echo "[2] - Arms race. Deathmatch style. Weapons upgraded by killing opponents. Get a kill with the golden knife to win."
echo "[3] - Demolition. Weapons change next round if you kill an opponent."
echo "[4] - Deathmatch. Free-for-all lasting 3mins."
echo "[5] - Battle Royale. CS:GO's Fortnite mode - best for 10 or more players."
echo "[6] - Guardian. Defend an area against waves of bot enemies. IMPORTANT: Set this up with a Guardian-compatable single map."
echo "[7] - Weapons Expert. Each weapon can only be purchased once. Best of 20, Friendly fire on, body armour available. 5min warm-up."
echo "[8] - Wingman. FF on, armour available. Meant to be for 2vs2 on smaller maps, but can have more."
echo
echo -n "Enter your game type (E.g. 0): "
read gametype

if [ -z "$gametype" ]; then
    gametype="0"
fi

#Mystery game type 5 - War games. Complete the objective to win.

if [ "$gametype" -ne "5" ]; then
    echo ""
    echo "---------------------------------------------"
    echo ""
    echo "Step 2 - Select your map pack. CAPITALS denote non-working maps, (p) = Pistols only."
    echo "[1] - Active competition maps. Inferno, Train, Mirage, Nuke, Dust II, Overpass and Vertigo."
    echo "[2] - Defusal Group Delta. Mirage, Inferno, Overpass, Nuke, Train and Cache."
    echo "[3] - Defusal Group Sigma. Anubis, Chlorine, Vertigo, Cobblestone and Canals."
    echo "[4] - Reserve maps. AZTEC, DUST, Canals and Cache."
    echo "[5] - Hostage Rescue. Agency, Assault, Italy, Militia and Office."
    echo "[6] - Jumbo Pack. Every map in Delta, Sigma, Hostage plus Dust II and several of the smaller maps"
    echo "[7] - Smaller maps A: Baggage, Lake, Lunacy, Monastery (p), Safehouse, Shoots and St. Marc."
    echo "[8] - Smaller maps B: Bank, Lake, Safehouse, Sugarcane (p), St. Marc and Shortdust."
    echo "[9] - Smaller maps C: Lake, Safehouse, Dizzy, Lunacy and Shoots."
    echo "[10] - Pick a single map to play from a list."
    echo
    echo "Play these on Classic Casual for unique game rules. IMPORTANT: Do a map vote after the first warm-up to implement the rules."
    echo "[11] - Stab, Stab... Zap. Knives, grenades and tazers only. Safehouse, Lake, Rialto, AUSTRIA."
    echo "[12] - Flying Scoutsman. Low gravity sniping. Lake, Safehouse, Dizzy, Lunacy and Shoots." 
    echo "[13] - Hunter Gathers. Death match, but collect dog-tags for extra points. Nuke, Dust II, INSERTION, THRILL, Canals, Cobblestone and Train."
    echo "[14] - Heavy Assault. Bomb maps. Assault suit not working.  Dust II, Mirage, Overpass, SHIPPED and AUSTRIA."
    echo "[15] - Arms Race. Baggage, Lake, Lunacy, Monastery, Safehouse, Shoots and St. Marc."
    echo "[16] - Demolition. Defusal missions. Earn new weapons for next round by killing opponents. Lake, Safehouse, Sugarcane, Bank, St Marc and ShortDust."
    echo

    echo -n "Please enter 1-18 (Default is the jumbo pack): "
    read userchoice
    echo

    if [ -z "$userchoice" ]; then
	userchoice="6"
    fi

    mapPack="mg_hostage"
    map="cs_assault"
    if [ "$userchoice" = "1" ]; then
	mapPack="mg_active"
	map="de_overpass"
    elif [ "$userchoice" = "2" ]; then
	mapPack="mg_casualdelta"
	map="de_mirage"
    elif [ "$userchoice" = "3" ]; then
	mapPack="mg_casualsigma"
	map="de_chlorine"
    elif [ "$userchoice" = "4" ]; then
	mapPack="mg_reserves"
	map="de_canals"
    elif [ "$userchoice" = "5" ]; then
	mapPack="mg_hostage"
	map="cs_assault"
    elif [ "$userchoice" = "6" ]; then
	mapPack="mg_deathmatch"
	map="gd_rialto"
    elif [ "$userchoice" = "7" ]; then
	mapPack="mg_armsrace"
	map="de_safehouse"
    elif [ "$userchoice" = "8" ]; then
	mapPack="mg_demolition"
	map="de_bank"
    elif [ "$userchoice" = "9" ]; then
	mapPack="mg_lowgravity"
	map="de_lake"
    elif [ "$userchoice" = "11" ]; then
	mapPack="mg_skirmish_stabstabzap"
	map="gd_rialto"
    elif [ "$userchoice" = "12" ]; then
	mapPack="mg_skirmish_flyingscoutsman"
	map="ar_shoots"
    elif [ "$userchoice" = "13" ]; then
	mapPack="mg_skirmish_huntergatherers"
	map="de_canals"
    elif [ "$userchoice" = "14" ]; then
	mapPack="mg_skirmish_heavyassaultsuit"
	map="de_overpass"
    elif [ "$userchoice" = "15" ]; then
	mapPack="mg_skirmish_armsrace"
	map="ar_baggage"
    elif [ "$userchoice" = "16" ]; then
	mapPack="mg_skirmish_demolition"
	map="de_lake"
    elif [ "$userchoice" = "10" ]; then
	echo " [0] - Anubis"
	echo " [1] - Aztec"
	echo " [2] - Bank (Guardian mode compatable)"
	echo " [3] - Canals"
	echo " [4] - Chlorine"
	echo " [5] - Coblestone"
	echo " [6] - Cobblestone (Guardian mode compatable)"
	echo " [7] - Dizzy (Guardian mode compatable)"
	echo " [8] - Dust II (Guardian mode compatable)"
	echo " [9] - Inferno"
	echo "[10] - Italy"
	echo "[11] - Lake (Guardian mode compatable)"
	echo "[12] - Mirage"
	echo "[13] - Nuke"
	echo "[14] - Overpass (Guardian mode compatable)"
	echo "[15] - Rialto (Guardian mode compatable)"
	echo "[16] - Sugarcane (p) (Guardian mode compatable)"
	echo "[17] - Train"
	echo "[18] - Vertigo"
	echo "[19] - DANGER ZONE: Jungle (huge)"
	echo "[20] - DANGER ZONE: Sirocco (huge)"
	echo "[21] - DANGER ZONE: Black Site (huge)"
	echo
	echo -n "Please enter 0-21 (Default is Dust II): "
	read userchoice

	if [ -z "$userchoice" ]; then
	    userchoice="8"
	fi
     
	mapPack="mg_dust247"
	map="de_dust2"
	if [ "$userchoice" = "0" ]; then
	    mapPack="mg_de_anubis"
	    map="de_anubis"
	elif [ "$userchoice" = "1" ]; then
	    mapPack="mg_de_aztec"
	    map="de_aztec"
	elif [ "$userchoice" = "2" ]; then
	    mapPack="mg_gd_bank"
	    map="de_bank"
	elif [ "$userchoice" = "3" ]; then
	    mapPack="mg_de_canals"
	    map="de_canals"
	elif [ "$userchoice" = "4" ]; then
	    mapPack="mg_de_chlorine"
	    map="de_chlorine"
	elif [ "$userchoice" = "5" ]; then
	    mapPack="mg_de_cbble"
	    map="de_cbble"
	elif [ "$userchoice" = "6" ]; then
	    mapPack="mg_gd_cbble"
	    map="de_cbble"
	elif [ "$userchoice" = "7" ]; then
	    mapPack="mg_gd_dizzy"
	    map="de_dizzy"
	elif [ "$userchoice" = "8" ]; then
	    mapPack="mg_dust247"
	    map="de_dust2"
	elif [ "$userchoice" = "9" ]; then
	    mapPack="mg_de_inferno"
	    map="de_inferno"
	elif [ "$userchoice" = "10" ]; then
	    mapPack="mg_cs_italy"
	    map="cs_italy"
	elif [ "$userchoice" = "11" ]; then
	    mapPack="mg_gd_lake"
	    map="de_lake"
	elif [ "$userchoice" = "12" ]; then
	    mapPack="mg_de_mirage"
	    map="de_mirage"
	elif [ "$userchoice" = "3" ]; then
	    mapPack="mg_de_nuke"
	    map="de_nuke"
	elif [ "$userchoice" = "14" ]; then
	    mapPack="mg_de_overpass"
	    map="de_overpass"
	elif [ "$userchoice" = "15" ]; then
	    mapPack="mg_gd_rialto"
	    map="gd_rialto"
	elif [ "$userchoice" = "16" ]; then
	    mapPack="mg_gd_sugarcane"
	    map="de_sugarcane"
	elif [ "$userchoice" = "17" ]; then
	    mapPack="mg_de_train"
	    map="de_train"
	elif [ "$userchoice" = "18" ]; then
	    mapPack="mg_de_vertigo"
	    map="de_vertigo"
	elif [ "$userchoice" = "19" ]; then
	    mapPack="mg_dz_junglety"
	    map="dz_junglety"
	elif [ "$userchoice" = "20" ]; then
	    mapPack="mg_dz_sirocco"
	    map="dz_sirocco"
	elif [ "$userchoice" = "21" ]; then
	    mapPack="mg_dz_blacksite"
	    map="dz_blacksite"
	fi
    fi
fi

echo ""
echo "Step 3: Do you want bots enabled?"
echo "[0] - No bots"
echo "[1] - Yes please"
echo -n "Please choose 0 or 1 (default is no bots): " 
read botChoice

if [ -z "$botChoice" ]; then
    botChoice="0"
fi

if [ "$nobots" = "0" ]; then
    nobots="-nobots"
else
    nobots=""
fi

if [ $gametype = "0" ]; then
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
elif [ $gametype = "7" ]; then
    gamemode="3"
    gametype="0"    
elif  [ $gametype = "8" ]; then
    gamemode="2"
    gametype="0"
fi

echo ""
echo ""

if [ "$map" = "" ]; then
    echo "No map specified for first round - will probably default to Dust II."
    echo ""
    echo "--------------------"
    echo ""
    /home/steam/Steam/csgo-ds/srcds_run -game csgo -console -usercon +game_type $gametype +game_mode $gamemode +mapgroup $mapPack +sv_setsteamaccount $key -maxplayers_override 20 -net_port_try $nobots -console -usercon +net_public_adr 51.195.139.45 +ip 51.195.139.45 -port 27015
elif [ "$gametype" = "5" ]; then
    echo "Launching Danger Zone..."
    echo ""
    echo "--------------------"
    echo ""
    /home/steam/Steam/csgo-ds/srcds_run -game csgo -console -usercon +game_type 6 +game_mode 0 +sv_dz_team_count 3 + dz_shuffle_teams +map dz_blacksite +sv_setsteamaccount $key -maxplayers_override 20 -net_port_try $nobots -console -usercon +net_public_adr 51.195.139.45 +ip 51.195.139.45 -port 27015
else
    echo "Launching with $mapPack, starting with $map first. Type is $gametype and mode is $gamemode."
    echo ""
    echo "--------------------"
    echo ""
    /home/steam/Steam/csgo-ds/srcds_run -game csgo -console -usercon +game_type $gametype +game_mode $gamemode +mapgroup $mapPack +map $map +sv_setsteamaccount $key -maxplayers_override 20 -net_port_try $nobots -console -usercon +net_public_adr 51.195.139.45 +ip 51.195.139.45 -port 27015
fi
