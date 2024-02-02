# StrikeCheckbox

Represents a checkbox control with a strike-through effect on its label when checked. The onClick event will change the fontstyle property.

![strikecheckbox](/docs/strikecheckbox/strikecheckbox01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Checkbox](https://www.luart.org/doc/ui/Checkbox.html) documentation.

The onClick event should not be overridden.

## Constructor

Initializes a new stricke checkbox instance.

```Lua
StrikeCheckbox(parent, caption, [x], [y], [width], [height])
```

Parameter | Type | Description
---|---|---
-- | -- | --

## Example

```Lua
local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("StrikeCheckbox", "fixed", 320, 250)

local check = uiex.StrikeCheckbox(win, "Update uiextension documentation", 10, 10)
check:center()

check.checked = true

ui.run(win):wait()
```

![strikecheckbox](/docs/strikecheckbox/strikecheckbox01.png)
