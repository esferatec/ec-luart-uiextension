# LinkLabel

Represents a text label control that can display an internal link. The onClick event can be used to execute any code.

![linklabel](/docs/linklabel/linklabel01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Label](https://www.luart.org/doc/ui/Label.html) documentation.

The onHover and onLeave events should not be overridden.

## Constructor

Initializes a new link label instance.

```Lua
LinkLabel(parent, caption, [x], [y], [width], [height])
```

Parameter | Type | Description
---|---|---
-- | -- | --

## Example

```Lua
local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("LinkLabel", "fixed", 320, 250)

local link = uiex.LinkLabel(win, "About", 10, 10)
link:center()

function link:onClick()
  ui.info("About")
end

ui.run(win):wait()
```

![linklabel](/docs/linklabel/linklabel01.png)
