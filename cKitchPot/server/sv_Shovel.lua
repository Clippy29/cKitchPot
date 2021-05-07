if Config.ESX then 
	ESX = nil

	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	RegisterServerEvent('KitchPot:GiveOr')
	AddEventHandler('KitchPot:GiveOr', function(count)
		local _source = source
		local xPlayer = ESX.GetPlayerFromId(source)

		local total = math.random(0, 100)

		if total <= Config.Chance then 
			xPlayer.addInventoryItem(Config.ItemOr, count)
			xPlayer.removeInventoryItem(Config.ItemTerre, 1)
			TriggerClientEvent('esx:showNotification', source, "Vous avez trouvé ~y~"..count.." pépites d'or~s~ dans la terre.")
		else 
			TriggerClientEvent('esx:showNotification', source, Config.Notif.DontFindTerre)
			xPlayer.removeInventoryItem(Config.ItemTerre, 1)
		end
	end)

	RegisterServerEvent('KitchPot:GiveTerre')
	AddEventHandler('KitchPot:GiveTerre', function(count)
		local _source = source
		local xPlayer = ESX.GetPlayerFromId(source)

		local total = math.random(0, 100)

		if total <= Config.Chance then 
			xPlayer.addInventoryItem(Config.ItemOr, count)
			xPlayer.removeInventoryItem(Config.ItemTerre, 1)
			TriggerClientEvent('esx:showNotification', source, "Vous avez trouvé ~b~"..count.."g de terre~s~ dans l'eau.")
		else 
			TriggerClientEvent('esx:showNotification', source, Config.Notif.DontFindWater)
			xPlayer.removeInventoryItem(Config.ItemTerre, 1)
		end
	end)

	RegisterServerEvent("KitchPot:BrokenCasserolle")
	AddEventHandler("KitchPot:BrokenCasserolle",function()
		local xPlayer = ESX.GetPlayerFromId(source)

		xPlayer.removeInventoryItem(Config.ItemCasserolle, 1)
	end)

	ESX.RegisterUsableItem(Config.ItemCasserolle, function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
		local TerreCount = xPlayer.getInventoryItem(Config.ItemTerre).count

		if TerreCount >= 1 then 
			TriggerClientEvent('KitchPot:CheckCasserolle', source)
		else
			TriggerClientEvent('esx:showNotification', source, Condif.Notif.NotCountTerre)
		end
	end)
else
	print('^4Adapt the server rating for your Framework !')
end
