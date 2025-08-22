# DirectoryEntry

Represents a entry control with a button that allows the user to easily select a file.

![directoryentry](/docs/directoryentry/directoryentry01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Entry](https://www.luart.org/doc/ui/Entry.html) documentation.

## Constructor

Initializes a new directory entry instance.

```Lua
DirectoryEntry(parent, caption, [x], [y], [width], [height])
```

## Example

```Lua
local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("DirectoryEntry", "fixed", 320, 250)

local entry = uiex.DirectoryEntry(win, "", 40, 80, 250, 22)
entry.fontstyle = { bold = true }

ui.run(win):wait()
```
