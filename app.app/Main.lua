local GUI = require("GUI")
local system = require("System")
local image = require("Image")
local internet = require("Internet")
local filesystem = require("Filesystem")

local currentScriptDirectory = filesystem.path(system.getCurrentScript())

local workspace, window = system.addWindow(GUI.filledWindow(1, 1, 50, 21, 0xF0F0F0))
local layout = window:addChild(GUI.layout(1, 1, 1, 1, 1, 1))

layout:addChild( GUI.image(1, 1, image.load(currentScriptDirectory .. "Icon.pic") ) )

local switch = layout:addChild( GUI.switchAndLabel(1, 1, 41, 6, 0x336DFF, 0xE1E1E1, 0xFFFFFF, 0xA5A5A5, "Перезагрузить ПК после установки", true) ).switch

local installButton = layout:addChild( GUI.button(1, 1, 36, 3, 0xE1E1E1, 0x696969, 0xD2D2D2, 0x3C3C3C, "Установить глючные цвета!") )

installButton.onTouch = function()
    installButton:remove()

    internet.download("https://raw.githubusercontent.com/KKosty4ka/Opencomputers-glitched-colors/master/OS.lua", "/OS.lua")

    if switch.state then
        GUI.alert("Ваш ПК перезапустится!")
        computer.shutdown(true)
    else
        GUI.alert("Перезагрузите ПК!")
    end
end

local removeButton = layout:addChild( GUI.button(1, 1, 36, 3, 0xE1E1E1, 0x696969, 0xD2D2D2, 0x3C3C3C, "Удалить глючные цвета") )

removeButton.onTouch = function()
    removeButton:remove()

    internet.download("https://raw.githubusercontent.com/IgorTimofeev/MineOS/master/OS.lua", "/OS.lua")

    if switch.state then
        GUI.alert("Ваш ПК перезапустится!")
        computer.shutdown(true)
    else
        GUI.alert("Перезагрузите ПК!")
    end
end

window.onResize = function(width, height)
    window.backgroundPanel.width, window.backgroundPanel.height = width, height
    layout.width, layout.height = width, height - layout.localY + 1
end

--------------------------------------------------------------------------------

window:resize(window.width, window.height)
workspace:draw()