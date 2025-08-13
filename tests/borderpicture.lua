local ui = require("ui")
local sys = require("sys")
local uibd = require("ecluart.uiborder")

local win = ui.Window("BoderPicture", "fixed", 320, 250)

local picture = uibd.BorderPicture(win, sys.File(arg[0]).path.."\\LuaRT.png")
picture:center()

ui.run(win):wait()
