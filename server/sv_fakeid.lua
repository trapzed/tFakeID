ESX = nil

print("")
print("[^5tFakeId^7] - Made by TrapZed#1725^7")
print("")

TriggerEvent(Config.Events["esx:getSharedObject"], function(obj) ESX = obj end)

RegisterServerEvent('tFakeID:setFirstname')
AddEventHandler('tFakeID:setFirstname', function(ID, firstName)
    local identifier = ESX.GetPlayerFromId(ID).identifier

	local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	local blackMoney = xPlayer.getAccount(Config.ArgentSale)

	local price = Config.PriceFirstname

	if blackMoney.money >= price then
        local firstname = xPlayer.getName()
        xPlayer.removeAccountMoney(Config.ArgentSale, price)
		SetFirstName(identifier, firstName)
        TriggerClientEvent(Config.Events["esx:showNotification"], source, "Votre ~g~prénom~s~ a été changé !")
	else
		TriggerClientEvent(Config.Events["esx:showNotification"], source, "Vous n'avez assez ~r~d\'argent")
	end
end)

RegisterServerEvent('tFakeID:setLastname')
AddEventHandler('tFakeID:setLastname', function(ID, lastName)
    local identifier = ESX.GetPlayerFromId(ID).identifier
	local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	local blackMoney = xPlayer.getAccount(Config.ArgentSale)

	local price = Config.PriceLastname

	if blackMoney.money >= price then
		local newlastname = xPlayer.getName()
        xPlayer.removeAccountMoney(Config.ArgentSale, price)
		SetLastName(identifier, lastName)
		TriggerClientEvent(Config.Events["esx:showNotification"], source, "Votre ~g~nom~s~ a été changé !")

	else
		TriggerClientEvent(Config.Events["esx:showNotification"], source, "Vous n'avez assez ~r~d\'argent")
	end
end)

function SetFirstName(identifier, firstName)
	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@firstname']		= firstName
	})
end

function SetLastName(identifier, lastName)
	MySQL.Async.execute('UPDATE `users` SET `lastname` = @lastname WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@lastname']		= lastName
	})
end