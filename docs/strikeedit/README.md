# StrikeEdit

Represents a edit control with a strike-through effect when checked. The onClick event will change the fontstyle property.

![strikeedit](/docs/strikeedit/strikeedit01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Edit](https://www.luart.org/doc/ui/Edit.html) documentation.

The onClick event should not be overridden.

## Constructor

Initializes a new stricke edit instance.

```Lua
StrikeEdit(parent, caption, [x], [y], [width], [height])
```

Parameter | Type | Description
---|---|---
-- | -- | --

## Example

```Lua
local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("StrikeEdit", "fixed", 320, 250)

local check = uiex.StrikeEdit(win, "Update uiextension documentation", 40, 40, 250, 40)

check.checked = true

ui.run(win):wait()
```

![strikeedit](/docs/strikeedit/strikeedit01.png)
