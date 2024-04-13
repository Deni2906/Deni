createBlip(-1728.94,220.95,3.55,46,2,0,0,0,0,0,275) -- sf
createBlip(2950.70,-2052.28,1.07,46, 2,0,0,0,0,0,275) -- ls
createBlip(1629.69,570.43,1.07,46, 2,0,0,0,0,0,275) -- lv
createBlip(-2196.27,2429.11,-0.52, 46, 2,0,0,0,0,0,275) -- sf bayside marina

local ustawioneAuta = {
	-- sf easter basin
	{-1711.15, 219.36, -0.38, 359.6, 359.8, 179.6},
	{-1711.42, 206.57, -0.34, 359.6, 359.9, 179.6},
	{-1711.21, 192.78, -0.36, 359.6, 359.8, 180.7},
	{-1711.36, 178.49, -0.38, 359.6, 359.8, 181.0},
	{-1710.89, 164.55, -0.36, 359.6, 359.8, 179.2},
	{-1711.58, 149.58, -0.36, 359.6, 359.8, 180.7},
	{-1709.70, 134.72, -0.38, 359.6, 359.8, 197.6},
	{-1701.58, 122.33, -0.35, 359.6, 359.8, 221.2},
	{-1689.34, 109.67, -0.35, 359.6, 359.8, 226.5},
	{-1673.30, 115.15, -0.35, 359.6, 359.8, 314.5},
	{-1656.24, 131.90, -0.35, 359.5, 359.9, 314.5},
	{-1640.67, 147.16, -0.35, 359.5, 359.9, 314.4},
	{-1621.97, 165.14, -0.14, 359.6, 359.9, 315.5},
	{-1608.03, 178.28, -0.35, 359.6, 359.9, 311.7},
	{-1592.97, 161.27, -0.37, 359.6, 359.8, 227.1},

	-- ls
	{2920.34, -2045.36, 0.02, 352.9, 359.9, 267.6},
	{2926.55, -2045.79, -0.35, 359.6, 359.9, 270.8},
	{2942.62, -2045.57, -0.35, 359.6, 359.9, 270.8},
	{2928.84, -2058.59, -0.36, 359.6, 359.7, 268.0},
	{2949.10, -2051.92, -0.02, 359.6, 359.7, 271.6},

	-- lv
	{1639.90, 591.43, -0.45, 359.6, 359.9, 181.7},
	{1639.11, 573.37, -0.36, 359.5, 359.9, 178.3},
	{1618.14, 592.89, -0.35, 359.6, 359.9, 180.4},
	{1618.28, 577.33, -0.35, 359.6, 359.9, 180.5},
	{1631.29, 570.09, -0.36, 359.6, 359.8, 92.4},

	-- sf bayside marina
	{-2211.33, 2409.87, -0.43, 359.6, 0.0, 44.9},
	{-2201.27, 2418.48, -0.36, 359.6, 359.8, 46.9},
	{-2221.29, 2398.91, -0.37, 359.6, 359.9, 46.1},
	{-2230.89, 2389.76, -0.38, 359.6, 359.8, 46.2},
	{-2262.95, 2421.31, -0.36, 359.6, 359.8, 226.8},
	{-2253.00, 2430.17, -0.35, 359.6, 359.9, 225.4},
	{-2242.51, 2443.03, -0.34, 359.6, 359.8, 223.2},

}

for i,v in ipairs(ustawioneAuta) do
    local veh = createVehicle(453, v[1], v[2], v[3], v[4], v[5], v[6])
	setElementData(veh,"vehicle:desc","SPRZĄTANIE ŚMIECI")
    toggleVehicleRespawn(veh, true)
	setElementFrozen(veh,true)
    setVehicleColor (veh, 204, 102, 51)
	setVehicleHandling(veh,"maxVelocity",60)
end

addEventHandler("onVehicleEnter", resourceRoot, function(plr, seat)
    if seat == 0 then 
		local v = getPedOccupiedVehicle(plr)
                triggerClientEvent(plr, "PokazKGokno", resourceRoot)
		setElementFrozen(v,false)
		setElementData(v,"viewki",0)
		setElementData(plr,"pracaView",true)
                setPlayerHudComponentVisible (plr, "area_name", false)
	end
	outputChatBox('Rozpocząłeś łowienie ryb, pływaj w dalekie głębiny, w celu łowienia ryb.\nPowyżej 25km/h rozpocznie się naliczanie.\nUwaga nie opuszczaj łódki na środku morza!', plr, 255, 255, 255, true)
end)
addEventHandler("onVehicleExit", resourceRoot, function(plr, seat)
    if seat == 0 then 
				triggerClientEvent(plr, "UsunKGokno", resourceRoot)
    end
end)

oddanie = {
{-1731.28,252.89,-0.55}, -- sf
{-2196.27,2429.11,-0.52}, -- bayside marina
{1570.28,597.93,-0.51}, -- lv
{2944.51,-2078.99,-1.67}, -- ls
}
for _,v in ipairs(oddanie) do
local text = createElement("text")
setElementData(text,"name","ZSYP ŚMIECI")
setElementPosition(text,v[1],v[2],v[3]+1)
marker = createMarker(v[1],v[2],v[3]-15, "checkpoint", 5, 204, 102, 51, 100)
end
addEventHandler("onMarkerHit",resourceRoot,function(element,md)
	local type = getElementType(element)
	if type == "player" then
	if not getPedOccupiedVehicle(element) then return end
local v = getPedOccupiedVehicle(element)
local veh=getPedOccupiedVehicle(element)
if getVehicleController(veh) ~= element then return end
	if getElementData(v,"viewki") then 
	local viewki = getElementData(v,"viewki",view)
	setElementData(element,"pracaView",false)
	setElementData(v,"viewki",0)
	uid = getElementData(element, "player:sid")
	--	givePlayerMoney(element,string.format("%01d",viewki*450000))
	    exports["pystories-db"]:dbSet("update pystories_users set kutry = kutry + ? where id = ?", viewki,getElementData(element, "player:sid"))
		exports["pystories-db"]:dbSet("update pystories_users set bank_money = bank_money + ? where id = ?", viewki*450 ,getElementData(element, "player:sid"))
        outputChatBox ("[PREMIUM] Otrzymujesz "..string.format("%01d",viewki*450).." $ i "..math.floor(viewki).." REP za "..string.format("%0.1f",viewki).." kg zebranych śmieci.\nPieniądze trafiły do bankomatu.", element,255, 255, 255,true)
		triggerClientEvent("sweeper:exp",element,math.floor(viewki))
end
end
end)
function respawnVehicles()
    for i,v in ipairs(getElementsByType("vehicle", resourceRoot)) do
        if not getVehicleOccupant(v) then
            respawnVehicle(v)
	        setElementData(v,"vehicle:fuel",100)
	        setElementFrozen(v,true)
	        setElementData(v,"vehicle:desc","Łowienie ryb")
	        setElementData(v,"viewki",0)
        end
    end
end
setTimer(respawnVehicles, 5000, 0)

function showTop()
    local query = exports['pystories-db']:dbGet('SELECT * FROM pystories_users order by kutry desc')
    local top = {}

    for i=1, 10 do
        table.insert(top, {name=query[i].login, viewki=query[i].kutry})
    end

    return top
end

addEvent('showTop', true)
addEventHandler('showTop', resourceRoot, function( player )
    triggerClientEvent(player, 'showTop:client', resourceRoot, showTop())
end)