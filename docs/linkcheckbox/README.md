# LinkCheckbox

Represents a checkbox control that can display an internal link. The onClick event can be used to execute any code. 

![linkcheckbox](/docs/linkcheckbox/linkcheckbox01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Checkbox](https://www.luart.org/doc/ui/Checkbox.html) documentation.

The onHover and onLeave events should not be overridden.

## Constructor

Initializes a new link checkbox instance.

```Lua
LinkCheckbox(parent, caption, [x], [y], [width], [height])
```

Parameter | Type | Description
---|---|---
-- | -- | --

## Example

```Lua
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
```

![linkcheckbox](/docs/linkcheckbox/linkcheckbox01.png)
