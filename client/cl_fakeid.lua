ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent(Config.Events["esx:getSharedObject"], function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

-- Création du ped
Citizen.CreateThread(function()
    LoadModel(Config.Ped)
    ped = CreatePed(2, GetHashKey(Config.Ped), Config.Position, Config.Heading, 0, 0)
    DecorSetInt(ped, "Yay", 5431)
    FreezeEntityPosition(ped, 1)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, 1)
end)

function LoadModel(model)
while not HasModelLoaded(model) do
    RequestModel(model)
    Wait(1)
end
end

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, "", inputText, "", "", "", maxLength)
	blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
		blockinput = false
        return result
    else
        Citizen.Wait(500)
		blockinput = false
        return nil
    end
end

function tFakeID()
    local tFakeID = RageUI.CreateMenu(Config.PedName, "tFakeID")

    RageUI.Visible(tFakeID, not RageUI.Visible(tFakeID))

    while tFakeID do
        
        Citizen.Wait(0)

        RageUI.IsVisible(tFakeID, true, true, true, function()
    
            RageUI.Separator("→ ~r~ Changer d'identité ~s~ ←")
            RageUI.Button("Changer de prénom", nil, {RightLabel = "~g~" .. Config.PriceFirstname .. "$"}, true, function(Hovered, Active, Selected)
            if (Selected) then
                EditFirstName()
                end
            end)
            RageUI.Button("Changer de nom", nil, {RightLabel = "~g~" .. Config.PriceLastname .. "$"}, true, function(Hovered, Active, Selected)
            if (Selected) then
                EditLastName()
                end
            end)

        end)

        if not RageUI.Visible(tFakeID) then
            tFakeID = RMenu:DeleteType("tFakeID", true)
        end
    end
end

Citizen.CreateThread(function()
    while true do
        local interval = 750
        
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.Position)

        if dist <= 1.5 then
            interval = 1
            draw2dText(("Appuyez sur [~r~E~s~] pour parler à " .. Config.PedName), { 0.424, 0.955 } )
            --ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour ~b~intéragir")
            if IsControlJustPressed(1,51) then
                tFakeID()
            end
     
        end

        Citizen.Wait(interval)
    
    end

end)

function EditFirstName()
	local firstName = KeyboardInput("tFakeIDFirstname", 'Quel est ton nouveau prénom ?', "", 15)

	if firstName ~= nil then
		firstName = tostring(firstName)
		
		if type(firstName) == 'string' then
			TriggerServerEvent('tFakeID:setFirstname', GetPlayerServerId(PlayerId()), firstName)
		end
	end
end

function EditLastName()
	local lastName = KeyboardInput("tFakeIDLastname", 'Quel est votre nouveau nom de famille ?', "", 15)

	if lastName ~= nil then
		lastName = tostring(lastName)
		
		if type(lastName) == 'string' then
			TriggerServerEvent('tFakeID:setLastname', GetPlayerServerId(PlayerId()), lastName)
		end
	end
end 

function draw2dText(text, pos)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextScale(0.55, 0.55)
	SetTextColour(255, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(table.unpack(pos))
end