--[[

Author: Deni*
Stworzone dla serwera GT-RPG
--]]

local packer_job = {

	lv = {
		start_job_marker = {870.25,-25.42,63.95-1.2},
		spawn_vehicle_position = { 877.54, -27.96, 63.18, 359.13, 0.00, 152.73},
		get_vehicles_marker = {867.83,-16.06,63.19-1.2},
	},
	
}

local t2=createElement("text")
setElementPosition(t2,877.54, -27.96, 63.18)
setElementData(t2,"name","Spawn pojazdu\nZakaz zastawiania")

local t=createElement("text")
setElementPosition(t,870.25,-25.42,63.95)
setElementData(t,"name","Przewóz drewna\nWymagania: 500RP, Kat. B")

local t2=createElement("text")
setElementPosition(t2, 867.83,-16.06,63.19)
setElementData(t2,"name","Punkt załadunku\ndrewna")

for i,v in pairs(packer_job) do
	local job_marker = createMarker(v.start_job_marker[1],v.start_job_marker[2],v.start_job_marker[3],"cylinder",1.6,255,0,0,150)
	local colsphere = createColSphere(v.spawn_vehicle_position[1],v.spawn_vehicle_position[2],v.spawn_vehicle_position[3],7)
    createBlip(870.25,-25.42,63.95,46,2,255,0,0,255,0,100)
	setElementData(job_marker,"spawn",v.spawn_vehicle_position)
	setElementData(job_marker,"start_job",true)
	setElementData(job_marker,"colsphere",colsphere)
	
	local vehicle_marker = createMarker(v.get_vehicles_marker[1],v.get_vehicles_marker[2],v.get_vehicles_marker[3],"cylinder",3,0,255,255,20)
	setElementData(vehicle_marker,"get_vehicles",true)
end

 -- pozycje pojazdów na packerze
local transport_vehicles_positions = {
	{0.4,-2.5,0.3,0,0,0},
	{-0.4,-2.5,0.3,0,0,0},
	{0,-2.5,0.55,0,0,0},
	{0,-2.5,0.26,0,0,0},
}
local transport_vehicles_models = {18609} -- modele pojazdów, które można transportować

local function load_vehicles(vehicle,x,y,z,rx,ry,rz)
	for i,v in pairs(transport_vehicles_positions) do
		local model = math.random(1,#transport_vehicles_models)
		local veh = createObject(transport_vehicles_models[model],x,y,z,rx,ry,rz)
		setObjectScale ( veh, 0.33 )
		attachElements(veh,vehicle,v[1],v[2],v[3],v[4],v[5],v[6])
		setElementCollisionsEnabled(veh,false)
	end
end

local function hit_marker(el,md)
	if getElementType(el) ~= "player" or not md then return end
	if getElementData(source,"start_job") then
	
			if getElementData(el,"player:license:pjB") ~= 1 then
		exports["1"]:outputNotificationBox (el,"#cc0000Aby tu pracować musisz mieć zdane prawo jazdy kat. B!")			
		return
	end		
	
		if getElementData(el,"player:reputation") < 500 then
		exports["1"]:outputNotificationBox (el,"#cc0000Aby tu pracować musisz mieć 500RP!")			
		return
	end		
	
		if getPedOccupiedVehicle(el) then return end
		triggerClientEvent(el,"show_gui",resourceRoot,source)
	elseif getElementData(source,"get_vehicles") then
		if not getElementData(el,"packer_job") then return end
		local veh = getPedOccupiedVehicle(el)
		if veh then
			if getElementData(veh,"loaded") or getElementModel(veh) ~= 422 then exports["1"]:outputNotificationBox (el, "#cc0000Jedź do punktu oznaczonego blipem #0000cc'C'#cc0000") exports["1"]:outputNotificationBox (el, "#cc0000Drewno zostało już załadowane!") return end
			setElementFrozen(veh,true)
			toggleControl(el,"enter_exit",false)
			exports["1"]:outputNotificationBox (el, "#00ccccTrwa ładowanie drewna")
			setTimer(function(plr,veh)
				local x,y,z = getElementPosition(veh)
				local rx,ry,rz = getElementRotation(veh)
				load_vehicles(veh,x,y,z,rx,ry,rz)
				exports["1"]:outputNotificationBox (el, "#00cc00Ruszaj do punktu oznaczonego blipem #00cccc'C'")
				exports["1"]:outputNotificationBox (el, "#00cc00Drewno załadowane!")
				setElementFrozen(veh,false)
				setElementData(veh,"loaded",true)
				toggleControl(plr,"enter_exit",true)
				triggerClientEvent(plr,"transport_started",resourceRoot)
			end,5000,1,el,veh)
		end
	end
end
addEventHandler("onMarkerHit",resourceRoot,hit_marker)

addEvent("job_started",true)
local function job_started(marker)
	local colsphere = getElementData(marker,"colsphere")
	if #getElementsWithinColShape(colsphere,"vehicle") > 0 then
		exports["1"]:outputNotificationBox (client, "#cc0000Spawn pojazdu zablokowany!")
	return end
	local spawn = getElementData(marker,"spawn")
	local veh = createVehicle(422,spawn[1],spawn[2],spawn[3],spawn[4],spawn[5],spawn[6])	
	warpPedIntoVehicle(client,veh)
	setElementData(veh,"vehicle:mileage", math.random(1000,50000))
	setElementData(veh,"vehicle:fuel",100)
	setElementData(veh,"vehicle:desc","Przewóz drewna")
	toggleControl(client,"special_control_down",false)
	toggleControl(client,"special_control_up",false)
	setElementData(client,"packer_job",true)
	exports["1"]:outputNotificationBox (client, "#00cc00Jedź załadować drewno do punktu załadunku")
	exports["1"]:outputNotificationBox (client, "#00cc00Przewóz drewna")
	exports["1"]:outputNotificationBox (client, "#00cc00Rozpoczynasz pracę:")
	triggerClientEvent("set_component",resourceRoot,veh)
end
addEventHandler("job_started",resourceRoot,job_started)	

local function end_job(veh)
	local cars = getAttachedElements(veh)
	for i,v in pairs(cars) do
		destroyElement(v)
	end
	destroyElement(veh)
end

addEvent("unload_vehicles",true)
local function unload_vehicles(veh)
	setElementFrozen(veh,true)
	toggleControl(client,"enter_exit",false)
	setTimer(function(plr,veh)
		local cars = getAttachedElements(veh)
		for i,v in pairs(cars) do
			destroyElement(v)
		end
		setElementData(veh,"loaded",false)
		givePlayerMoney(plr, 112700)
		rnd=math.random(1,2)
		repek = getElementData(plr,"player:reputation")
		repka=repek+rnd
		setElementData(plr,"player:reputation",repka)
		setElementFrozen(veh,false)
		toggleControl(plr,"enter_exit",true)
		exports["1"]:outputNotificationBox (plr, "#00cc00Możesz teraz zakończyć pracę lub wrócić po drewno!")
		exports["1"]:outputNotificationBox (plr, "#00cc00Za dostarczenie drewna otrzymujesz #00cccc700 #00cc00PLN#00cccc"..rnd.."#00cc00 RP")
	end,5000,1,client,veh)
end
addEventHandler("unload_vehicles",resourceRoot,unload_vehicles)

local function vehicle_exit(plr,seat)
	if seat == 0 then
		setElementData(plr,"packer_job",false)
		end_job(source)
		triggerClientEvent(plr,"remove_checkpoint",resourceRoot)
		toggleControl(plr,"special_control_down",true)
		toggleControl(plr,"special_control_up",true)
		exports["1"]:outputNotificationBox (plr, "#cc0000Zakończyłeś pracę!")
	end
end
addEventHandler("onVehicleExit",resourceRoot,vehicle_exit)

local function player_quit(plr, seat)
	if seat == 0 then
		setElementData(plr,"packer_job",false)
		end_job(source)
		triggerClientEvent(plr,"remove_checkpoint",resourceRoot)
		toggleControl(plr,"special_control_down",true)
		toggleControl(plr,"special_control_up",true)
		exports["1"]:outputNotificationBox (plr, "#cc0000Zakończyłeś pracę!")
	end
end
addEventHandler("onPlayerQuit",root,player_quit)

local function cancel_enter(plr,seat)
	if seat == 0 then
		cancelEvent()
	end
end
addEventHandler("onVehicleStartEnter",resourceRoot,cancel_enter)