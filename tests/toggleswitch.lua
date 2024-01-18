local ui = require("ui")
local sys = require("sys")
local uiex = require("ecluart.uiextension")

local win = ui.Window("ToggleSwitch", "fixed", 320, 250)
win:status()

local switch1 = uiex.ToggleSwitch(win, false, 100, 50, 32, 32)
local switch2 = uiex.ToggleSwitch(win, true, 100, 100, 50, 50)

win:status(tostring(switch1.checked) .. " / " .. tostring(switch2.checked))

local button = ui.Button(win, "On/Off", 10, 10, 100, 40)

function button:onClick()
  switch1.checked = not switch1.checked
  switch2.checked = not switch2.checked
  win:status(tostring(switch1.checked) .. " / " .. tostring(switch2.checked))
end

ui.run(win):wait()
