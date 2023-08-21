RegisterServerEvent("SnkCarThief:aggiungisoldi")
AddEventHandler("SnkCarThief:aggiungisoldi", function(money)
     local xPlayer = ESX.GetPlayerFromId(source) 
     xPlayer.addMoney(money)
    end)

RegisterServerEvent("SnkCarThief:aggiungiitem")
AddEventHandler("SnkCarThief:aggiungiitem", function(item, count)
     local xPlayer = ESX.GetPlayerFromId(source) 
     xPlayer.addInventoryItem(item, count)
end)

