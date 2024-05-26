local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("LinkCheckbox", "fixed", 320, 250)

local link = uiex.LinkCheckbox(win, "About", 10, 10)
link:center()
link.fontstyle = { bold = true }

function link:onClick()
  ui.info("About")
end

ui.run(win):wait()
