--[[
Author: Skrampy, Miniek
--]]
function lista_styli ( commandName )
    local jakistyl = getPedWalkingStyle(localPlayer)
    --if jakistyl < 1 then
        --outputChatBox("✔ #FFFFFFStyle chodzenia dostępne na serwerze #00FF00✔", 0, 255, 0, true)
        --outputChatBox("#FFFFFFTwój styl to domyślny.", 0, 255, 0, true)
    --end
    if jakistyl > 128 then
        if jakistyl < 130 then
            outputChatBox("#00FF00>> #FFFFFFStyle chodzenia dostępne na serwerze:", 0, 255, 0, true)
			outputChatBox("")
            outputChatBox("✔ #FFFFFFTwój styl: #FF8C00kobieta", 0, 255, 0, true)
        end

    elseif jakistyl > 127 then
        if jakistyl < 129 then
            outputChatBox("#00FF00>> #FFFFFFStyle chodzenia dostępne na serwerze:", 0, 255, 0, true)
			outputChatBox("")
            outputChatBox("✔ #FFFFFFTwój styl: #FF8C00SWAT", 0, 255, 0, true)
        end
    elseif jakistyl > 120 then
        if jakistyl < 122 then
            outputChatBox("#00FF00>> #FFFFFFStyle chodzenia dostępne na serwerze:", 0, 255, 0, true)
			outputChatBox("")
            outputChatBox("* #FFFFFFTwój styl: #FF8C00gang", 0, 255, 0, true)
        end
    elseif jakistyl > 68 then
        if jakistyl < 70 then
            outputChatBox("#00FF00>> #FFFFFFStyle chodzenia dostępne na serwerze:", 0, 255, 0, true)
			outputChatBox("")
            outputChatBox("✔ #FFFFFFTwój styl: #FF8C00skradanie", 0, 255, 0, true)
        end
    elseif jakistyl > 59 then
        if jakistyl < 61 then
            outputChatBox("#00FF00>> #FFFFFFStyle chodzenia dostępne na serwerze:", 0, 255, 0, true)
			outputChatBox("")
            outputChatBox("✔ #FFFFFFTwój styl: #FF8C00uzbrojony", 0, 255, 0, true)
        end
    elseif jakistyl > 124 then
        if jakistyl < 126 then
            outputChatBox("#00FF00>> #FFFFFFStyle chodzenia dostępne na serwerze:", 0, 255, 0, true)
			outputChatBox("")
            outputChatBox("✔ #FFFFFFTwój styl: #FF8C00sportowiec", 0, 255, 0, true)
        end
    elseif jakistyl > 136 then
        if jakistyl < 138 then
            outputChatBox("#00FF00>> #FFFFFFStyle chodzenia dostępne na serwerze:", 0, 255, 0, true)
			outputChatBox("")
            outputChatBox("#✔ FFFFFFTwój styl: #FF8C00starsza Pani", 0, 255, 0, true)
        end
    elseif jakistyl > 126 then
        if jakistyl < 128 then
            outputChatBox("#00FF00>> #FFFFFFStyle chodzenia dostępne na serwerze:", 0, 255, 0, true)
			outputChatBox("")
            outputChatBox("✔ #FFFFFFTwój styl: #FF8C00niewidomy", 0, 255, 0, true)
        end
    else
        outputChatBox("#00FF00>> #FFFFFFStyle chodzenia dostępne na serwerze:", 0, 255, 0, true)
		outputChatBox("")
        outputChatBox("✔ #FFFFFFTwój styl: #FF8C00domyślny", 0, 255, 0, true)
    end
    outputChatBox("")
	outputChatBox("#00FF00>> #FFFFFF/styl.0 - styl #FF8C00domyślny", 255, 255, 0, true)
	outputChatBox("#00FF00>> #FFFFFF/styl.1 - styl #FF8C00SWAT", 255, 255, 0, true)
	outputChatBox("#00FF00>> #FFFFFF/styl.2 - styl #FF8C00kobieta", 255, 255, 0, true)
	outputChatBox("#00FF00>> #FFFFFF/styl.3 - styl #FF8C00gang", 255, 255, 0, true)
	outputChatBox("#00FF00>> #FFFFFF/styl.4 - styl #FF8C00skradanie", 255, 255, 0, true)
	outputChatBox("#00FF00>> #FFFFFF/styl.5 - styl #FF8C00uzbrojony", 255, 255, 0, true)
	outputChatBox("#00FF00>> #FFFFFF/styl.6 - styl #FF8C00sportowiec", 255, 255, 0, true)
	outputChatBox("#00FF00>> #FFFFFF/styl.7 - styl #FF8C00starsza Pani", 255, 255, 0, true)
	outputChatBox("#00FF00>> #FFFFFF/styl.8 - styl #FF8C00niewidomy", 255, 255, 0, true)

end	

--style

function laska( commandName )
    setPedWalkingStyle(localPlayer,129) 
    outputChatBox ("✔ #FFFFFFPomyślnie ustawiłeś(aś) styl chodzenia na: #FF8C00kobieta", 0, 255, 0, true)
end
function swat( commandName )
    setPedWalkingStyle(localPlayer,128) 
    outputChatBox ("✔ #FFFFFFPomyślnie ustawiłeś(aś) styl chodzenia na: #FF8C00SWAT", 0, 255, 0, true)
end
function cj( commandName )
    setPedWalkingStyle(localPlayer,0) 
    outputChatBox ("✔ #FFFFFFPomyślnie ustawiłeś(aś) styl chodzenia na: #FF8C00domyślny", 0, 255, 0, true)
end
function gang( commandName )
    setPedWalkingStyle(localPlayer,121) 
    outputChatBox ("✔ #FFFFFFPomyślnie ustawiłeś(aś) styl chodzenia na: #FF8C00gang", 0, 255, 0, true)
end
function alaninja( commandName )
    setPedWalkingStyle(localPlayer,69) 
    outputChatBox ("✔ #FFFFFFPomyślnie ustawiłeś(aś) styl chodzenia na: #FF8C00skradanie", 0, 255, 0, true)
end
function uzbrojony( commandName )
    setPedWalkingStyle(localPlayer,60) 
    outputChatBox ("✔ #FFFFFFPomyślnie ustawiłeś(aś) styl chodzenia na: #FF8C00uzbrojony", 0, 255, 0, true)
end
function sportowiec( commandName )
    setPedWalkingStyle(localPlayer,125) 
    outputChatBox ("✔ #FFFFFFPomyślnie ustawiłeś(aś) styl chodzenia na: #FF8C00sportowiec", 0, 255, 0, true)
end
function starebabsko( commandName )
    setPedWalkingStyle(localPlayer,137) 
    outputChatBox ("✔ #FFFFFFPomyślnie ustawiłeś(aś) styl chodzenia na: #FF8C00starsza Pani", 0, 255, 0, true)
end
function niewidomy( commandName )
    setPedWalkingStyle(localPlayer,127) 
    outputChatBox ("✔ #FFFFFFPomyślnie ustawiłeś(aś) styl chodzenia na: #FF8C00niewidomy", 0, 255, 0, true)
end
addCommandHandler("styl.8", niewidomy)
addCommandHandler("styl.7", starebabsko)
addCommandHandler("styl.6", sportowiec)
addCommandHandler("styl.5", uzbrojony)
addCommandHandler("styl.4", alaninja)
addCommandHandler("styl.3", gang)
addCommandHandler("styl.2", laska)
addCommandHandler("styl.1", swat)
addCommandHandler("styl.0", cj)

---

addCommandHandler("style", lista_styli)