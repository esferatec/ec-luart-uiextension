local ui = require("ui")
local sys = require("sys")
local uiex = require("ecluart.uiextension")

local win = ui.Window("ToggleSwitch", "fixed", 320, 250)
win:status()

local switch = uiex.ToggleSwitch(win, false, 10, 10, 32, 32)
win:status(switch.checked)
switch:center()

local button = ui.Button(win, "On/Off", 10, 10, 100, 40)

function button:onClick()
   switch.checked = not switch.checked
   win:status(switch.checked)
end

ui.run(win):wait()