# StrikeEntry

Represents a entry control with a strike-through effect when checked. The onClick event will change the fontstyle property.

![strikeentry](/docs/strikeentry/strikeentry01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Entry](https://www.luart.org/doc/ui/Entry.html) documentation.

The onClick event should not be overridden.

## Constructor

Initializes a new stricke entry instance.

```Lua
StrikeEntry(parent, caption, [x], [y], [width], [height])
```

## Example

```Lua
local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("StrikeEntry", "fixed", 320, 250)

local check = uiex.StrikeEntry(win, "Update uiextension documentation", 10, 10)

check.checked = true

ui.run(win):wait()
```
