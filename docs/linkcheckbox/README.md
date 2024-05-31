# LinkCheckbox

Represents a checkbox control that can display an internal link. The onClick event can be used to execute any code. 

![linkcheckbox](/docs/linkcheckbox/linkcheckbox01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Label](https://www.luart.org/doc/ui/Label.html) documentation.

The onHover and onLeave events should not be overridden.

## Constructor

Initializes a new link label instance.

```Lua
LinkCheckbox(parent, link, [x], [y], [width], [height])
```

Parameter | Type | Description
---|---|---
link | string | Sets the internal link.

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
