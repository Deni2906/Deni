local districtsBus = {
	-- TRASA SF --
    {-1632.78, -149.59, 13.77},
	{-1622.47, -118.26, 13.77},
	{-1573.27, -86.56, 13.78},
	{-1535.26, -78.05, 13.78},
	{-1487.96, -79.14, 13.78},
	{-1446.29, -53.60, 13.78},
	{-1441.19, -3.57, 13.78},
	{-1449.05, 29.65, 13.77},
	{-1431.28, 50.50, 13.78},
	{-1399.74, 84.50, 13.77},
	{-1387.61, 114.24, 13.78},
	{-1352.89, 129.59, 13.77},
	{-1314.95, 190.72, 13.78},
	{-1269.09, 199.42, 13.77},
	{-1259.08, 139.53, 13.77},
	{-1274.12, 100.64, 13.78},
	{-1307.70, 37.84, 13.78},
	{-1306.80, -15.36, 13.78},
	{-1302.77, -73.23, 13.78},
	{-1283.94, -125.54, 13.78},
	{-1242.38, -168.73, 13.78},
	{-1197.04, -233.50, 13.78},
	{-1220.72, -262.33, 13.78},
	{-1263.70, -280.32, 13.78},
	{-1316.67, -295.14, 13.77},
	-- TRASA LAS VENTURAS --
}

local jobTarget
local jobMarker
local jobVehicle
local maxTarget = #districtsBus

function finishJob()
    if jobMarker and isElement(jobMarker) then
        destroyElement(jobMarker)
        jobMarker = nil
    end
    
    if jobTarget and isElement(jobTarget) then
        destroyElement(jobTarget)
        jobTarget = nil
        jobTarget = 0
        
    end
    
triggerServerEvent("destroyVeh", localPlayer)

end


function busDriver(el, md)
    if el ~= localPlayer or not md then return end
    if jobTarget > maxTarget and getPedOccupiedVehicle(el) then return end
    if jobTarget == maxTarget and not getPedOccupiedVehicle(el) then return end
    
    if jobTarget == #districtsBus then
        finishJob()
        playSoundFrontEnd(5)
        outputChatBox("* Zakończyłeś(aś) pracę.")
		destroyElement(blip)
		setElementData(el, "blokada:reczny_latdziur", false)
    else
        showMarker()
        playSoundFrontEnd(12)
		setTimer(function()
        --triggerServerEvent("givePlayerMoney", localPlayer, 12, 0)
		if getElementData(localPlayer,"player:premium") then
		triggerServerEvent("givePlayerMoney", localPlayer, 350, 0)
		setElementData(localPlayer,"player:srp", getElementData(localPlayer,"player:srp")+math.random(0,1))
		else
		triggerServerEvent("givePlayerMoney", localPlayer, 300, 0)
		setElementData(localPlayer,"player:srp", getElementData(localPlayer,"player:srp")+math.random(0,1))
		end
		end, 8000, 1)
    end
end

function showMarker()
    if jobMarker and isElement(jobMarker) then
		local veh=getPedOccupiedVehicle(localPlayer)
		if not veh then return end
		if getVehicleController(veh) ~= localPlayer then return end
        --outputChatBox("* Załatałeś(aś) dziure. Jedź do kolejnej dziury.")
        --destroyElement(jobMarker)
        --jobMarker = nil
		
		outputChatBox("* Naprawiasz część lotniska, odczekaj 10 sekund.")
		--destroyElement(blip)
		setElementFrozen(veh, true)
		setTimer(function()
		setElementFrozen(veh, false)
		outputChatBox("* Naprawiłeś część lotniska. Jedź do kolejnego miejsca.")
        --destroyElement(jobMarker)
        --jobMarker = nil
		end, 8000, 1)
		destroyElement(jobMarker)
		destroyElement(blip)
        jobMarker = nil
		
    end
    
    jobTarget = jobTarget + 1
    jobMarker = createMarker(districtsBus[jobTarget][1], districtsBus[jobTarget][2], districtsBus[jobTarget][3], "checkpoint", 2.5, 255, 255, 255)
    blip = createBlipAttachedTo(jobMarker, 41)
	
    if districtsBus[jobTarget+1] then
        ile = districtsBus[jobTarget+1]
        setMarkerTarget(jobMarker, ile[1], ile[2], ile[3])
    end
    
    addEventHandler("onClientMarkerHit", jobMarker, busDriver)
end

addEvent("STARTJobBus", true)
addEventHandler("STARTJobBus", resourceRoot, function(veh)
    outputChatBox("* Rozpocząłeś(aś) pracę.")
    jobVehicle = veh
    jobTarget = 0
    showMarker()
end)

addEventHandler("onClientResourceStop", resourceRoot, function()
    if jobVehicle and getElementData(localPlayer, "player:job") then
        setElementData(localPlayer, "player:job", false)
    end
end)

addEventHandler("onClientVehicleExit", resourceRoot, function(plr, seat)
    if seat == 0 then
        if plr == localPlayer then
            finishJob()
			destroyElement(blip)
            outputChatBox("#51c26f>> #ffffffZakończyłeś pracę.",255,255,255,true)
			setElementPosition(localPlayer,-1324.75, -334.73, 14.15)
        end
    end
end)