
local enclosures = {
	[1] = {
		name = "Campamento Altruista",
		weapon = {x= -1111.44, y= 4937.04, z= 218.4},
		garage = {x= -1144.72, y= 4909.0, z= 220.96},
		spawnCar = {x= -1135.8, y= 4919.84, z= 219.88},
		saveCar = {x= -1154.84, y= 4921.92, z= 222.0},
		attack  = {x= -1146.43, y= 4940.52, z= 222.28},
		vestPoint = {x= -1124.4, y= 4892.57, z= 218.47},
		inventoryPoint = {x = -1149.11, y = 4907.0, z = 220.97},
		cloackRoom = {x = -1.1, y = 1.1, z = 1.1},
		society = "society_mafia1",
		vest = nil,
		owner = nil
	},
	[2] = { 
		name = "Reyes Palace",
		weapon = {x= 714.32, y= 4197.28, z= 40.88},
		garage = {x= 726.96, y= 4168.96, z= 40.72},
		spawnCar = {x= 714.52, y= 4174.8, z= 40.72},
		saveCar = {x= 726.56, y= 4175.28, z= 40.72},
		attack = {x= 711.16, y= 4185.44, z= 41.08},
		vestPoint = {x= 749.86, y = 4184.16, z = 41.09},
		inventoryPoint = {x = 741.88, y = 4170.83, z = 41.09},
		cloackRoom = {x = -1.1, y = 1.1, z = 1.1},
		society = "society_mafia2",
		vest = nil,
		owner = nil
	},
	[3] = {
		name = "Asentamiento Monte Chiliad",
		weapon = {x= 2224.52, y= 5604.76, z= 53.92},
		garage = {x= 2194.52, y= 5595.64, z= 52.76},
		saveCar = {x= 2200.76, y= 5572.56, z= 53.76},
		spawnCar = {x= 2206.72, y= 5597.6, z= 52.68},
		attack = {x= 2221.04, y= 5614.48, z= 53.72},
		vestPoint = {x= 2199.77, y= 5597.33, z= 53.82},
		inventoryPoint = {x = 2232.4, y= 5611.69, z= 54.91},
		cloackRoom = {x = -1.1, y = 1.1, z = 1.1},
		society = "society_mafia3",
		vest = nil,
		owner = nil
	},
	[4] = {
		name = "Monte Gordo",
		weapon = {x= 3304.0, y= 5185.0, z= 18.72},
		garage = {x= 3316.72, y= 5182.2, z= 18.6},
		saveCar = {x= 3333.28, y= 5160.28, z= 17.32},
		spawnCar = {x= 3318.16, y= 5147.84, z= 17.24},
		attack = {x= 3311.28, y= 5175.96, z= 18.6},
		vestPoint = {x= 3311.29, y= 5173.76, z= 23.52},
		inventoryPoint = {x = 3309.85, y= 5189.88, z= 19.71},
		cloackRoom = {x = -1.1, y = 1.1, z = 1.1},
		society = "society_mafia4",
		vest = nil,
		owner = nil
	},
	[5] = {
		name = "Alamo Sea",
		weapon = {x= 1364.2, y= 4315.48, z= 37.64},
		garage = {x= 1321.48, y= 4314.32, z= 38.32},
		saveCar = {x= 1304.48, y= 4322.2, z= 38.2},
		spawnCar = {x= 1312.12, y= 4320.12, z= 38.12},
		attack = {x= 1332.68, y= 4325.12, z= 38.24},
		vestPoint = {x= 1300.74, y = 4318.81, z = 38.16},
		inventoryPoint = {x = 1308.9, y = 4362.25, z = 41.55},
		cloackRoom = {x = -1151.9, y = 4909.27, z = 219.9},
		society = "society_mafia5",
		vest = nil,
		owner = nil
	}
}

local donationsfinish = false

local prices = {
	[1] = 1, --Pan y Agua
	[2] = 1000, --Armas cuerpo a cuerpo
	[3] = 14000, -- Pistola Vintage
	[4] = 24000, --Combat Pistol
	[5] = 28000, --Double Action
	[6] = 190000, --Fusil Avanzado
	[7] = 650000, --sniper
	[8] = 80000, --SMG
	[9] = 30,
	[10] = 10000,
	[11] = 40000,
	[12] = 10000,
	[13] = 45000,
	[14] = 100,
	[15] = 50,
	[16] = 4500
}

if donationsfinish == true then
	for i,c in pairs(prices) do
		TriggerServerEvent("tm1_mafias:print",c)
		c = c * 0.5
	end
end

function getShop()
	local shop = nil

	--[[
	if WEAPONLEVEL == 0 then
		shop = {
		{label = "Pan - "..prices[1].."$", value = "bread", money = prices[1],whatItIs = "item"},
		{label = "Agua - "..prices[1].."$", value = "water", money = prices[1],whatItIs = "item"},
		{label = "Salir", whatItIs = "exit"}
		}
	elseif WEAPONLEVEL == 1 then
		shop = {
		{label = "Pistola de combate - "..prices[4].."$", value = "WEAPON_COMBATPISTOL", money = prices[4],whatItIs = "weapon"},
		{label = "Revolver de doble acción - "..prices[5].."$", value = "weapon_doubleaction", money = prices[5],whatItIs = "weapon"},
		{label = "Pistola vintage - "..prices[3].."$", value = "WEAPON_VINTAGEPISTOL", money = prices[3],whatItIs = "weapon"},
		{label = "Navaja - "..prices[2].."$", value="WEAPON_SWITCHBLADE",money = prices[2], whatItIs = "weapon"},
		{label = "Bate - "..prices[2].."$", value = "WEAPON_BAT", money = prices[2], whatItIs = "weapon"},
		{label = "Palanca - "..prices[2].."$", value = "WEAPON_CROWBAR", money = prices[2], whatItIs = "weapon"},
		{label = "Paracaidas - "..prices[14].."$", value = "GADGET_PARACHUTE", money = prices[14],whatItIs = "weapon"},
		{label = "Pan - "..prices[1].."$", value = "bread", money = prices[1],whatItIs = "item"},
		{label = "Agua - "..prices[1].."$", value = "water", money = prices[1],whatItIs = "item"},
		{label = "Salir", whatItIs = "exit"}
		}
	elseif WEAPONLEVEL == 2 then
		shop = {
		{label = "Subfusil - "..prices[8].."$", value = "WEAPON_SMG", money = prices[8],whatItIs = "weapon"},
		{label = "Pistola de combate - "..prices[4].."$", value = "WEAPON_COMBATPISTOL", money = prices[4],whatItIs = "weapon"},
		{label = "Pistola vintage - "..prices[3].."$", value = "WEAPON_VINTAGEPISTOL", money = prices[3],whatItIs = "weapon"},
		{label = "Navaja - "..prices[2].."$", value="WEAPON_SWITCHBLADE",money = prices[2], whatItIs = "weapon"},
		{label = "Bate - "..prices[2].."$", value = "WEAPON_BAT", money = prices[2], whatItIs = "weapon"},
		{label = "Paracaidas - "..prices[14].."$", value = "GADGET_PARACHUTE", money = prices[14],whatItIs = "weapon"},
		{label = "Pan - "..prices[1].."$", value = "bread", money = prices[1],whatItIs = "item"},
		{label = "Agua - "..prices[1].."$", value = "water", money = prices[1],whatItIs = "item"},
		{label = "Salir", whatItIs = "exit"}
		}
	elseif WEAPONLEVEL == 3 then
		shop = {
			{label = "Francotirador - "..prices[7].."$", value = "WEAPON_SNIPERRIFLE", money = prices[7],whatItIs = "weapon"},
			{label = "Subfusil - "..prices[8].."$", value = "WEAPON_SMG", money = prices[8],whatItIs = "weapon"},
			{label = "Rifle Avanzado - "..prices[6].."$", value = "WEAPON_ADVANCEDRIFLE", money = prices[6],whatItIs = "weapon"},
			{label = "Pistola de combate - "..prices[4].."$", value = "WEAPON_COMBATPISTOL", money = prices[4],whatItIs = "weapon"},
			{label = "Pistola vintage - "..prices[3].."$", value = "WEAPON_VINTAGEPISTOL", money = prices[3],whatItIs = "weapon"},
			{label = "Navaja - "..prices[2].."$", value="WEAPON_SWITCHBLADE",money = prices[2], whatItIs = "weapon"},
			{label = "Bate - "..prices[2].."$", value = "WEAPON_BAT", money = prices[2], whatItIs = "weapon"},
			{label = "Paracaidas - "..prices[14].."$", value = "GADGET_PARACHUTE", money = prices[14],whatItIs = "weapon"},
			{label = "Pan - "..prices[1].."$", value = "bread", money = prices[1],whatItIs = "item"},
			{label = "Agua - "..prices[1].."$", value = "water", money = prices[1],whatItIs = "item"},
			{label = "Salir", whatItIs = "exit"}
		}
	end]]--

	local shop = {
		{label = "Francotirador - "..prices[2].."$", value = "WEAPON_SNIPERRIFLE", money = prices[2],whatItIs = "weapon"},
		{label = "Subfusil - "..prices[4].."$", value = "WEAPON_MINISMG", money = prices[4],whatItIs = "weapon"},
		{label = "Fusil Compacto - "..prices[3].."$", value = "WEAPON_COMPACTRIFLE", money = prices[3],whatItIs = "weapon"},
		{label = "Fusil - "..prices[3].."$", value = "WEAPON_ASSAULTRIFLE", money = prices[3],whatItIs = "weapon"},
		{label = "Rifle Avanzado - "..prices[3].."$", value = "WEAPON_ADVANCEDRIFLE", money = prices[3],whatItIs = "weapon"},
		{label = "Pistola de combate - "..prices[7].."$", value = "WEAPON_COMBATPISTOL", money = prices[7],whatItIs = "weapon"},
		{label = "Pistola vintage - "..prices[8].."$", value = "WEAPON_VINTAGEPISTOL", money = prices[8],whatItIs = "weapon"},
		{label = "Tec 9 - "..prices[6].."$", value="WEAPON_MACHINEPISTOL", money = prices[6], whatItIs = "weapon"},

		{label = "Desert Eagle - "..prices[6].."$", value="WEAPON_PISTOL50", money = prices[6], whatItIs = "weapon"},
		{label = "Pistola SNS - "..prices[6].."$", value="WEAPON_SNSPISTOL", money = prices[6], whatItIs = "weapon"},
		{label = "Pistola Vintage - "..prices[6].."$", value="WEAPON_VINTAGEPISTOL", money = prices[6], whatItIs = "weapon"},

		{label = "Molotov - "..prices[8].."$", value="WEAPON_MOLOTOV", money = prices[8], whatItIs = "weapon"},
		{label = "C4 - "..prices[1].."$", value="WEAPON_STICKYBOMB", money = prices[1], whatItIs = "weapon"},
		{label = "Navaja - "..prices[8].."$", value="WEAPON_SWITCHBLADE",money = prices[8], whatItIs = "weapon"},
		{label = "Daga - "..prices[9].."$", value="WEAPON_DAGGER",money = prices[9], whatItIs = "weapon"},
		{label = "Botella - "..prices[9].."$", value="WEAPON_BOTTLE",money = prices[9], whatItIs = "weapon"},
		{label = "Palanca - "..prices[9].."$", value="WEAPON_CROWBAR",money = prices[9], whatItIs = "weapon"},
		{label = "Stick de Golf - "..prices[9].."$", value="WEAPON_GOLFCLUB",money = prices[9], whatItIs = "weapon"},
		{label = "Martillo - "..prices[9].."$", value="WEAPON_HAMMER",money = prices[9], whatItIs = "weapon"},
		{label = "Puño Americano - "..prices[9].."$", value="WEAPON_KNUCKLE",money = prices[9], whatItIs = "weapon"},
		{label = "Cuchillo - "..prices[9].."$", value="WEAPON_KNIFE",money = prices[9], whatItIs = "weapon"},
		{label = "Machete - "..prices[9].."$", value="WEAPON_MACHETE",money = prices[9], whatItIs = "weapon"},
		{label = "Llave Inglesa - "..prices[9].."$", value="WEAPON_WRENCH",money = prices[9], whatItIs = "weapon"},
		{label = "Taco de Billar - "..prices[9].."$", value="WEAPON_POOLCUE",money = prices[9], whatItIs = "weapon"},
		{label = "Bate - "..prices[9].."$", value = "WEAPON_BAT", money = prices[9], whatItIs = "weapon"},
		{label = "Esposas - "..prices[12].."$", value = "grilletes", money = prices[12],whatItIs = "item"},
		{label = "Llaves de esposas - "..prices[13].."$", value = "keys", money = prices[13],whatItIs = "item"},
		{label = "Paracaidas - "..prices[10].."$", value = "GADGET_PARACHUTE", money = prices[10],whatItIs = "weapon"},
		{label = "Pan - "..prices[14].."$", value = "bread", money = prices[14],whatItIs = "item"},
		{label = "Agua - "..prices[15].."$", value = "water", money = prices[15],whatItIs = "item"},
		{label = "Salir", whatItIs = "exit"}
	}
	
	return shop
end

local state = true
local seconds = 0
local isStarted = 0
local isIn = false
local isPosible = true
--===========
-- BLIPS
--===========

Citizen.CreateThread(function()
	for _, info in pairs(enclosures) do
      info.blip = AddBlipForCoord(info.attack.x, info.attack.y, info.attack.z)
      SetBlipSprite(info.blip, 374)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, 47)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.name)
      EndTextCommandSetBlipName(info.blip)
    end
end)

--===========
-- RECUPERAR DATOS SOBRE RECINTOS
--===========
AddEventHandler('playerSpawned', function(spawn)
	local enclosuresa = {}
	for _, info in pairs(enclosures) do
	    enclosuresa[_] = info.name      	
	end
	TriggerServerEvent('tm1_mafias:enclosureComprobate',enclosuresa)
end)
local enclosuresa = {}
	for _, info in pairs(enclosures) do
	    enclosuresa[_] = info.name      	
	end
TriggerServerEvent('tm1_mafias:enclosureComprobate',enclosuresa)

RegisterNetEvent('tm1_mafias:puttedGroupsInEnclosures')
AddEventHandler('tm1_mafias:puttedGroupsInEnclosures',function()
	Citizen.CreateThread(function()
		local enclosuresa = {}
		for _, info in pairs(enclosures) do
	      	enclosuresa[_] = info.name      	
	    end
	    TriggerServerEvent('tm1_mafias:enclosureComprobate',enclosuresa)
	end)
end)

--===========
-- AÑADIENDO DATOS A EL ENCLOUSERS
--===========
RegisterNetEvent('tm1_mafias:putGroupsInEnclosures')
AddEventHandler('tm1_mafias:putGroupsInEnclosures',function(enclosuresInfo)
	for i,v in pairs(enclosuresInfo) do
		for a,b in pairs(enclosures) do
			if v.name == b.name then
				b.owner = v.groupid
			end
		end
	end
	if isStarted == 1 then

	else
		varReady()
		isStarted = 1
	end
	
end)

RegisterNetEvent('tm1_mafias:changeIsPosible')
AddEventHandler('tm1_mafias:changeIsPosible',function(isPosiblea)
	isPosible = isPosiblea
end)

RegisterNetEvent('tm1_mafias:activeAttack')
AddEventHandler('tm1_mafias:activeAttack',function(x1,x2,x3,name,gr,gr1,groupToGroup)
	if groupToGroup then
		backOperation(5,"attackWithIn1",name,x1,x2,x3,gr,gr1)
	else
		backOperation(5,"attackWithIn",name,x1,x2,x3,gr,gr1)
	end
	TriggerServerEvent('tm1_mafias:advert',"Has empezado el ataque, ten cuidado y no te alejes mas de 15 metros.")
	TriggerServerEvent('tm1_mafias:refreshIsPosible',false)
	state = false
end)
--===========
-- BORRAR VEHÍCULO
--===========
RegisterNetEvent('tm1_mafias:clearV')
AddEventHandler('tm1_mafias:clearV',function(x,y,z)
	local vehicleu = GetClosestVehicle(x,y,z, 6.5, 0, 70)
	SetEntityAsMissionEntity( vehicleu, true, true )
	Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( vehicleu ) )
end)

--===========
-- HILO PRINCIPAL
--===========
function varReady()
	Citizen.CreateThread(function ()
		while true do
			Citizen.Wait(0)
			local coords = GetEntityCoords(GetPlayerPed(-1))
			if not(group.enclosure == nil) then
				for i,v in pairs(enclosures) do
					if v.name == group.enclosure then
						DrawMarker(1,v.garage.x,v.garage.y,v.garage.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						DrawMarker(1,v.spawnCar.x,v.spawnCar.y,v.spawnCar.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						DrawMarker(1,v.saveCar.x,v.saveCar.y,v.saveCar.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						DrawMarker(1,v.weapon.x,v.weapon.y,v.weapon.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						DrawMarker(1,v.vestPoint.x,v.vestPoint.y,v.vestPoint.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						DrawMarker(1,v.inventoryPoint.x,v.inventoryPoint.y,v.inventoryPoint.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						DrawMarker(1,v.cloackRoom.x,v.cloackRoom.y,v.cloackRoom.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.garage.x,v.garage.y,v.garage.z, true) < 1.5 then
							drawTxt("PULSA E PARA ABRIR EL GARAJE",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							if IsControlJustReleased(0, 38) then
								local coords = {x = v.spawnCar.x,y = v.spawnCar.y,z = v.spawnCar.z}
								local coords1 = {x = v.saveCar.x,y = v.saveCar.y,z = v.saveCar.z}
								OpenMenuGarage(coords)
							end
						elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.spawnCar.x,v.spawnCar.y,v.spawnCar.z, true) < 1.5 then
							drawTxt("EN ESTE SITIO EL MAYORDOMO TE TRAERA EL COCHE",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
						elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.vestPoint.x,v.vestPoint.y,v.vestPoint.z, true) < 1.5 then
							drawTxt("PULSA E PARA PONERTE TU CHALECO DE MAFIA",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							if IsControlJustReleased(0, 38) then
								if v.vest then
									ESX.TriggerServerCallback('tm1_mafias:hasEnoughMoney', function(bool)
										if bool == true then
											ESX.ShowNotification("Te has puesto tu chaleco")
											ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
											if skin.sex == 0 then
												TriggerEvent('skinchanger:change', 'bproof_1', v.vest.male['bproof_1'])
												TriggerEvent('skinchanger:change', 'bproof_2', v.vest.male['bproof_2'])
											else
												TriggerEvent('skinchanger:change', 'bproof_1', v.vest.female['bproof_1'])
												TriggerEvent('skinchanger:change', 'bproof_2', v.vest.female['bproof_2'])
											end
											end)
											SetPedArmour(GetPlayerPed(-1), 100)
										end
									end, 5000)
								else
									ESX.TriggerServerCallback('tm1_mafias:hasEnoughMoney', function(bool)
										if bool == true then
											ESX.ShowNotification("Te has puesto tu chaleco")
											SetPedArmour(GetPlayerPed(-1), 100)
										end
									end, 10000)
								end
							end
						elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.inventoryPoint.x,v.inventoryPoint.y,v.inventoryPoint.z, true) < 1.5 then
							drawTxt("PULSA E PARA ABRIR EL INVENTARIO DE LA MAFIA",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							if IsControlJustReleased(0, 38) then
								ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mafia_inventory', {
									title    = "Inventario de mafia",
									align    = 'top-left',
									elements = {
										{label = "Depositar objetos",    value = 'deposit'},
										{label = "Retirar objetos", value = 'withdraw'}
								}}, function(data, menu)
									if data.current.value == 'deposit' then
										OpenPutStocksMenu(v)
									elseif data.current.value == 'withdraw' then
										OpenGetStocksMenu(v)
									end
								end, function(data, menu)
									menu.close()
								end)
							end
						elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.saveCar.x,v.saveCar.y,v.saveCar.z, true) < 1.5 then
							drawTxt("PON EL COCHE AQUÍ Y AVISA AL MAYORDOMO QUE LO RECOJA EN EL MÚSCULO E",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							if IsControlJustReleased(0, 38) then
								if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
									StockVehicleMenuc()
								else
									TriggerEvent('esx:showNotification', "No hay ningun coche para meter")
								end
							end
						elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.weapon.x,v.weapon.y,v.weapon.z, true) < 1.5 and group.aprove == 2 then
							drawTxt("PULSA E PARA ABRIR EL MENÚ DE COMPRAS DE MAFIA",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							if IsControlJustReleased(0, 38) then
								OpenShopMenub()
							end
						end
					elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.cloackRoom.x,v.cloackRoom.y,v.cloackRoom.z, true) < 1.5 then
						drawTxt("PULSA E PARA ABRIR EL ROPERO",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
						if IsControlJustReleased(0, 38) then
							ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
								local elements = {}
				
								for i=1, #dressing, 1 do
									table.insert(elements, {
										label = dressing[i],
										value = i
									})
								end
				
								ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
									title    = "Cambiador de ropa",
									align    = 'top-left',
									elements = elements
								}, function(data2, menu2)
									TriggerEvent('skinchanger:getSkin', function(skin)
										ESX.TriggerServerCallback('esx_property:getPlayerOutfit', function(clothes)
											TriggerEvent('skinchanger:loadClothes', skin, clothes)
											TriggerEvent('esx_skin:setLastSkin', skin)
				
											TriggerEvent('skinchanger:getSkin', function(skin)
												TriggerServerEvent('esx_skin:save', skin)
											end)
										end, data2.current.value)
									end)
								end, function(data2, menu2)
									menu2.close()
								end)
							end)
						end
					else
						DrawMarker(1,v.attack.x,v.attack.y,v.attack.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.attack.x,v.attack.y,v.attack.z, true) < 1.5 then
							if state then
								drawTxt("PULSA E PARA INTENTAR ATACAR LA ZONA",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
								if v.owner == nil then
									if IsControlJustReleased(0, 38) then
										if isPosible then
											backOperation(15,"attackWithout1",v.name,v.attack.x,v.attack.y,v.attack.z)
											TriggerServerEvent('tm1_mafias:advert',"Has empezado el ataque, ten cuidado y no te alejes mas de 15 metros.")
											TriggerServerEvent('tm1_mafias:refreshIsPosible',false)
											state = false
										else
											TriggerServerEvent('tm1_mafias:advert',"No es posible hacer el robo ahora mismo")
										end
									end
								else
									if IsControlJustReleased(0, 38) then
										if isPosible then
											TriggerServerEvent('tm1_mafias:getZoneWithin',v.owner,v.attack.x,v.attack.y,v.attack.z,v.name,group.groupid,true)
											TriggerServerEvent('tm1_mafias:advert',"Procesando información, no toques nada")
										else
											TriggerServerEvent('tm1_mafias:advert',"No es posible hacer el robo ahora mismo")
										end
									end
								end
							else
								drawTxt("QUEDAN "..seconds.." SEGUNDOS",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							end
						end
					end
				end
			else
				if group.aprove == 2 then
					for i,v in pairs(enclosures) do
						DrawMarker(1,v.attack.x,v.attack.y,v.attack.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						if state then
							if GetDistanceBetweenCoords(coords, v.attack.x,v.attack.y,v.attack.z, true) < 1.5 then
								drawTxt("PULSA E PARA INTENTAR ATACAR LA ZONA",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
								if IsControlJustReleased(0, 38) then
									if v.owner == nil then
										if isPosible then
											backOperation(15,"attackWithout",v.name,v.attack.x,v.attack.y,v.attack.z)
											TriggerServerEvent('tm1_mafias:advert',"Has empezado el ataque, ten cuidado y no te alejes mas de 15 metros.")
											TriggerServerEvent('tm1_mafias:refreshIsPosible',false)
											state = false
										else
											TriggerServerEvent('tm1_mafias:advert',"No es posible hacer el robo ahora mismo")
										end
									else
										if isPosible then
											TriggerServerEvent('tm1_mafias:getZoneWithin',v.owner,v.attack.x,v.attack.y,v.attack.z,v.name,group.groupid)
											TriggerServerEvent('tm1_mafias:advert',"Procesando información, no toques nada")
										else
											TriggerServerEvent('tm1_mafias:advert',"No es posible hacer el robo ahora mismo")
										end
									end
								end
							end
						else
							drawTxt("QUEDAN "..seconds.." SEGUNDOS",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
						end
					end
				end
			end
		end
	end)
end

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function OpenMenuGarage(coord)
	ESX.UI.Menu.CloseAll()

	local elements = {
	{label = "Lista de vehículos", value = 'list_vehicles'},
	{label = "Recuperar vehículo (100$)", value = 'return_vehicle'},
	}

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'garage_menu',
		{
			title    = 'Garage',
			align    = 'bottom-right',
			elements = elements,
		},
		function(data, menu)
			menu.close()
			if(data.current.value == 'list_vehicles') then
				ListVehiclesMenu(coord)
			end
			if(data.current.value == 'return_vehicle') then
				ReturnVehicleMenu(coord)
			end
		end,
		function(data, menu)
			menu.close()
			--CurrentAction = 'open_garage_action'
		end)
end

function ListVehiclesMenu(coord)
	local elements = {}

	ESX.TriggerServerCallback('tm1_mafias:getVehicles', function(vehicles)
		for _,v in pairs(vehicles) do
			local hashVehicule = v.vehicle.model
    		local vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
			local labelvehicle
			local id = v.id

			if(v.state)then
				labelvehicle = vehicleName..': Dentro'
			else
				labelvehicle = vehicleName..': Fuera'
			end	
			table.insert(elements, {label =labelvehicle , value = v})
		end

		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'spawn_vehicle',
		{
			title    = 'Garage',
			align    = 'bottom-right',
			elements = elements,
		},
		function(data, menu)
			if(data.current.value.state)then
				menu.close()
				SpawnVehicle(data.current.value.vehicle,coord)
			else
				TriggerEvent('esx:showNotification', 'Su vehículo ya está fuera')
			end
		end,
		function(data, menu)
			menu.close()
		end)	
	end)
end

function ReturnVehicleMenu(coord)
	ESX.TriggerServerCallback('tm1_mafias:getOutVehicles', function(vehicles)

		local elements = {}

		for _,v in pairs(vehicles) do
			local hashVehicule = v.model
			local vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
			local labelvehicle

			labelvehicle = vehicleName..': Fuera'
			
			table.insert(elements, {label =labelvehicle , value = v})
		end
		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'return_vehicle',
		{
			title    = 'Garage',
			align    = 'bottom-right',
			elements = elements,
		},
		function(data, menu)

			ESX.TriggerServerCallback('tm1_mafias:checkMoney', function(hasEnoughMoney)
				if hasEnoughMoney then
					local car = GetClosestVehicle(coord.x ,coord.y,coord.z + 1,  3.0,  0,  71)
					if not DoesEntityExist(car) then
						TriggerServerEvent('esx_eden_garage1:pay')
						SpawnVehicle(data.current.value,coord)
					else
						ESX.ShowNotification('Ya hay un coche en el punto de spawn')	
					end
				else
					ESX.ShowNotification('No tienes suficiente dinero')						
				end
			end)
		end,
		function(data, menu)
			menu.close()
			--CurrentAction = 'open_garage_action'
		end)
	end)
end

function SpawnVehicle(vehicle,coord)
	local car = GetClosestVehicle(coord.x ,coord.y,coord.z + 1,  3.0,  0,  71)
	if not DoesEntityExist(car) then
		ESX.Game.SpawnVehicle(vehicle.model, {
			x = coord.x ,
			y = coord.y,
			z = coord.z + 1											
			},120, function(callback_vehicle)
			ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
			TriggerEvent("advancedFuel:setEssence", 100, GetVehicleNumberPlateText(callback_vehicle), GetDisplayNameFromVehicleModel(GetEntityModel(callback_vehicle)))
			TriggerServerEvent('llaves:addarrayllaves',GetVehicleNumberPlateText(callback_vehicle),vehicle) 
			TriggerServerEvent('tm1_mafias:modifystate', false, GetVehicleNumberPlateText(callback_vehicle))
			end)
	else
		ESX.ShowNotification('Ya hay un vehículo en el punto de spawn')
	end
end

function backOperation(s,operation,encl,x,y,z,gr,gr1)
	Citizen.CreateThread(function ()
	seconds = s
	while true do
		Citizen.Wait(1000)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), x,y,z, true) < 15 then
			isIn = true
		else
			isIn = false
		end
		if isIn == false then
			TriggerServerEvent('tm1_mafias:advert',"Se ha suspendido el ataque por alejarte demasiado")
			state = 1
			break
		end
		if IsEntityDead(GetPlayerPed(-1)) then
			TriggerServerEvent('tm1_mafias:advert',"Ataque suspendido.")
			state = 1
			break
		end
		if seconds == 0 then
			if operation == "attackWithout" then
				state = 1
				TriggerServerEvent('tm1_mafias:advert',"La zona ya es tuya")
				TriggerServerEvent('tm1_mafias:getZoneFinished',encl,group.groupid,operation)
				Citizen.Wait(1000)
				TriggerServerEvent('tm1_mafias:refreshIsPosible',true)
			elseif operation == "attackWithout1" then
				state = 1
				TriggerServerEvent('tm1_mafias:advert',"La zona ya es tuya")
				TriggerServerEvent('tm1_mafias:getZoneFinished',encl,group.groupid,operation)
				Citizen.Wait(1000)
				TriggerServerEvent('tm1_mafias:refreshIsPosible',true)
			elseif operation == "attackWithIn" then
				state = 1
				TriggerServerEvent('tm1_mafias:advert',"La zona ya es tuya")
				TriggerServerEvent('tm1_mafias:getZoneFinished',encl,gr1,operation,gr)
				Citizen.Wait(1000)
				TriggerServerEvent('tm1_mafias:refreshIsPosible',true)
			elseif operation == "attackWithIn1" then
				state = 1
				TriggerServerEvent('tm1_mafias:advert',"La zona ya es tuya")
				TriggerServerEvent('tm1_mafias:getZoneFinished',encl,gr1,operation,gr)
				Citizen.Wait(1000)
				TriggerServerEvent('tm1_mafias:refreshIsPosible',true)
			end
			break
		else
			seconds = seconds - 1
		end
	end
	end)
end

function OpenShopMenub()

	local elements = getShop()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'promoteMenu',
		{
			title  = "Tienda de Mafia",
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.whatItIs == "weapon" then
				TriggerServerEvent('tm1_mafias:buyWeapon',data.current.value,data.current.money)
			elseif data.current.whatItIs == "item" then
				TriggerServerEvent('esx_shop:comprarItemPop',data.current.value,1,data.current.money)
			elseif data.current.whatItIs == "exit" then
				menu.close()
			end
			
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end 

RegisterNetEvent('tm1_mafias:esposar')
AddEventHandler('tm1_mafias:esposar',function(option)
	local player, distance = ESX.Game.GetClosestPlayer()
	if distance ~= -1 and distance <= 3.0 then	
		TriggerServerEvent('tm1_mafias:toClientEsposar',GetPlayerServerId(player),option)
	end
end)

RegisterNetEvent('tm1_mafias:changeEsposar')
AddEventHandler('tm1_mafias:changeEsposar',function(option)
  IsHandcuffed    = option
  local playerPed = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    if IsHandcuffed == true then

      RequestAnimDict('mp_arresting')

      while not HasAnimDictLoaded('mp_arresting') do
        Wait(100)
      end

      TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
      SetEnableHandcuffs(playerPed, true)
      SetPedCanPlayGestureAnims(playerPed, false)
      FreezeEntityPosition(playerPed,  true)

    elseif IsHandcuffed == false then

      ClearPedSecondaryTask(playerPed)
      SetEnableHandcuffs(playerPed, false)
      SetPedCanPlayGestureAnims(playerPed,  true)
      FreezeEntityPosition(playerPed, false)

    end

  end)
end)

function OpenPutStocksMenu(enclosure)
	ESX.TriggerServerCallback('tm1_mafias:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type  = 'item_standard',
					value = item.name
				})
			end
		end

		for i=1, #inventory.weapons, 1 do
			local weapon = inventory.weapons[i]

			table.insert(elements, {
				label = weapon.label .. ' [' .. weapon.ammo .. ']',
				type  = 'item_weapon',
				value = weapon.name,
				ammo  = weapon.ammo
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = "Inventario",
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			if data.current.type == 'item_weapon' then
				menu.close()
				TriggerServerEvent('tm1_mafias:putStockItems', data.current.type, data.current.value, data.current.ammo, enclosure.society)
				ESX.UI.Menu.CloseAll()
			else
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'put_item_count', {
					title = 'Cantidad'
				}, function(data2, menu2)
					local quantity = tonumber(data2.value)
	
					if quantity == nil then
						ESX.ShowNotification('Cantidad inválida')
					else
						menu2.close()
	
						TriggerServerEvent('tm1_mafias:putStockItems',data.current.type, data.current.value, tonumber(data2.value), enclosure.society)
						ESX.UI.Menu.CloseAll()
					end
				end, function(data2, menu2)
					menu2.close()
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenGetStocksMenu(enclosure)
	ESX.TriggerServerCallback('tm1_mafias:getMafiasInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		for i=1, #inventory.weapons, 1 do
			local weapon = inventory.weapons[i]

			table.insert(elements, {
				label = ESX.GetWeaponLabel(weapon.name) .. ' [' .. weapon.ammo .. ']',
				type  = 'item_weapon',
				value = weapon.name,
				ammo  = weapon.ammo
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = "Inventario de la mafia",
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			if data.current.type == 'item_weapon' then
				menu.close()

				TriggerServerEvent('tm1_mafias:getStockItem', data.current.type, data.current.value, data.current.ammo, enclosure.society)
				ESX.UI.Menu.CloseAll()
			else
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'get_item_count', {
					title = 'Cantidad'
				}, function(data2, menu)

					local quantity = tonumber(data2.value)
					if quantity == nil then
						ESX.ShowNotification("Cantidad inválida")
					else
						menu.close()

						TriggerServerEvent('tm1_mafias:getStockItem', data.current.type, data.current.value, quantity, enclosure.society)
						ESX.UI.Menu.CloseAll()
					end
				end, function(data2,menu)
					menu.close()
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end, enclosure.society)
end


function StockVehicleMenuc()
	local playerPed  = GetPlayerPed(-1)
	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		SetEntityAsMissionEntity( vehicle, true, true )
		local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
		local current 	    = GetPlayersLastVehicle(GetPlayerPed(-1), true)
		local engineHealth  = GetVehicleEngineHealth(current)
		TriggerServerEvent('esx_eden_garage:debug', vehicle)
		TriggerServerEvent('tm1_mafias:modifystate', true, vehicleProps.plate)
		deleteCar( vehicle )
		TriggerServerEvent('esx_eden_garage:logging', "engineHealth \t" .. engineHealth.. "\n")
	else
		ESX.ShowNotification('No hay ningún coche para meter')
	end
end