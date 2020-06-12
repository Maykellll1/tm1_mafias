-------------------
-----VARIABLES-----
-------------------
ESX                           = nil
local HasAlreadyEnteredMarker = false
local isInAGroup = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}

-------------------
------CITIZEN------
-------------------
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local administratorLocal = {
	put = "Añadir personas al grupo",
	remove = "Expulsar personas al grupo",
	administrate = "Administrar miembros",
	titleSecondary = "Acciones de grupo",
	close = "Cerrar",
	title = "Administrador de grupo",
	accept = "Aceptar invitacion",
	unaccept = "Denegar invitacion",
	promoteTitle = "¿Que deseas hacer con ",
	promote = "Ascender",
	unpromote = "Degradar",
	removeGroup = "Eliminar grupo",
	yes = "Si",
	no = "No",
	removeGroupTitle = "¿Deseas eliminar el grupo ",
	errorRank = "No puedes expulsar a esa persona",
	exitGroup = "Salir del grupo",
	exitGroupQ = "¿Deseas salir del grupo?",
	noGroupSelected = "No estás en ningun grupo"
}


Citizen.CreateThread(function()
	local isOpen  = false
	while true do
		Citizen.Wait(0)
			if IsControlJustReleased(0, 246) and isOpen == false then
				CurrentAction     = 'principalAdministratorGroup'
				isOpen  = true
				OpenShopMenuB()
			elseif IsControlJustReleased(0, 166) then
				OpenShopMenuC()
			elseif IsControlJustReleased(0, 246) and isOpen == true then
				CurrentAction = nil
				isOpen  = false
				ESX.UI.Menu.CloseAll()
			end
	end
end)

function OpenShopMenuB()
	local elements = {}
	if group.rank == 4 then
	elements = {
		{label = administratorLocal.put ,value = "put_person"},
		{label = administratorLocal.remove ,value = "remove_person"},
		{label = administratorLocal.administrate ,value = "group_administrate"},
		{label = administratorLocal.exitGroup ,value = "exit_group"},
		{label = administratorLocal.close ,value = "close"}
	}
	elseif group.rank == 5 then
	elements = {
		{label = administratorLocal.put ,value = "put_person"},
		{label = administratorLocal.remove ,value = "remove_person"},
		{label = administratorLocal.administrate ,value = "group_administrate"},
		{label = administratorLocal.removeGroup ,value = "remove_group"},
		{label = administratorLocal.close ,value = "close"}
	}
	else
	elements = {
		{label = administratorLocal.exitGroup ,value = "exit_group"},
		{label = administratorLocal.close ,value = "close"}
	}
	end


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'principalAdministratorGroup',
		{
			title  = administratorLocal.title,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "put_person" then
				OpenAddPeopleMenu()
			elseif data.current.value == "remove_person" then
				OpenRemovePeopleMenu()
			elseif data.current.value == "group_administrate" then
				OpenAdministratePeopleMenu()
			elseif data.current.value == "remove_group" then
				OpenRemoveGroupMenu(group,"remove",group.enclosure)
			elseif data.current.value == "exit_group" then
				OpenRemoveGroupMenu(group,"exit")
			elseif data.current.value == "close" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenShopMenuC()
	local elements = {}

	--INFO
	if not(group.name == "") then
		table.insert(elements,{label = '<b><span style="color: red;">'..group.name..'</span></b>', value = 'title'})
	else
		table.insert(elements,{label = '<b><span style="color: red;">'..administratorLocal.noGroupSelected..'</span></b>', value = 'title'})
	end

	if not(group.money == nil) then
		table.insert(elements,{label = '<span style="color: green;">DINERO : '..group.money..'</span>', value = 'money'})
	end

	if not(group.rank == nil) then
		table.insert(elements,{label = '<span style="color: cyan;">RANGO : '..rankLabel[group.rank]..'</span>', value = 'rank'})
	end

	if not(group.aprove == nil) then
		table.insert(elements,{label = '<span style="color: yellow;">PRESTIGIO : '..grouplabel[group.aprove]..'</span>', value = 'aprove'})
	end

	--Acciones
	table.insert(elements,{label = '<b><span style="color: white;">'..'ACCIONES'..'</span></b>', value = 'title'})
	if not(group.name == "") then
		if ISMENUACTIVE == true then
			table.insert(elements,{label = '<b><span style="color: white;">INFORMACIÓN EN PANTALLA : <span style="color: green;">'..'ON'..'</span></span></b>', value = 'info'})
		else
			table.insert(elements,{label = '<b><span style="color: white;">INFORMACIÓN EN PANTALLA : <span style="color: red;">'..'OFF'..'</span></span></b>', value = 'info'})
		end
	end


	table.insert(elements,{label = '<b><span style="color: white;">'..'PRESTIGIO'..'</span></b>', value = 'title'})
	if not(group.name == "") then
		if group.aprove == 1 then
			table.insert(elements,{label = '<b><span style="color: white;">Esposar / Desesposar'..'</span></b>', value = 'handCuff'})
			table.insert(elements,{label = '<b><span style="color: white;">Mover o dejar de mover'..'</span></b>', value = 'move'})
		else
			table.insert(elements,{label = '<b><span style="color: white;">Esposar / Desesposar'..'</span></b>', value = 'handCuff'})
			table.insert(elements,{label = '<b><span style="color: white;">Mover o dejar de mover'..'</span></b>', value = 'move'})
			table.insert(elements,{label = '<b><span style="color: white;">Meter en el coche'..'</span></b>', value = 'putOn'})
			table.insert(elements,{label = '<b><span style="color: white;">Sacar del coche'..'</span></b>', value = 'putOff'})
			table.insert(elements,{label = '<b><span style="color: white;">Sacar información'..'</span></b>', value = 'dni'})
		end
	end

	table.insert(elements,{label = '<b><span style="color: white;">'..'------------------'..'</span></b>', value = 'title'})
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'principalAdministratorGroup',
		{
			title  = administratorLocal.titleSecondary,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			local player, distance = ESX.Game.GetClosestPlayer()
			if data.current.value == "info" then
				ISMENUACTIVE = not ISMENUACTIVE
				menu.close()
			elseif data.current.value == "handCuff" then
				TriggerServerEvent('tm1_mafias:handcuff', GetPlayerServerId(player))
			elseif data.current.value == "move" then
				TriggerServerEvent('tm1_mafias:drag', GetPlayerServerId(player))
			elseif data.current.value == "putOn" then
				TriggerServerEvent('tm1_mafias:putInVehicle', GetPlayerServerId(player))
			elseif data.current.value == "putOff" then
				TriggerServerEvent('tm1_mafias:OutVehicle', GetPlayerServerId(player))
			elseif data.current.value == "dni" then
				OpenIdentityCardMenu(player)
			elseif data.current.value == "close" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenAcceptPendingMenu(ownerid)

	local elements = {
		{label = administratorLocal.accept ,value = "accept"},
		{label = administratorLocal.unaccept ,value = "unaccept"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'acceptgroup',
		{
			title  = administratorLocal.title,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "accept" then
				TriggerServerEvent('tm1_mafias:groupAccepted',ownerid)
				menu.close()
			else
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenIdentityCardMenu(player)
    ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)

      local jobLabel    = nil
      local sexLabel    = nil
      local sex         = nil
      local dobLabel    = nil
      local heightLabel = nil
      local idLabel     = nil

      if data.sex ~= nil then
        if (data.sex == 'm') or (data.sex == 'M') then
          sex = 'Hombre'
        else
          sex = 'Mujer'
        end
        sexLabel = 'Sexo : ' .. sex
      else
        sexLabel = 'Sexo : Desconocido'
      end

      if data.dob ~= nil then
        dobLabel = 'Fecha de nacimiento : ' .. data.dob
      else
        dobLabel = 'Fecha de nacimiento : Desconocido'
      end

      if data.height ~= nil then
        heightLabel = 'Altura : ' .. data.height
      else
        heightLabel = 'Altura : Desconocido'
      end

      if data.name ~= nil then
        idLabel = 'ID : ' .. data.name
      else
        idLabel = 'ID : Desconocido'
      end

      local elements = {
        {label = 'Nombre : ' .. data.firstname .. " " .. data.lastname, value = nil},
        {label = sexLabel,    value = nil},
        {label = dobLabel,    value = nil},
        {label = heightLabel, value = nil},
        {label = idLabel,     value = nil},
      }


      ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'citizen_interaction',
        {
          title    = 'DNI',
          align    = 'bottom-right',
          elements = elements,
        },
        function(data, menu)

        end,
        function(data, menu)
          menu.close()
        end
      )

    end, GetPlayerServerId(player))
end

function OpenAddPeopleMenu()

	ESX.TriggerServerCallback('tm1_mafias:requestPlayers', function(users)
		local elements = users
		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'addPerson',
		{
			title  = administratorLocal.title,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			TriggerServerEvent('tm1_mafias:pendingGroup',data.current.identifier,data.current.value)
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
		)
	end)
end

function OpenRemovePeopleMenu()
	ESX.TriggerServerCallback('tm1_mafias:requestGroupPlayers', function(users)
		local elements = users
		for a,b in pairs(elements) do
			if b.rango == 5 then
				b.label = b.label.." - ".."JEFE"
			elseif b.rango == 4 then
				b.label = b.label.." - ".."SUB-JEFE"
			elseif b.rango == 3 then
				b.label = b.label.." - ".."GANSTER"
			elseif b.rango == 2 then
				b.label = b.label.." - ".."NOVATO"
			elseif b.rango == 1 then
				b.label = b.label.." - ".."RECLUTA"
			end	
			
		end
		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'removePerson',
		{
			title  = administratorLocal.title,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if (group.rank == 4 or group.rank == 5) and data.current.rango == 5 then
				TriggerServerEvent('tm1_mafias:advert',administratorLocal.errorRank)
			else
			TriggerServerEvent('tm1_mafias:userRemoved',data.current.value,data.current.id)
			end
			ESX.UI.Menu.CloseAll()
		end,
		function(data, menu)
			menu.close()
		end
		)
	end)
end

function OpenAdministratePeopleMenu()
	ESX.TriggerServerCallback('tm1_mafias:requestGroupPlayers', function(users)
		local elements = users
		for a,b in pairs(elements) do
			if b.rango == 5 then
				b.label = b.label.." - ".."JEFE"
			elseif b.rango == 4 then
				b.label = b.label.." - ".."SUB-JEFE"
			elseif b.rango == 3 then
				b.label = b.label.." - ".."GANSTER"
			elseif b.rango == 2 then
				b.label = b.label.." - ".."NOVATO"
			elseif b.rango == 1 then
				b.label = b.label.." - ".."RECLUTA"
			end		
		end
		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'removePerson',
		{
			title  = administratorLocal.title,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			
				OpenPromoteMenu(data.current.label,data.current.rango,data.current.value)		
		end,
		function(data, menu)
			menu.close()
		end
		)
	end)
end

function OpenPromoteMenu(name,rango,steamid)

	local elements = {
		{label = administratorLocal.promote ,value = "promote"},
		{label = administratorLocal.unpromote ,value = "unpromote"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'promoteMenu',
		{
			title  = administratorLocal.promoteTitle..name.."?",
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "promote" then
				if group.rank == 4 and rango == 4 then
					TriggerServerEvent('tm1_mafias:advert',"No puedes autoascenderte a jefe.")
				else
					TriggerServerEvent('tm1_mafias:promotesSystem',group.groupid,rango,steamid,"promote")
				end
				menu.close()
			elseif data.current.value == "unpromote" then
				if group.rank == 4 and rango == 5 then
					TriggerServerEvent('tm1_mafias:advert',"No puedes degradar a un rango superior al tuyo.")
				else
				TriggerServerEvent('tm1_mafias:promotesSystem',group.groupid,rango,steamid,"unpromote")
				end
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenRemoveGroupMenu(group,opc)

	local elements = {
		{label = administratorLocal.yes ,value = "accept"},
		{label = administratorLocal.no ,value = "unaccept"}
	}
	if opc == "remove" then
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'acceptgroup',
			{
				title  = administratorLocal.removeGroupTitle..group.name.."?",
				align    = 'bottom-right',
				elements = elements
			},
			function(data, menu)
				if data.current.value == "accept" then
					TriggerServerEvent("tm1_mafias:RemoveGroup",group.groupid)
					menu.close()
				else
					menu.close()
				end
			end,
			function(data, menu)
				menu.close()
			end
		)
	elseif opc == "exit" then
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'exitgroup',
			{
				title  = administratorLocal.exitGroupQ,
				align    = 'bottom-right',
				elements = elements
			},
			function(data, menu)
				if data.current.value == "accept" then
					TriggerServerEvent("tm1_mafias:exitGroup",group.groupid)
					menu.close()
				else
					menu.close()
				end
			end,
			function(data, menu)
				menu.close()
			end
		)
	end
end

RegisterNetEvent('tm1_mafias:acceptPending')
AddEventHandler('tm1_mafias:acceptPending',function(ownerid)
	OpenAcceptPendingMenu(ownerid)
end)


local dragStatus, isHandcuffed, wasDragged = {}, false, false
dragStatus.isDragged = false

RegisterNetEvent('tm1_mafias:handcuff')
AddEventHandler('tm1_mafias:handcuff', function()
	isHandcuffed = not isHandcuffed
	local playerPed = PlayerPedId()

	if isHandcuffed then
		RequestAnimDict('mp_arresting')
		while not HasAnimDictLoaded('mp_arresting') do
			Citizen.Wait(100)
		end

		TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

		SetEnableHandcuffs(playerPed, true)
		DisablePlayerFiring(playerPed, true)
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
		SetPedCanPlayGestureAnims(playerPed, false)
		FreezeEntityPosition(playerPed, true)
		DisplayRadar(false)

	else
		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)
	end
end)

RegisterNetEvent('tm1_mafias:unrestrain')
AddEventHandler('tm1_mafias:unrestrain', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		isHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)
	end
end)

RegisterNetEvent('tm1_mafias:drag')
AddEventHandler('tm1_mafias:drag', function(copId)
	if isHandcuffed then
		dragStatus.isDragged = not dragStatus.isDragged
		dragStatus.CopId = copId
	end
end)

Citizen.CreateThread(function()
	local wasDragged

	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if isHandcuffed and dragStatus.isDragged then
			local targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))

			if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and not IsPedDeadOrDying(targetPed, true) then
				if not wasDragged then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
					wasDragged = true
				else
					Citizen.Wait(1000)
				end
			else
				wasDragged = false
				dragStatus.isDragged = false
				DetachEntity(playerPed, true, false)
			end
		elseif wasDragged then
			wasDragged = false
			DetachEntity(playerPed, true, false)
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('tm1_mafias:putInVehicle')
AddEventHandler('tm1_mafias:putInVehicle', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if IsAnyVehicleNearPoint(coords, 5.0) then
			local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

			if DoesEntityExist(vehicle) then
				local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

				for i=maxSeats - 1, 0, -1 do
					if IsVehicleSeatFree(vehicle, i) then
						freeSeat = i
						break
					end
				end

				if freeSeat then
					TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
					dragStatus.isDragged = false
				end
			end
		end
	end
end)

RegisterNetEvent('tm1_mafias:OutVehicle')
AddEventHandler('tm1_mafias:OutVehicle', function()
	local playerPed = PlayerPedId()

	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		TaskLeaveVehicle(playerPed, vehicle, 16)
	end
end)