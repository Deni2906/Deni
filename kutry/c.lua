function isEventHandlerAdded(sEventName,pElementAttachedTo,func)
	if type(sEventName)=='string' and isElement(pElementAttachedTo) and type(func)=='function' then local aAttachedFunctions = getEventHandlers(sEventName,pElementAttachedTo)
	if type(aAttachedFunctions)=='table' and #aAttachedFunctions > 0 then for i,v in ipairs(aAttachedFunctions) do if v==func then return true end end end
	end return false
end

local sx, sy = guiGetScreenSize()
sw = function(value)
    return sx*value/1920    
end
            
sh = function(value)    
    return sy*value/1080
end

local regular = dxCreateFont("f/regular.ttf", sw(12))
local bold = dxCreateFont("f/bold.ttf", sw(17))

setTimer(function()
  if getElementData(localPlayer, "plr:sweeper:time") then
    setElementData(localPlayer, "plr:sweeper:time", getElementData(localPlayer, "plr:sweeper:time") + 1)
  end
end, 1000, 0)

function secondsToTimeSweeper(seconds)
local minutes = string.format("%02.f", math.floor(seconds/60))
local seconds = string.format("%02.f", seconds - (minutes * 60))
return {minutes, seconds}
end

function OknoKG()
		local a = interpolateBetween(0,0,255,255,0,255,((getTickCount()-tick)/3000),"Linear") 
		local a2 = interpolateBetween(0,0,141,141,0,141,((getTickCount()-tick)/3000),"Linear") 
    local veh = getPedOccupiedVehicle(localPlayer)
    local kilo = getElementData(veh, "viewki" ) or 0
    local time = getElementData(localPlayer, "plr:sweeper:time") or 0
       -- dxDrawImage(screenW * 0.3661, screenH * 0.7917, screenW * 0.2682, screenH * 0.1296, speedo )
       -- dxDrawText("Ilość zebranych śmieci:\n"..string.format("%0.2f",kilo).." kg", screenW * 0.3667, screenH * 0.7917, screenW * 0.6344, screenH * 0.9213, tocolor(255, 255, 255, a), 1*w, bold, "center", "center", false, false, false, false, false)
        dxDrawRectangle(sw(1620), sh(453), sw(252), sh(168), tocolor(23, 23, 23, 255), false)
        dxDrawRectangle(sw(1597), sh(408), sw(303), sh(45), tocolor(29, 29, 29, 255), false)
        dxDrawRectangle(sw(1620), sh(453), sw(252), sh(3), tocolor(204, 102, 51, 255), false)
        dxDrawRectangle(sw(1620), sh(618), sw(252), sh(3), tocolor(204, 102, 51, 255), false)
        dxDrawText("Praca łowienia ryb, pływaj po \nmapie w celu łowienia ryb.\nLimit 150kg ryb.", sw(1620), sh(495), sw(1872), sh(678), tocolor(215, 215, 215, 255), 1.00, regular, "center", "top", false, false, false, false, false)
        dxDrawText("ŁOWIENIE RYB", sw(1582), sh(408), sw(1910), sh(453), tocolor(225, 225, 225, 255), 1.00, bold, "center", "center", false, true, false, false, false)
        dxDrawText("Zebrane ryby", sw(1620), sh(557), sw(1872), sh(597), tocolor(255, 255, 255, 255), 1.00, bold, "center", "center", false, true, false, false, false)
        dxDrawText(string.format("%0.2f",kilo).." kg ryb", sw(1620), sh(591), sw(1872), sh(621), tocolor(215, 215, 215, 255), 1.00, regular, "center", "top", false, true, false, false, false)
        dxDrawText("Czas pracy: ".. secondsToTimeSweeper(time)[1] .. "m " .. secondsToTimeSweeper(time)[2] .. "s", sw(1620), sh(470), sw(1872), sh(500), tocolor(215, 215, 215, 255), 1.00, regular, "center", "top", false, true, false, false, false)
end

function PokazKG() 
addEventHandler("onClientRender",root,OknoKG)
tick = getTickCount()
setElementData(localPlayer, 'plr:sweeper:time', 0)
end
addEvent("PokazKGokno", true)
addEventHandler("PokazKGokno", getRootElement(), PokazKG)

function UsunKG() 
removeEventHandler("onClientRender",root,OknoKG)
end
addEvent("UsunKGokno", true)
addEventHandler("UsunKGokno", getRootElement(), UsunKG)

addEventHandler("onClientRender",root,function ()
   local veh = getPedOccupiedVehicle(localPlayer)
   if not veh then return end
    if getElementModel(veh) ~= 453 then return end
   local sx,sy,sz = getElementVelocity(veh)
   local kmhs = math.ceil(((sx^2+sy^2+sz^2)^(0.5))*155)
   if kmhs >= 24 then
   local view = getElementData(veh,"viewki")
   if view >= 150 then return end
        local view = view + 0.003
        local viewki = setElementData(veh,"viewki",view)
    end
end)

function roundedRectangle(x, y, w, h, color)
  dxDrawRectangle(x, y, w, h, color, false)
  dxDrawRectangle(x + 2, y - 1, w - 4, 1, color, false)
  dxDrawRectangle(x + 2, y + h, w - 4, 1, color, false)
  dxDrawRectangle(x - 1, y + 2, 1, h - 4, color, false)
  dxDrawRectangle(x + w, y + 2, 1, h - 4, color, false)
end

