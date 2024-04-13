--[[
Author: Deni*
--]]

Version={
	m_string='',
	m_label=nil,
}

local screenWidth, screenHeight=GuiElement.getScreenSize()

function init()
	Version.m_string='GT=RPG.V1'

	Version.m_label=guiCreateLabel(screenWidth-338, screenHeight-15, 250, 18, Version.m_string .. '', false)
	guiSetAlpha(Version.m_label, 0.5)
	guiLabelSetHorizontalAlign(Version.m_label, 'right')
end
init()

function destroy()
	if Version.m_label then
		Version.m_label:destroy()
	end
end

function setString(version)
	Version.m_string=version
	guiSetText(Version.m_label, version)
end

function getString()
	return Version.m_string
end