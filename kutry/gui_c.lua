--[[
    AUTHOR: Deni*
]]--

local sx, sy = guiGetScreenSize()
local job = {}
sw = function(value)
    return sx*value/1920    
end
            
sh = function(value)    
    return sy*value/1080
end

--
startJobX, startJobY, startJobZ = -1728.00,199.18,3.55
--

inPos = function(psx, psy, pssx, pssy, abx, aby)

    if not isCursorShowing() then return end

    cx, cy = getCursorPosition()
    cx, cy = cx * sx, cy * sy

    if cx >= psx and cx <= psx + pssx and cy >= psy and cy <= psy + pssy then
        return true, cx, cy
    else
        return false
    end

end

getButton = function(text, posx, posy, posw, posh, font)
    if inPos(posx, posy, posw, posh) then
        dxDrawRectangle(posx, posy, posw, posh, tocolor(32, 32, 32, 245))
        dxDrawRectangle(posx, posy+(posh-2), posw, 2, tocolor(204, 102, 51, 255))
        dxDrawText(text, posx, posy, posw + posx, posh + posy, 0xFFFFFFFF, 1, font, "center", "center", false, false, true)
    else
        dxDrawRectangle(posx, posy, posw, posh, tocolor(29, 29, 29, 255))
        dxDrawRectangle(posx, posy+(posh-2), posw, 2, tocolor(204, 102, 51, 255))
        dxDrawText(text, posx, posy, posw + posx, posh + posy, 0xFFE1E1E1, 1, font, "center", "center", false, false, true)
    end
    if(getKeyState("mouse1") and isCursorShowing()) then
        if inPos(posx, posy, posw, posh) then
            dxDrawRectangle(posx, posy, posw, posh, tocolor(35, 35, 35, 245))
            dxDrawRectangle(posx, posy+(posh-2), posw, 2, tocolor(204, 102, 51, 255))
        end
    end
end

local bold = dxCreateFont("f/bold.ttf", 23) or "default-bold"
local bold2 = dxCreateFont("f/bold.ttf", 16) or "default-bold"
local regular = dxCreateFont("f/regular.ttf", 15) or "default"

job.showJobGUI = function()
    dxDrawRectangle(sw(670), sh(297), sw(580), sh(492), tocolor(23, 23, 23, 245))
    dxDrawRectangle(sw(670), sh(297), sw(580), sh(56), tocolor(204, 102, 51, 255))
    dxDrawRectangle(sw(670), sh(787), sw(580), sh(2), tocolor(204, 102, 51, 255))
    dxDrawRectangle(sw(660), sh(294), sw(600), sh(57), tocolor(29, 29, 29, 255))
    if action == 'main' then
    dxDrawImage(sw(680), sh(373), sw(323), sh(186), 'sweeper.png')
    dxDrawRectangle(sw(680), sh(557), sw(323), sh(2), tocolor(204, 102, 51, 255))
    getButton('ULEPSZENIA', sw(680), sh(737), sw(180), sh(42), bold2)
    getButton('ZAMKNIJ OKNO', sw(870), sh(737), sw(180), sh(42), bold2)
    getButton('RANKING', sw(1060), sh(737), sw(180), sh(42), bold2)
    dxDrawText("Opis pracy", sw(680), sh(560), sw(858), sh(446), tocolor(255, 255, 255, 255), 1.00, bold2, "left", "top", false, true, false, false, false)
    dxDrawText("Praca polega na łowieniu ryb, aby rozpocząć wsiądź do jednego z kutrów.", sw(680), sh(585), sw(998), sh(562), tocolor(255, 255, 255, 255), 1.00, regular, "left", "top", false, true, false, false, false)
    dxDrawText("Wymagania", sw(1061), sh(365), sw(1241), sh(446), tocolor(255, 255, 255, 255), 1.00, bold2, "right", "top", false, false, false, false, false)
    dxDrawText("Brak - ", sw(1061), sh(386), sw(1241), sh(467), tocolor(255, 255, 255, 255), 1.00, regular, "right", "top", false, false, false, false, false)
    dxDrawText("Wynagrodzenie", sw(1061), sh(560), sw(1241), sh(706), tocolor(255, 255, 255, 255), 1.00, bold2, "right", "top", false, false, false, false, false)
    dxDrawText("850,000 PLN/kg -", sw(921), sh(585), sw(1241), sh(738), tocolor(255, 255, 255, 255), 1.00, regular, "right", "top", false, false, false, false, false)
    dxDrawText("PRACA DORYWCZA", sw(660), sh(280), sw(1260), sh(351), tocolor(255, 255, 255, 255), 1.00, bold, "center", "center", false, false, false, false, false)
    dxDrawText("Łowienie ryb", sw(660), sh(275), sw(1260), sh(347), tocolor(185, 185, 185, 255), 1.00, regular, "center", "bottom", false, false, false, false, false)
    elseif action == 'addons' then
       -- dxDrawText("ulepszenia", sw(680), sh(560), sw(858), sh(446), tocolor(255, 255, 255, 255), 1.00, bold2, "left", "top", false, true, false, false, false)
        getButton('POWRÓT', sw(870), sh(737), sw(180), sh(42), bold2)
        dxDrawText("Łowienie ryb", sw(660), sh(280), sw(1260), sh(351), tocolor(255, 255, 255, 255), 1.00, bold, "center", "center", false, false, false, false, false)
        dxDrawText("ULEPSZENIA", sw(660), sh(275), sw(1260), sh(347), tocolor(185, 185, 185, 255), 1.00, regular, "center", "bottom", false, false, false, false, false)
    elseif action == 'ranks' then
      --  dxDrawText("ranking", sw(680), sh(560), sw(858), sh(446), tocolor(255, 255, 255, 255), 1.00, bold2, "left", "top", false, true, false, false, false)
        getButton('POWRÓT', sw(870), sh(737), sw(180), sh(42), bold2)
        dxDrawText("Łowienie ryb", sw(660), sh(280), sw(1260), sh(351), tocolor(255, 255, 255, 255), 1.00, bold, "center", "center", false, false, false, false, false)
        dxDrawText("RANKING", sw(660), sh(275), sw(1260), sh(347), tocolor(185, 185, 185, 255), 1.00, regular, "center", "bottom", false, false, false, false, false)
        dxDrawText("TOP", sw(697), sh(361), sw(829), sh(393), tocolor(255, 255, 255, 255), 1.00, bold2, "left", "top", false, false, false, false, false)
        dxDrawText("KG", sw(1088), sh(361), sw(1220), sh(393), tocolor(255, 255, 255, 255), 1.00, bold2, "right", "top", false, false, false, false, false)
        dxDrawText("GRACZ", sw(697), sh(361), sw(1220), sh(393), tocolor(255, 255, 255, 255), 1.00, bold2, "center", "top", false, false, false, false, false)
        for i, v in pairs(top) do
            local add_y = sh(30) * ( i - 1 );
            if not inPos(sw(688), sh(393) + add_y, sw(544), sh(21)) then
                dxDrawRectangle(sw(688), sh(393) + add_y, sw(544), sh(21), tocolor(23, 23, 23, 165))
            else
                dxDrawRectangle(sw(688), sh(393) + add_y, sw(544), sh(21), tocolor(23, 23, 23, 235))
            end
            dxDrawText(i..'.', sw(697), sh(391) + add_y, sw(829), sh(393) + add_y, tocolor(255, 255, 255, 255), 1.00, regular, "left", "top", false, false, false, false, false)
            dxDrawText(v.name, sw(697), sh(391) + add_y, sw(1220), sh(393) + add_y, tocolor(255, 255, 255, 255), 1.00, regular, "center", "top", false, false, false, false, false)
            dxDrawText(string.format("%0.2f",v.viewki), sw(1088), sh(391) + add_y, sw(1220), sh(393) + add_y, tocolor(255, 255, 255, 255), 1.00, regular, "right", "top", false, false, false, false, false)
        end
    end
end

job.hideJobGUI = function()
    removeEventHandler("onClientRender", root, job.showJobGUI)	
	showCursor(false)
end

job.actions = function(btn, state)
    if btn=="left" and state=="down" and action == 'main' and inPos(sw(870), sh(737), sw(180), sh(42)) then
        job.hideJobGUI()
    elseif btn=="left" and state=="down" and action == 'main' and inPos(sw(680), sh(737), sw(180), sh(42)) then
        action = 'addons'
    elseif btn=="left" and state=="down" and action == 'main' and inPos(sw(1060), sh(737), sw(180), sh(42)) then
        action = 'ranks'
    elseif btn=="left" and state=="down" and action == 'addons' or action == 'ranks' and inPos(sw(870), sh(737), sw(180), sh(42)) then
        action = 'main'
    end
end
addEventHandler("onClientClick", root, job.actions)


job.startRes = function()
    jobMarker = createMarker(startJobX, startJobY, startJobZ-0.99, "cylinder", 1)
    col = createColSphere(startJobX, startJobY, startJobZ, 2)
    
	addEventHandler("onClientColShapeHit", col, function(el, md)
        if el == localPlayer and md and not isPedInVehicle(el) then
			    if getElementData(localPlayer, "player:job") then 
                    outputChatBox('Masz już rozpoczętą pracę!', 255, 255, 255, true)
				    return
                end
                addEventHandler('onClientRender', root, job.showJobGUI)
                showCursor(true)
                action = 'main'
                triggerServerEvent('showTop', resourceRoot, localPlayer)
            end
        end
    )
end
addEventHandler("onClientResourceStart", resourceRoot, job.startRes)


addEvent('showTop:client', true)
addEventHandler('showTop:client', resourceRoot, function( table )
    top = table
end)