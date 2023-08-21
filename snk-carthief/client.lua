ESX = exports.es_extended:getSharedObject()
local display = false


RegisterNetEvent('SnkCarThief:setdisplay')
AddEventHandler('SnkCarThief:setdisplay', function(bool) 
    display = bool     
    SetNuiFocus(bool, bool)     
    SendNUIMessage({ type = "ui",  status = bool, })
end )



RegisterNetEvent('SnkCarThief:prendimacchina')
AddEventHandler('SnkCarThief:prendimacchina', function()
	local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
	local posizione = vector3(1922.4496, -984.0522, 78.7242)


 ESX.Game.SpawnVehicle('bf400', coords.xyz, heading, function(entity)       
        TaskWarpPedIntoVehicle(ped, entity, -1)
		TriggerEvent('esx:showNotification', 'hai preso il veicolo dal garage')
		Wait(5000)
		TriggerEvent('esx:showNotification', 'Recati alla macchina')
		waypoint = SetNewWaypoint(posizione)
		
		

end)
end)

RegisterNetEvent('SnkCarThief:iniziamissione')
AddEventHandler('SnkCarThief:iniziamissione', function()
	Rubalamacchina()
end)

Rubalamacchina = function()
	local ciao = vector3(746.07232666016,1293.8525390625,360.29635620117)

	ESX.Game.SpawnVehicle('t20', vector3(1922.4496, -984.0522, 78.7242), heading, function() 
		end)
	waypoint = SetNewWaypoint(ciao)
	local vendiauto = AddBlipForCoord(ciao)
    SetBlipSprite (vendiauto, 811)
    SetBlipDisplay(vendiauto, 6)
    SetBlipScale  (vendiauto, 0.9)
    SetBlipColour (vendiauto, 1)
    SetBlipAsShortRange(vendiauto, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("Consegna l'auto")
    EndTextCommandSetBlipName(vendiauto)

    while true do
        Citizen.Wait(0)
        
        local playerPed = GetPlayerPed(-1)
        local playerCoords = GetEntityCoords(playerPed)
        
        if Vdist(playerCoords.x, playerCoords.y, playerCoords.z, ciao.x, ciao.y, ciao.z) < 5.0 then
            if IsPedInAnyVehicle(playerPed, false) then
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                DeleteEntity(vehicle)
                TriggerServerEvent("SnkCarThief:aggiungisoldi", 25000)
                RemoveBlip(vendiauto)
            end
        end
    end
end

Citizen.CreateThread(function()
    if not HasModelLoaded('a_m_y_smartcaspat_01') then
       RequestModel('a_m_y_smartcaspat_01')
       while not HasModelLoaded('a_m_y_smartcaspat_01') do
          Citizen.Wait(5)
       end
    end

    Npc = CreatePed(4, 'a_m_y_smartcaspat_01', -2177.7310, 4269.8906, 48.0372, 244.0129, false, true)
    FreezeEntityPosition(Npc, true)
    SetEntityInvincible(Npc, true)
    SetBlockingOfNonTemporaryEvents(Npc, true)
end)

RegisterNUICallback('exit', function()
    TriggerEvent('SnkCarThief:setdisplay', false)
 end)

 RegisterNUICallback('main', function()
	TriggerEvent('SnkCarThief:prendimacchina')
	TriggerEvent('SnkCarThief:setdisplay', false)
	TriggerEvent('SnkCarThief:iniziamissione')
	--TriggerEvent('SnkCarThief:iniziamissione')
 end)

 RegisterNUICallback('give', function()
	TriggerServerEvent("SnkCarThief:aggiungiitem", "weapon_bat", 1)
	TriggerServerEvent("SnkCarThief:aggiungiitem", "gopro", 1)
	TriggerEvent('SnkCarThief:setdisplay', false)
 end)

 RegisterNuiCallback('astuzia', function()
	TriggerServerEvent("SnkCarThief:aggiungiitem", "grimaldello", 1)
	TriggerServerEvent("SnkCarThief:aggiungiitem", "gopro", 1)
	TriggerEvent('SnkCarThief:setdisplay', false)
 end)





Citizen.CreateThread(function()

	TriggerEvent('gridsystem:registerMarker', {
		name = "asdasdasd",
		pos = vector3(-2177.2666, 4269.5840, 49.0205),
		size = vector3(1.2, 1.2, 1.2),
		scale = vector3(0.8, 0.8, 0.8),
		control = 'E',
		rotate = 0.0,
		rotate2 = 0.0,
		shouldBob = false,
		shouldRotate = true,
		color = { r = 255, g = 255, b = 255 },
		trasparent = 255,
		type = 21,
		msg = 'Casa Popolare',
		action = function()
			CreateThread(function()
				TriggerEvent('SnkCarThief:setdisplay', true)
				while display do 
					DisableControlAction(0,1, display)
    				DisableControlAction(0,142, display)
    				DisableControlAction(0,18, display)
    				DisableControlAction(0,322, display)
    				DisableControlAction(0,2, display)
    				DisableControlAction(0,106, display)
					Wait(0)
				end
			end)
		end
	})
end)





