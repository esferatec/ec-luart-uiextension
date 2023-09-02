local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("Hyperlink", "fixed", 320, 250)

local link = uiex.HyperLink(win, "www.luart.org")
link:center()

win:show()

while win.visible do
  ui.update()
end