# FileLink

Represents a text label control that can display an external link. The onClick event will open the file in the file explorer.

![filelink](/docs/filelink/filelink01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Label](https://www.luart.org/doc/ui/Label.html) documentation.

The onHover, onLeave and onClick events should not be overridden.

## Constructor

Initializes a new file link instance.

```Lua
FileLink(parent, caption, [x], [y], [width], [height])
```

## Property - LINK

Sets or gets the external link.

```Lua
FileLink.link (string)
```

## Example

```Lua
local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("FileLink", "fixed", 320, 250)

local link = uiex.FileLink(win, "lua54.dll")
link.link = "C:\\LuaRT\\lua54.dll"
link:center()

ui.run(win):wait()
```
