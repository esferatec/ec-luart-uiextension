local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("LinkLabel", "fixed", 320, 250)

local link = uiex.LinkLabel(win, "About")
link:center()

function link:onClick()
  ui.info("About")
end

ui.run(win):wait()
